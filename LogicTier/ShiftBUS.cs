using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class ShiftBUS
    {
        private readonly ShiftDAL shiftDAL;
        public ShiftBUS()
        {
            shiftDAL = new ShiftDAL();
        }
        public IEnumerable<ShiftViewModels> GetAllShifts()
        {
            return shiftDAL.GetAllShifts();
        }
        public IEnumerable<ShiftViewModels> GetAllShiftsSearch(string search)
        {
            return shiftDAL.GetAllShiftsSearch(search);
        }
        public IEnumerable<Shift> GetShift()
        {
            return shiftDAL.GetShift();
        }
        public bool Save(Shift shift)
        {
            return shiftDAL.Save(shift);
        }
        public bool Delete(string shiftID)
        {
            return shiftDAL.Delete(shiftID);
        }
    }
}
