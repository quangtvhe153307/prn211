using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WinFormsApp1.Logics;
using WinFormsApp1.Models;
using Application = WinFormsApp1.Models.Application;

namespace WinFormsApp1
{
    public partial class AdminForm : Form
    {
        Account a;
        public AdminForm(Account account)
        {
            a = account;
            InitializeComponent();
        }

        private void AdminForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Environment.Exit(0);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            resetPosition();
        }
        private void resetPosition()
        {
            pnApplication.Location = new Point(290, 700);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            resetPosition();
            pnApplication.Location = new Point(280, 0);
        }

        private void btLogout_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }

        private void AdminForm_Load(object sender, EventArgs e)
        {
            textBox1.Text = "Hello, admin";
            ApplicationManager applicationManager = new();
            List<Application> applications = applicationManager.GetApplications();
            ApplicationStatusManager applicationStatusManager = new ApplicationStatusManager();
            List<ApplicationStatus> applicationStatuses = applicationStatusManager.GetApplicationStatuses();

            comboBox1.DisplayMember = "StatusName";
            comboBox1.ValueMember = "Status";
            comboBox1.DataSource = applicationStatuses;

            dataGridView1.DataSource = applications;
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if(row >= 0)
            {
                textBox2.Text = dataGridView1.Rows[row].Cells[0].Value.ToString();
                textBox3.Text = dataGridView1.Rows[row].Cells[1].Value.ToString();
                textBox4.Text = dataGridView1.Rows[row].Cells[2].Value.ToString();
                dateTimePicker1.Value = Convert.ToDateTime(dataGridView1.Rows[row].Cells[3].Value.ToString());
                textBox5.Text = dataGridView1.Rows[row].Cells[4].Value.ToString();

                comboBox1.SelectedValue = dataGridView1.Rows[row].Cells[5].Value;
            }
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
        private void LoadDataForGV()
        {
            ApplicationManager applicationManager = new();
            List<Application> applications = applicationManager.GetApplications();
            dataGridView1.DataSource = applications;
        }
        private void Save_Click(object sender, EventArgs e)
        {
            Application application = new();
            application.ApplicationId = Convert.ToInt32(textBox2.Text);
            application.StudentId = Convert.ToInt32(textBox3.Text);
            application.Type = Convert.ToInt32(textBox4.Text);
            application.SentDate = Convert.ToDateTime(dateTimePicker1.Value);
            application.FilePath = textBox5.Text;
            application.Status = Convert.ToInt32(comboBox1.SelectedValue);
            ApplicationManager applicationManager = new ApplicationManager();   
            applicationManager.Update(application);
            MessageBox.Show("Successfully");
            LoadDataForGV();
        }
    }
}
