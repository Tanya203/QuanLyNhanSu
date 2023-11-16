using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class PositionBUS
    {
        private readonly PositionDAL positionDAL;
        public PositionBUS()
        {
            positionDAL = new PositionDAL();
        }
        public IEnumerable<PositionViewModels> GetAllPosition()
        {
            return positionDAL.GetAllPosition();
        }
        public IEnumerable<PositionViewModels> GetAllPositionSearch(string search)
        {
            return positionDAL.GetAllPositionSearch(search);
        }
        public IEnumerable<Position> GetPosition()
        {
            return positionDAL.GetPosition();
        }
        public bool Save(Position position)
        {
            return positionDAL.Save(position);
        }
        public bool Delete(Position position)
        {
            return positionDAL.Delete(position.PS_ID);
        }
        public int PositionTotalStaff(string ps_ID)
        {
            return positionDAL.PositionTotalStaff(ps_ID);
        }
    }
}
