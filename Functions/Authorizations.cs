using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Mapping;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.Functions
{
    public class Authorizations
    {
        private readonly AuthorizationBUS authorizationBUS;
        private readonly InterfaceBUS interfaceBUS;
        private readonly IEnumerable<Authorization> authorizations;
        private readonly string itID;
        public Authorizations(string form, Staff staff)
        {
            authorizationBUS = new AuthorizationBUS();
            interfaceBUS = new InterfaceBUS();
            itID = interfaceBUS.GetInterface().FirstOrDefault(it => it.InterfaceName == form).IT_ID;
            authorizations = authorizationBUS.GetAuthorizations().Where(au => au.Authority.Interface.IT_ID == itID && au.Position.Department.DP_ID == staff.Position.Department.DP_ID && au.PS_ID == staff.PS_ID).ToList();
        }
        public void AuthorizeMainMenu(List<object> listObject)
        {
            int count = 0;
            foreach (Authorization au in authorizations)
            {
                typeof(Button).GetProperty("Visible").SetValue(listObject[count], au.Authorize);
                count++;
            }
        }
        public string AuthorizeForm(List<object> input, List<object> function)
        {
            string authority = "none";
            foreach (Authorization au in authorizations)
            {
                if (au.Authority.AuthorityName.Contains("Thao tác") && au.Authorize)
                {
                    authority = "operate";
                    if (input != null)
                    {                       
                        foreach (object i in input)
                        {
                            if (i is TextBox)
                                typeof(TextBox).GetProperty("ReadOnly").SetValue(i, !au.Authorize);
                            if (i is ComboBox)
                                typeof(ComboBox).GetProperty("Enabled").SetValue(i, au.Authorize);
                            if (i is DateTimePicker)
                                typeof(DateTimePicker).GetProperty("Enabled").SetValue(i, au.Authorize);
                            if (i is CheckBox)
                                typeof(CheckBox).GetProperty("Enabled").SetValue(i, au.Authorize);
                            if (i is RadioButton)
                            {
                                typeof(RadioButton).GetProperty("Enabled").SetValue(i, au.Authorize);
                                RadioButton radioButton = (RadioButton)i;
                                if (radioButton.Text == "Nam")
                                    radioButton.Checked = true;
                            }
                            if (i is RichTextBox)
                                typeof(RichTextBox).GetProperty("ReadOnly").SetValue(i, !au.Authorize);
                        }
                    }
                    if(function != null)
                    {
                        foreach (object func in function)
                        {
                            if (func is Button)
                            {
                                typeof(Button).GetProperty("Visible").SetValue(func, au.Authorize);
                                Button button = (Button)func;
                                if (button.Name != "btnCancel" && button.Name != "btnChoosePicture")
                                    typeof(Button).GetProperty("Enabled").SetValue(func, !au.Authorize);
                            }
                            if (func is CheckBox)
                            {
                                typeof(CheckBox).GetProperty("Visible").SetValue(func, au.Authorize);

                            }
                        }
                    }                    
                }
                if (au.Authority.AuthorityName.Contains("Truy cập") && au.Authorize)

                    if (authority == "none")
                        authority = "access";
                    else
                        authority = "full";
            }
            return authority;
        }            
    }
}