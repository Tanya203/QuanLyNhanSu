using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Month")]
    public partial class Month
    {
        public Month()
        {
            MonthSalaryDetails = new HashSet<MonthSalaryDetail>();
        }

        [StringLength(20)]
        public string MonthID { get; set; }

        public virtual ICollection<MonthSalaryDetail> MonthSalaryDetails { get; set; }
    }
}
