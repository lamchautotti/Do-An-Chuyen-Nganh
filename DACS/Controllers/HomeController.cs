using DACS.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace DACS.Controllers
{
    public class HomeController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        public List<DichVu> SearchByName(string searchString)
        {
            var all_dd = (from ss in data.DichVus select ss).Where(m => /*m.soluongton > 0 &&*/ m.TenDV.Contains(searchString)).ToList();
            return all_dd;
        }
        public ActionResult GetAllDiichVu(int? page, string searchString)
        {
            if (page == null)
            {
                page = 1;
            }
            int page_size = 8;
            int page_num = page ?? 1;
            var all_dv = (from ss in data.DichVus select ss).OrderBy(m => m.MaDV);
            if (searchString != null)
            {
                ViewBag.Keyword = searchString;
                return View(SearchByName(searchString).ToPagedList(page_num, page_size));
            }
            return View(all_dv.ToPagedList(page_num, page_size));
        }

        public ActionResult Index()
        {

            return View();
        }

    }
}