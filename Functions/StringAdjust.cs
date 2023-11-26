﻿using System.Text.RegularExpressions;

namespace QuanLyNhanSu.utils
{
    public class StringAdjust
    {
        public static string AddSpacesBetweenUppercaseLetters(string input)
        {
            string pattern = @"(?<!^)(?=[A-ZÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬĐÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴ])";
            string replacement = " ";
            string result = Regex.Replace(input, pattern, replacement);
            return result;
        }
        public static string AdjustNumber(string input)
        {
            string pattern = "[^0-9.]";
            input = input.Replace(".", "").Replace(",", ".");
            string result = Regex.Replace(input, pattern, string.Empty);
            return result;
        }        
    }
}
