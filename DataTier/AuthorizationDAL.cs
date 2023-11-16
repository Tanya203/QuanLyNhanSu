using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class AuthorizationDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public AuthorizationDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<AuthorizationViewModels> GetAllAuthorization(string sort)
        {
            var authorizationList = quanLyNhanSu.Authorizations.Select(x => new AuthorizationViewModels
            {
                AU_ID = x.AU_ID,
                PS_ID = x.PS_ID,
                IT_ID = x.Authority.Interface.IT_ID,
                AuthorityName = x.Authority.AuthorityName,
                Interface = x.Authority.Interface.InterfaceName,
                DepartmentName = x.Position.Department.DepartmentName,
                PositionName = x.Position.PositionName,
                Authorize = x.Authorize,
            });
            if (sort.Contains("PS"))
                authorizationList = authorizationList.Where(au => au.PS_ID == sort).OrderBy(au => au.AU_ID);
            else if (sort.Contains("AU"))
                authorizationList = authorizationList.Where(au => au.AU_ID == sort).OrderBy(au => au.AU_ID);
            else if (sort.Contains("IT"))
                authorizationList = authorizationList.Where(au => au.IT_ID == sort).OrderBy(au => au.AU_ID);
            return authorizationList;
        }
        public IEnumerable<AuthorizationViewModels> GetAllAuthorizationSearch(string sort ,string search)
        {
            var authorizationList = quanLyNhanSu.Authorizations.Select(x => new AuthorizationViewModels
            {
                AU_ID = x.AU_ID,
                PS_ID = x.PS_ID,
                IT_ID = x.Authority.Interface.IT_ID,
                AuthorityName = x.Authority.AuthorityName,
                Interface = x.Authority.Interface.InterfaceName,
                DepartmentName = x.Position.Department.DepartmentName,
                PositionName = x.Position.PositionName,
                Authorize = x.Authorize,
            });
            if (sort.Contains("PS"))
                authorizationList = authorizationList.Where(au => au.PS_ID == sort).OrderBy(au => au.AU_ID);
            else if (sort.Contains("AU"))
                authorizationList = authorizationList.Where(au => au.AU_ID == sort).OrderBy(au => au.AU_ID);
            else if (sort.Contains("IT"))
                authorizationList = authorizationList.Where(au => au.IT_ID == sort).OrderBy(au => au.AU_ID);
            authorizationList = authorizationList.Where(au => au.AU_ID.Contains(search) ||
                                                        au.PS_ID.Contains(search) ||
                                                        au.AuthorityName.Contains(search) ||
                                                        au.Interface.Contains(search) ||
                                                        au.DepartmentName.Contains(search) ||
                                                        au.PositionName.Contains(search));
            return authorizationList;
        }
        
        public IEnumerable<Authorization> GetAuthorization()
        {
            return quanLyNhanSu.Authorizations.OrderBy(au => au.PS_ID).ToList();
        }
        public bool Save(Authorization au)
        {
            try
            {
                quanLyNhanSu.Authorizations.AddOrUpdate(au);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public bool AddPosition(List<Authorization> authorization)
        {
            try
            {
                foreach(Authorization au in authorization)
                {
                    quanLyNhanSu.Authorizations.Add(au);
                }
                quanLyNhanSu.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
    }
}
