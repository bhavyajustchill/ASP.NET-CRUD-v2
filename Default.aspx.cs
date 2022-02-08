using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        Button5.Visible = false;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
        printData();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string branch = RadioButton1.Text;
            string technologies = "";
            if (RadioButton2.Checked)
            {
                branch = RadioButton2.Text;
            }
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                {
                    technologies += li.Text + ",";
                }
            }
            if (technologies.Length > 0)
            {
                technologies = technologies.Remove(technologies.Length - 1, 1);
            }
            else
            {
                technologies = "NOOB";
            }
            SqlCommand cmd = new SqlCommand("INSERT INTO [stud_info] ([stud_name], [stud_branch], [academic_yr], [technologies]) VALUES (@stud_name, @stud_branch, @academic_yr, @technologies)", con);
            cmd.Parameters.AddWithValue("@stud_name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@stud_branch", branch);
            cmd.Parameters.AddWithValue("@academic_yr", DropDownList1.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@technologies", technologies);

            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();

            if (s == 1)
            {
                Literal1.Text = "Student Details Added Successfully!";
                printData();
                resetForm();
            }
            else
            {
                Literal1.Text = "Error! The Details Entered are Invalid!";
                printData();
                resetForm();
            }
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Button1.Visible = true;
        Button1.Enabled = true;
        Button1.ForeColor = Color.White;
        Button1.BackColor = ColorTranslator.FromHtml("#00CC00");
        if (Page.IsValid)
        {
            string branch = RadioButton1.Text;
            string technologies = "";
            if (RadioButton2.Checked)
            {
                branch = RadioButton2.Text;
            }
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                {
                    technologies += li.Text + ",";
                }
            }
            if (technologies.Length > 0)
            {
                technologies = technologies.Remove(technologies.Length - 1, 1);
            }
            else
            {
                technologies = "NOOB";
            }
            SqlCommand cmd = new SqlCommand("UPDATE [stud_info] SET [stud_name] = @stud_name, [stud_branch] = @stud_branch, [academic_yr] = @academic_yr, [technologies] = @technologies WHERE [id] = @id", con);
            cmd.Parameters.AddWithValue("@stud_name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@stud_branch", branch);
            cmd.Parameters.AddWithValue("@academic_yr", DropDownList1.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@technologies", technologies);
            cmd.Parameters.AddWithValue("@id", ViewState["id"]);

            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();

            if (s == 1)
            {
                Literal1.Text = "Student Details Updated Successfully!";
                printData();
                resetForm();
            }
            else
            {
                Literal1.Text = "Error! The Details Entered are Invalid!";
                printData();
                resetForm();
            }
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button1.Visible = true;
        Button1.Enabled = true;
        Button1.ForeColor = Color.White;
        Button1.BackColor = ColorTranslator.FromHtml("#00CC00");
        Literal1.Text = "";
        resetForm();
    }
    public void printData()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [stud_name], [stud_branch], [academic_yr], [technologies] FROM [stud_info]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    public void resetForm()
    {
        TextBox1.Text = "";
        RadioButton2.Checked = false;
        RadioButton1.Checked = true;
        DropDownList1.SelectedIndex = 0;
        CheckBoxList1.ClearSelection();
        Button5.Enabled = false;
        Button5.BackColor = Color.Black;
        Button5.ForeColor = Color.Silver;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [stud_info] WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@id", btn.CommandArgument);

        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();

        if (s == 1)
        {
            Literal1.Text = "Record Deleted Successfully!";
            printData();
        }
        else
        {
            Literal1.Text = "Error! Record could not be Deleted!";
            printData();
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = new Button();
        btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [stud_name], [stud_branch], [academic_yr], [technologies] FROM [stud_info] WHERE [id] = " + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        RadioButton2.Checked = false;
        RadioButton1.Checked = false;
        Button5.Visible = true;
        Button1.Visible = false;
        Button1.Enabled = false;
        Button1.ForeColor = Color.Silver;
        Button1.BackColor = Color.Black;
        Button5.Enabled = true;
        Button5.ForeColor = Color.White;
        Button5.BackColor = ColorTranslator.FromHtml("#00CC00");
        foreach (ListItem li in CheckBoxList1.Items)
        {
            li.Selected = false;
        }
        TextBox1.Text = dt.Rows[0][1].ToString();
        string branch_u = dt.Rows[0][2].ToString();
        if (branch_u == RadioButton1.Text)
        {
            RadioButton1.Checked = true;
        }
        else if (branch_u == RadioButton2.Text)
        {
            RadioButton2.Checked = true;
        }
        string ac_year = dt.Rows[0][3].ToString();
        if (ac_year == "First Year")
        {
            DropDownList1.SelectedIndex = 1;
        }
        else if (ac_year == "Second Year")
        {
            DropDownList1.SelectedIndex = 2;
        }
        else if (ac_year == "Third Year")
        {
            DropDownList1.SelectedIndex = 3;
        }
        string tech = dt.Rows[0][4].ToString();
        string[] technologies = tech.Split(',');
        foreach (ListItem li in CheckBoxList1.Items)
        {
            string item = li.Text;
            foreach (string tech1 in technologies)
            {
                if (tech1 == item)
                {
                    li.Selected = true;
                }
            }
        }
        ViewState["id"] = btn.CommandArgument;
    }
}