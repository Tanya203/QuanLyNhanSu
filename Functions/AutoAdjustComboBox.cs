using System;
using System.Windows.Forms;

namespace QuanLyNhanSu.Functions
{
    public class AutoAdjustComboBox
    {
        public AutoAdjustComboBox() { }
        public static void Adjust(ComboBox comboBox)
        {
            int maxWidth = 0;
            foreach (var items in comboBox.Items)
            {
                int itemWidth = TextRenderer.MeasureText(comboBox.GetItemText(items), comboBox.Font).Width;
                maxWidth = Math.Max(maxWidth, itemWidth);
            }
            comboBox.DropDownWidth = maxWidth + SystemInformation.VerticalScrollBarWidth;
        }
    }
}
