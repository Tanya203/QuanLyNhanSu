using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class AuthorizationBUS
    {
        public readonly AuthorizationDAL authorizationDAL;
        public AuthorizationBUS()
        {
            authorizationDAL = new AuthorizationDAL();
        }
        public IEnumerable<AuthorizationViewModels> GetAllAuthorization(string sort)
        {
            return authorizationDAL.GetAllAuthorization(sort);
        }
        public IEnumerable<AuthorizationViewModels> GetAllAuthorizationSearch(string sort, string search)
        {
            return authorizationDAL.GetAllAuthorizationSearch(sort, search);
        }
        public IEnumerable<Authorization> GetAuthorizations()
        {
            return authorizationDAL.GetAuthorization();
        }
        public bool Save(Authorization au)
        {
            return authorizationDAL.Save(au);
        }
        public bool AddPosition(List<Authorization> authorization)
        {
            return authorizationDAL.AddPosition(authorization);
        }
    }
}
