using BSynchroAccountRJP.API.ViewModels;
using BSynchroAccountRJP.Models.Model;
using BSynchroAccountRJP.Services.Infrastructure;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace BSynchroAccountRJP.API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly IAccount _accountRepos;
        private readonly ICustomer _customerRepos;
        private readonly ITransaction _transactionRepos;
        public CustomerController(IAccount accountRepos, ICustomer customerRepos, ITransaction transactionRepos)
        {
            _accountRepos = accountRepos;
            _customerRepos = customerRepos;
            _transactionRepos = transactionRepos;
        }

        [HttpGet]
        public async Task<JsonResult> GetCustomers()
        {
            var json = JsonConvert.SerializeObject(this._customerRepos.GetAll(null, m => m.OrderBy(x => x.Name)));
            return new JsonResult(json);
        }

        [HttpGet("{Id:int}")]
        public async Task<Customer> GetById(int Id)
        {
            //loading the customer along with his accounts and his accounts transactions in a nested object
            return this._customerRepos.GetById(Id, "Accounts,Accounts.Transactions");
        }
    }
}
