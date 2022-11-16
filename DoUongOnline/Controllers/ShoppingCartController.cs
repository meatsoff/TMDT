using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Braintree;
using DoUongOnline.DB;

namespace DoUongOnline.Controllers
{
    public class ShoppingCartController : Controller
    {
        BanHangEntities database = new BanHangEntities();

        // GET: ShoppingCart
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ShowCart()
        {
            if (Session["Cart"] == null)
            {
                return View("EmptyCart");
            }
            Cart _cart = Session["Cart"] as Cart;
            return View(_cart);
        }

        // Action tạo mới giỏ hàng
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }

        // Action thêm sản phẩm vào giỏ hàng
        public ActionResult AddToCart(int id, string SetSize, FormCollection form)
        {
            if (Session["customer"] != null)
            {
                var _sp = database.SanPhams.SingleOrDefault(s => s.IdSP == id); // Lấy sản phẩm theo id
                if (_sp != null)
                {
                    int quantity;
                    if (_sp.SoLuongCon >= Convert.ToInt32(form["txtSoLuong"]))
                    {
                        quantity = Convert.ToInt32(form["txtSoLuong"]);
                        //quantity++;
                    }
                    else
                    {
                        quantity = (int)_sp.SoLuongCon;
                    }
                    GetCart().Add_Product_Cart(SetSize, _sp, quantity);

                    //int quantity = Convert.ToInt32(form["txtSoLuong"]);
                    ////quantity++;
                    //GetCart().Add_Product_Cart(_sp, quantity);
                }
                TempData["Add_Product_Success"] = _sp.TenSP;
                return RedirectToAction("Index", "Home");
                //return RedirectToAction("ShowCart", "ShoppingCart");
            }
            else
            {
                return RedirectToAction("Login", "Customer");
            }
        }

        // Cập nhật số lượng sản phẩm và tính lại tổng tiền
        public ActionResult Update_Cart_Quantity(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            int id_sp = int.Parse(form["IdSP"]);
            int _quantity = int.Parse(form["cartQuantity"]);
            cart.Update_quantity(id_sp, _quantity);
            return RedirectToAction("ShowCart", "ShoppingCart");
        }

        // Xóa dòng sản phẩm trong giỏ hàng
        public ActionResult RemoveCart(int id, string size)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartIem(id, size);
            return RedirectToAction("ShowCart", "ShoppingCart");
        }

        // Lấy tổng số lượng sản phẩm có trong giỏ hàng
        public PartialViewResult BagCart()
        {
            int total_quantity_item = 0;
            Cart cart = Session["Cart"] as Cart;
            if (cart != null)
            {
                total_quantity_item = cart.Total_quantity();
            }
            ViewBag.QuantityCart = total_quantity_item;
            return PartialView("BagCart");
        }

        public ActionResult ClearCart()
        {
            Cart cart = Session["Cart"] as Cart;
            cart.ClearCart();
            return RedirectToAction("ShowCart", "ShoppingCart");
        }

        [HttpPost]
        public ActionResult Pay(FormCollection form)
        {
            decimal tienthanhtoan = Convert.ToDecimal(form["tongdon"]);
            var gateway = new BraintreeGateway("sandbox", "rmpzt6z9vw4ncg6k", "g43mtx369k94cgnx", "ffd93faa781b7f4a5f7406126686d043");
            var request = new TransactionRequest
            {
                Amount = tienthanhtoan,
                PaymentMethodNonce = form["nonce"],
                DeviceData = form["deviceData"],
                Options = new TransactionOptionsRequest
                {
                    SubmitForSettlement = true
                }
            };

            Result<Transaction> result = gateway.Transaction.Sale(request);
            if (result.IsSuccess())
            {
                Session["MessagePayment"] = "";
                Cart cart = Session["Cart"] as Cart;

                if (cart.Total_money() == 0)
                {
                    Session["MessageTotalQuantity"] = "";
                    return RedirectToAction("Index", "Home");
                }
                else if (cart.Total_quantity() > 1000)
                {
                    Session["MessageTotalQuantity"] = "Không được đặt đơn có số lượng lớn hơn 1000 ly.";
                    return RedirectToAction("ShowCart", "ShoppingCart");
                }
                else
                {
                    Session["MessageTotalQuantity"] = "";
                    // Tạo mới đơn hàng
                    DonHang donhang = new DonHang();
                    int idKH = Convert.ToInt32(Session["customer_id"]);
                    var khachhang = database.KhachHangs.Where(kh => kh.IdKH == idKH).FirstOrDefault();
                    // Lưu thông tin đơn hàng
                    donhang.NgayTaoDon = DateTime.Now;

                    // Set địa chỉ giao hàng
                    if (form["diachigiaohang"] == "")    //Người dùng không thay đổi địa chỉ giao hàng
                    {
                        donhang.DiaChiGiaoHang = khachhang.DiaChi;
                    }
                    else
                    {
                        donhang.DiaChiGiaoHang = form["diachigiaohang"];
                    }
                    donhang.GhiChu = form["ghichudonhang"];

                    // Kiểm tra khách hàng có sử dụng điểm thưởng hay không
                    if (tienthanhtoan == cart.Total_money())   // Tổng đơn = tổng cộng số tiền các món đã chọn, nếu khách hàng không dùng điểm
                    {
                        donhang.TongTien = (double)cart.Total_money();
                        donhang.DiemKHSuDung = 0;
                    }
                    else
                    {
                        donhang.TongTien = (double)tienthanhtoan;     // Thay đổi giá trị tổng tiền của đơn hàng
                        donhang.DiemKHSuDung = khachhang.DiemTichLuy;
                        khachhang.DiemTichLuy = 0;
                    }

                    donhang.IdKH = (int)Session["customer_id"];
                    donhang.IdTinhTrangDH = "1";
                    donhang.NgayGioCapNhat = DateTime.Now;
                    database.DonHangs.Add(donhang);

                    // Tạo chi tiết đơn hàng
                    foreach (var item in cart.Items)
                    {
                        // Tạo chi tiết đơn hàng
                        ChiTietDonHang ctdh = new ChiTietDonHang();
                        ctdh.SoLuong = item._quantity;
                        ctdh.GhiChuChiTiet = "";
                        ctdh.GiaBan = item._sanpham.GiaBan;
                        ctdh.IdSP = item._sanpham.IdSP;
                        if (item._size == "Vừa")
                        {
                            ctdh.IdSizeSP = "S01";
                        }
                        else
                        {
                            ctdh.IdSizeSP = "S02";
                        }
                        ctdh.IdDH = donhang.IdDH;
                        ctdh.DanhGiaSanPham = 5;
                        database.ChiTietDonHangs.Add(ctdh);

                        // Xử lý cập nhật lại số lượng tồn trong bảng SanPham
                        foreach (var p in database.SanPhams.Where(s => s.IdSP == ctdh.IdSP)) // Lấy IdSP đang có trong giỏ hàng
                        {
                            var update_quan_sp = p.SoLuongCon - item._quantity; // Số lượng tồn mới = số lượng tồn - số lượng đã mua
                            p.SoLuongCon = update_quan_sp;
                        }
                    }

                    khachhang.DiemTichLuy += (int)((double)tienthanhtoan * 0.02);
                    //khachhang.ConfirmPass = khachhang.MatKhau;
                    database.SaveChanges();
                    cart.ClearCart();
                    TempData["Pay"] = donhang;
                    return RedirectToAction("OrderDetail", "Order", new { id = donhang.IdDH });
                }
            }
            else
            {
                // Handle errors
                Session["MessageTotalQuantity"] = "";
                Session["MessagePayment"] = "Thanh toán không thành công! Vui lòng xem lại thông tin thẻ.";
                return RedirectToAction("ShowCart", "ShoppingCart"); 
            }           
        }
    }
}