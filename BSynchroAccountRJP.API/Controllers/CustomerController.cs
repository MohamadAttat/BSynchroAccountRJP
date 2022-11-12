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
    [Route("api/[controller]")]
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
        public Customer GetById(int Id)
        {
            return this._customerRepos.GetById(Id, "Accounts");
        }
    }
}
