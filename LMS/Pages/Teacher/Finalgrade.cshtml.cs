using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using LMS.Models;
using Microsoft.AspNetCore.Session;
using System.Data;
using Microsoft.AspNetCore.Http;
using System.Globalization;
namespace LMS.Pages.Teacher
{
    public class FinalgradeModel : PageModel
    {
        private DB _db;

        public FinalgradeModel() {
            _db = new DB();
        }
        public void OnGet()
        {
        }


    }
}
