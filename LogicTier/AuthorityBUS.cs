using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class AuthorityBUS
    {
        private readonly AuthorityDAL authorityDAL;
        public AuthorityBUS()
        {
            authorityDAL = new AuthorityDAL();
        }
        public IEnumerable<Authority> GetAuthority()
        {
            return authorityDAL.GetAuthority();
        }
    }
}
