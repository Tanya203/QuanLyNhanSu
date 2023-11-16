using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    internal class AuthorityDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public AuthorityDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<Authority> GetAuthority()
        {
            return quanLyNhanSu.Authorities.OrderBy(au => au.AuthorityName).ToList();
        }
    }
}
