using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using LMS.Models;
using Microsoft.AspNetCore.Session;
using System.Data;
using Microsoft.AspNetCore.Http;
using System.Globalization;

namespace LMS.Pages.Guest
{
    public class AllCoursesModel : PageModel
    {
        private DB _db;
        public DataTable dt = new DataTable();
        public DataTable _material = new DataTable();
        
        public void OnGet()
        {
            _db = new DB();
            dt = _db.getallcourses();

        }
        public IActionResult OnPostViewmaterial(string code)
        {
            HttpContext.Session.SetString("ccode",code);
           
            return RedirectToPage("/Guest/Viewmaterialcshtml");
        }
    }
}
