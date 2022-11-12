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
    public class AccountController : ControllerBase
    {
        private readonly IAccount _accountRepos;
        private readonly ICustomer _customerRepos;
        private readonly ITransaction _transactionRepos;
        public AccountController(IAccount accountRepos, ICustomer customerRepos, ITransaction transactionRepos)
        {
            _accountRepos = accountRepos;
            _customerRepos = customerRepos;
            _transactionRepos = transactionRepos;
        }

        [HttpPost]
        public async Task<JsonResult> Open(OpenAccountVM VM)
        {
            int customerId = VM.CustomerId;
            decimal initialCredit = VM.InitialCredit;

            var customer = this._customerRepos.GetById(customerId);
            if (customer == null)
            {
                return new JsonResult("customer-not-found");
            }
            Account acc = new Account(customerId, initialCredit);
            _accountRepos.Create(acc);
            //after saving, the id is now inside the acc object
            _accountRepos.Save();
            //create transaction if initial credit != 0 
            if (acc.Balance != 0)
            {
                //creating a transaction as deposit (default type)
                Transaction tr = new Transaction(acc.Id, initialCredit);
                this._transactionRepos.Create(tr);
                this._transactionRepos.Save();
            }
            var json = JsonConvert.SerializeObject(new { acc.Id, acc.CustomerId, acc.Balance,acc.Customer.Name });
            return new JsonResult(json);
        }
    }
}
