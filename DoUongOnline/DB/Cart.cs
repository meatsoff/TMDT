using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoUongOnline.DB
{
    public class CartItem
    {
        public SanPham _sanpham { get; set; }
        public int _quantity { get; set; }
        public string _size { get; set; }
        public string _khuyenmai { get; set; }
    }
    public class Cart
    {
        List<CartItem> items = new List<CartItem>();

        public IEnumerable<CartItem> Items
        {
            get { return items; }
        }

        //Lấy sản phẩm bỏ vào giỏ hàng
        public void Add_Product_Cart(string SetSize, SanPham _sp, int _quan = 1)
        {
            // Kiểm tra sản phẩm có chương trình khuyến mãi hay không
            if (_sp.IdKM == null)   // Sản phẩm không có khuyến mãi
            {
                if (SetSize == "Vang")
                {
                    _sp.GiaBan += 200000;
                    var item = Items.Where(s => s._sanpham.IdSP == _sp.IdSP && s._size == "Vang").FirstOrDefault();
                    if (item == null)
                    {
                        items.Add(new CartItem
                        {
                            _sanpham = _sp,
                            _size = "Vang",
                            _quantity = _quan  

                        });
                    }
                    else
                    {
                        item._quantity += _quan;

                    }
                }
                else
                {
                    var itemVua = Items.Where(s => s._sanpham.IdSP == _sp.IdSP && s._size == "Den").FirstOrDefault();
                    if (itemVua == null)
                    {
                        items.Add(new CartItem
                        {
                            _sanpham = _sp,
                            _size = "Den",
                            _quantity = _quan
                        });
                    }
                    else
                    {
                        itemVua._quantity += _quan;

                    }
                }
            }

            else // Sản phẩm có khuyến mãi
            {
                if (SetSize == "Vang")
                {
                    _sp.GiaBan += 200000;
                    // Kiểm tra ly nước size lớn đã dùng khuyến mãi hay chưa
                    var item = Items.Where(s => s._sanpham.IdSP == _sp.IdSP && s._size == "Vang" && s._khuyenmai == "DaDung").FirstOrDefault();
                    if (item == null)   // Chưa sử dụng
                    {
                        _sp.GiaBan = _sp.GiaBan - (_sp.GiaBan * _sp.KhuyenMai.PhanTramKM) / 100; // Update giá khuyến mãi
                        items.Add(new CartItem
                        {
                            _sanpham = _sp,
                            _size = "Vang",
                            _quantity = 1, 
                            _khuyenmai = "DaDung"

                        });
                    }
                    else    // Đã sử dụng
                    {
                        // Tạo một item mới để lưu sản phẩm với giá không khuyến mãi
                        var itemSauKM = Items.Where(s => s._sanpham.IdSP == _sp.IdSP && s._size == "Vang" && s._khuyenmai == null).FirstOrDefault();
                        if (itemSauKM == null)
                        {
                            items.Add(new CartItem
                            {
                                _sanpham = _sp,
                                _size = "Vang",
                                _quantity = _quan

                            });
                        }
                        else
                        {
                            item._quantity += _quan;
                        }
                    }
                }

                else
                {
                    // Kiểm tra ly nước size nhỏ đã dùng khuyến mãi hay chưa
                    var itemVua = Items.Where(s => s._sanpham.IdSP == _sp.IdSP && s._size == "Den" && s._khuyenmai == "DaDung").FirstOrDefault();
                    if (itemVua == null)    // Chưa sử dụng
                    {
                        _sp.GiaBan = _sp.GiaBan - (_sp.GiaBan * _sp.KhuyenMai.PhanTramKM) / 100; // Update giá khuyến mãi
                        items.Add(new CartItem
                        {
                            _sanpham = _sp,
                            _size = "Den",
                            _quantity = 1,
                            _khuyenmai = "DaDung"
                        });
                    }
                    else    // Đã sử dụng
                    {
                        // Tạo một item mới để lưu sản phẩm với giá không khuyến mãi
                        var itemVuaSauKM = Items.Where(s => s._sanpham.IdSP == _sp.IdSP && s._size == "Den" && s._khuyenmai == null).FirstOrDefault();
                        if (itemVuaSauKM == null)
                        {
                            items.Add(new CartItem
                            {
                                _sanpham = _sp,
                                _size = "Den",
                                _quantity = _quan
                            });
                        }
                        else
                        {
                            itemVua._quantity += _quan;
                        }
                    }
                }
            }
        }

        // Tính tổng số lượng trong giỏ hàng
        public int Total_quantity()
        {
            return items.Sum(s => s._quantity);
        }

        // Tính thành tiền cho mỗi dòng sản phẩm trong giỏ hàng
        public decimal Total_money()
        {
            var total = items.Sum(s => s._quantity * s._sanpham.GiaBan);
            return (decimal)total;
        }

        // Cập nhật lại số lượng sản phẩm ở mỗi dòng sản phẩm khi khách hàng muốn đặt mua thêm
        public void Update_quantity(int id, int _new_quan)
        {
            var item = items.Find(s => s._sanpham.IdSP == id);
            if (item != null)
            {
                if (items.Find(s => s._sanpham.SoLuongCon >= _new_quan) != null)
                {
                    item._quantity = _new_quan;
                }
                else
                {
                    item._quantity = (int)item._sanpham.SoLuongCon;
                }

            }
        }

        // Xóa sản phẩm trong giỏ hàng
        public void Remove_CartIem(int id, string _size)
        {
            if (_size == "Vang")
            {
                items.RemoveAll(s => s._sanpham.IdSP == id && s._size == "Vang");
            }
            else
            {
                items.RemoveAll(s => s._sanpham.IdSP == id && s._size == "Den");
            }

        }

        // Xóa số lượng giỏ hàng sau khi khách hàng thực hiện thanh toán
        public void ClearCart()
        {
            items.Clear();
        }
    }
}