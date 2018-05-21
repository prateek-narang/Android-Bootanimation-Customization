using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Collections;
using Ionic.Zip;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
    }

    public void uploadFile(object sender, EventArgs e)
    {
        if (FileUpload.HasFile)
        {
            try
            {
                createServerFiles();
            }
            catch (Exception ex)
            {
                StatusLabel.Text = " Error :- " + ex.Message;
            }
        }
    }

    public void createServerFiles()
    {   
        String temp = Server.MapPath("~/temp");
        String filepath = temp + "\\desc.txt";
        String folderpath = temp + "\\part0";
        int countFiles = FileUpload.PostedFiles.Count;
        int name = 0;
        int fps = 1;
        if (countFiles > 32) {
            fps = 26;
        }
        else if (countFiles > 64) {
            fps = 48;
        }

        Directory.CreateDirectory(temp);
        Directory.CreateDirectory(folderpath);

        foreach(HttpPostedFile files in FileUpload.PostedFiles)
        {
            files.SaveAs(Path.Combine(folderpath, name + ".png"));
            name++;
        }

        using (StreamWriter sw = File.CreateText(filepath))
        {
            String[] value = (DropDownList.SelectedValue).Split('_');
            sw.WriteLine(value[1] + " " + value[0] + " " + fps);
            sw.WriteLine("p 0 0 part0");
        }
        downloadZip();
    }

    public void downloadZip()
    {
        if (!FileUpload.HasFile) {
            StatusLabel.Text = "No File Selected";
            return;
        }
        String zipName = "bootanimation.zip";
        Response.ContentType = "application/zip";
        Response.AddHeader("Content-Disposition", "filename=" + zipName);

        using (ZipFile zip = new ZipFile())
        {
            zip.CompressionMethod = CompressionMethod.
            zip.CompressionLevel = Ionic.Zlib.CompressionLevel.None;
            zip.Encryption = EncryptionAlgorithm.None;
            zip.AddDirectory(Server.MapPath("~/temp"), String.Empty);
            zip.Save(Response.OutputStream);
        }

        Directory.Delete(Server.MapPath("temp"), true);
        StatusLabel.Text = "File Downloaded";
    }

    public void download_preloaded(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.Equals("walk_man"))
        {
            Response.Redirect("~/preloaded/walk_man/bootanimation.zip", true);
        }
        else if (DropDownList1.SelectedValue.Equals("google"))
        {
            Response.Redirect("~/preloaded/google/bootanimation.zip", true);
        }
        StatusLabel.Text = "File Downloaded";
    }
}