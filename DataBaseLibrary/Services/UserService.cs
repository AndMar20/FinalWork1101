using DataBaseLibrary.Data;
using DataBaseLibrary.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseLibrary.Services
{
    public class UserService
    {
        private readonly FragrandWorldContext _context = new();

        public async Task<bool> IsUserExistAsync(string login, string password)
            => await _context.Users.SingleOrDefaultAsync(u => u.Login == login && u.Password == password) != null;
            
        public async Task<User?> GetUserByLoginAsync(string login)
            => await _context.Users.SingleAsync(u => u.Login == login);
    }
}
