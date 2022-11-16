using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoUongOnline.DB;

namespace DoUongOnline.Controllers
{
    public class HomeController : Controller
    {
        BanHangEntities db = new BanHangEntities();
        public ActionResult Index(string Search)
        {
            List<SanPham> sanpham = db.SanPhams.ToList();
            if (Search != null)
            {
                var FindData = db.SanPhams.Where(x => x.IdLoaiSP.Contains(Search)).ToList();
                if (FindData.Count == 0)
                {
                    ViewBag.Msg = "Data Not Found";
                    return View();
                }
                else
                {
                    return View(FindData);
                }
            }
            var obj = db.SanPhams.ToList();
            return View(obj);
        }     
        public ActionResult ListProduct()
        {
            return View(db.SanPhams.ToList());

        }

        public ActionResult Details(int id)
        {
            var sp = db.SanPhams.Find(id);
            Session["hinhanhh"] = sp.HinhAnh;
            return View(db.SanPhams.Where(s => s.IdSP == id).FirstOrDefault());
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult TinTuc()
        {
            return View();
        }
        
    }
}