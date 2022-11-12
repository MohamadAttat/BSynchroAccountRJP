using BSynchroAccountRJP.Models;
using BSynchroAccountRJP.Models.Model;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace BSynchroAccountRJP.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Customers()
        {
            return View();
        }
        public IActionResult CustomerDetail(int Id)
        {
            return View(Id);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}