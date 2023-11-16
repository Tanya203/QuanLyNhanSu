using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.Functions
{
    public class ImageHandle
    {
        public static void ChooseIamge(PictureBox pictureBox)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image Files (*.png; *.jpg; *.jpeg; *.gif; *.bmp)|*.png;*.jpg;*.jpeg;*.gif;*.bmp";

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                string selectedImagePath = openFileDialog.FileName;
                FileInfo fileInfo = new FileInfo(selectedImagePath);
                long fileSize = fileInfo.Length;
                const long maxSizeInBytes = 5 * 1024 * 1024;
                if (fileSize <= maxSizeInBytes)
                {
                    Image selectedImage = Image.FromFile(selectedImagePath);
                    pictureBox.SizeMode = PictureBoxSizeMode.StretchImage;
                    pictureBox.Image = selectedImage;
                }
                else
                {
                    MessageBox.Show("Ảnh phải nhỏ hơn hoặc bằng 5MB", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }
        public static void LoadImage(PictureBox pictureBox, byte[] imageBytes)
        {
            if(imageBytes != null)
            {
                using (MemoryStream stream = new MemoryStream(imageBytes))
                {
                    Image image = Image.FromStream(stream);
                    pictureBox.SizeMode = PictureBoxSizeMode.StretchImage;
                    pictureBox.Image = image;
                }
            }            
        }
        public static byte[] GetImageBytes(PictureBox pictureBox)
        {
            if(pictureBox.Image != null)
            {
                using (MemoryStream stream = new MemoryStream())
                {
                    pictureBox.Image.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                    return stream.ToArray();
                }
            }
            return null;            
        }
    }
}
