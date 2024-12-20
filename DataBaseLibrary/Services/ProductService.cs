using DataBaseLibrary.Data;
using DataBaseLibrary.Models;
using Microsoft.EntityFrameworkCore;

namespace DataBaseLibrary.Services
{
    public class ProductService
    {
        private readonly FragrandWorldContext _context = new();
        public async Task<List<Product>> GetProductsAsync(string subSting, int? sortMethod, decimal minCost, decimal? maxCost, string? manufacturer)
        {
            IQueryable<Product> products = _context.Products.AsNoTracking();

            // Фильтрация по подстроке в имени
            if (!string.IsNullOrEmpty(subSting))
                products = products.Where(p => EF.Functions.Like(p.Name, $"%{subSting}%"));

            // Фильтрация по минимальной цене
            products = products.Where(p => p.Cost >= minCost);

            // Фильтрация по максимальной цене
            if (maxCost.HasValue)
                products = products.Where(p => p.Cost <= maxCost);

            // Фильтрация по производителю
            if (manufacturer == "System.Windows.Controls.ComboBoxItem: Все производители")
                manufacturer = "";
            if (!string.IsNullOrEmpty(manufacturer))
                products = products.Where(p => p.Manufacturer == manufacturer);

            // Сортировка
            if (sortMethod == 0)
                products = products.OrderBy(p => p.Cost);
            else if (sortMethod == 1)
                products = products.OrderByDescending(p => p.Cost);

            string query = products.ToQueryString();

            return await products.ToListAsync();
        }

        public async Task<List<string>> GetManufacturersAsync()
        {
            var manufacturers = await _context.Products
                .Select(p => p.Manufacturer)
                .Distinct()
                .Where(m => !string.IsNullOrEmpty(m))
                .OrderBy(m => m)
                .ToListAsync();

            return manufacturers;
        }

        public async Task<int> GetProductsCountAsync()
        {
            List<Product> products = await _context.Products.ToListAsync();
            return products.Count();
        }
    }
}
