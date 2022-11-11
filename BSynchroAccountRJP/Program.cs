
using BSynchroAccountRJP.Models.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.Extensions.Options;
using BSynchroAccountRJP.Utility.Data;
using BSynchroAccountRJP.Utility.Infrastructure;
using BSynchroAccountRJP.Utility.Repositories;
using BSynchroAccountRJP.Services.Infrastructure;
using BSynchroAccountRJP.Services.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews().AddJsonOptions(options =>
{
    options.JsonSerializerOptions
.PropertyNamingPolicy = null;
});

builder.Services.AddRazorPages().AddRazorRuntimeCompilation();

builder.Services.AddDistributedMemoryCache();

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(60);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});
#region Repositories Implementation
builder.Services.AddScoped<IRepository<Customer>, Repository<Customer>>();
builder.Services.AddScoped<ICustomer, CustomerRepos>();
builder.Services.AddScoped<IRepository<Account>, Repository<Account>>();
builder.Services.AddScoped<IAccount, AccountRepos>();
builder.Services.AddScoped<IRepository<Transaction>, Repository<Transaction>>();
builder.Services.AddScoped<ITransaction, TransactionRepos>();
#endregion

builder.Services.AddDbContext<AppDBContext>(options => options.UseSqlServer(
    builder.Configuration.GetConnectionString("DefaultCS")
    ));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}


app.UseHttpsRedirection();


app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseCookiePolicy();
app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();