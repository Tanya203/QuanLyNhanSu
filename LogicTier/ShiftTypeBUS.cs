using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class ShiftTypeBUS
    {
        private readonly ShiftTypeDAL shiftTypeDAL;
        public ShiftTypeBUS()
        {
            shiftTypeDAL = new ShiftTypeDAL();
        }
        public IEnumerable<ShiftTypeViewModels> GetAllShiftType()
        {
            return shiftTypeDAL.GetAllShiftType();
        }
        public IEnumerable<ShiftTypeViewModels> GetAllShiftTypeSearch(string search)
        {
            return shiftTypeDAL.GetAllShiftTypeSearch(search);
        }
        public IEnumerable<ShiftType> GetShiftType()
        {
            return shiftTypeDAL.GetShiftType();
        }
        public bool Save(ShiftType shiftType)
        {
            return shiftTypeDAL.Save(shiftType);
        }
        public bool Delete(ShiftType shiftType)
        {
            return shiftTypeDAL.Delete(shiftType.ST_ID);
        }
    }
}
