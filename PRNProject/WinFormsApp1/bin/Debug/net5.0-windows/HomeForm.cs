using PRNProject.Logics;
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

namespace WinFormsApp1
{
    public partial class HomeForm : Form
    {
        Account account;
        List<string> insInfo = new List<string>();
        public HomeForm(Account a)
        {
            InitializeComponent();
            account = a;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            InstructorManager instructorManager = new InstructorManager();
            Instructor instructor = instructorManager.GetInstructor(account.UserId);


        }
        void btEdit_Click(object sender, EventArgs e)
        {
            MessageBox.Show("a");
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
        private void lbBack_Click(object sender, EventArgs e)
        {
            this.Controls.Clear();
            InitializeComponent();
        }

        private void HomeForm_Load(object sender, EventArgs e)
        {
            InstructorManager instructorManager = new InstructorManager();
            Instructor instructor = instructorManager.GetInstructor(account.UserId);
            textBox1.Text = "Hello, " + instructor.InstructorFirstName + " " + instructor.InstructorMidName + " " + instructor.InstructorLastName;


            tbFirstName.Text = instructor.InstructorFirstName;
            tbMidName.Text = instructor.InstructorMidName;
            tbLastName.Text = instructor.InstructorLastName;
            tbAddress.Text = instructor.User.Address;
            tbPhone.Text = instructor.User.Phone;
            tbEmail.Text = instructor.User.Email;


            TermManager termManager = new();
            int curTerm = termManager.GetCurTerm().TermId; 

            CourseManager courseManager = new CourseManager();
            List<Course> courses = courseManager.GetCourses(curTerm, instructor.InstructorId);
            lbClassGrade.DisplayMember = "CourseCode";
            lbClassGrade.ValueMember = "CourseId";
            lbClassGrade.DataSource = courses;

            int courseId = (int)lbClassGrade.SelectedValue;
            StudentCourseManager studentCourseManager = new StudentCourseManager();
            List<StudentCourse> studentCourses = studentCourseManager.GetStudentCourses(courseId);
            dgvGrade.AutoGenerateColumns = false;

            dgvGrade.Columns.Clear();
            dgvGrade.Columns.Add("rollcol", "Student Roll");
            dgvGrade.Columns.Add("namecol", "Student Name");
            dgvGrade.Columns.Add("markcol", "Mark");
            dgvGrade.Columns["rollcol"].DataPropertyName = "Student.Roll";
            dgvGrade.Columns["namecol"].DataPropertyName = "Student.LastName";
            dgvGrade.Columns["markcol"].DataPropertyName = "Mark";
            dgvGrade.DataSource = studentCourses;

            CourseScheduleManager courseScheduleManager = new CourseScheduleManager();
            List<CourseSchedule> courseSchedules = courseScheduleManager.GetCourseSchedulesToday(instructor.InstructorId);



            lbClassAttendance.DisplayMember = "TeachingDate";
            lbClassAttendance.ValueMember = "TeachingScheduleId";
            lbClassAttendance.DataSource = courseSchedules;

            dgvAttendance.Columns.Clear();
            RollCallBookManager rollCallBookManager = new RollCallBookManager();
            List<RollCallBook> rollCallBooks = rollCallBookManager.GetRollCallBooks(1);
            dgvAttendance.AutoGenerateColumns = false;

            dgvAttendance.Columns.Add("rollcol", "Student Roll");
            dgvAttendance.Columns.Add("namecol", "Student Name");

            DataGridViewCheckBoxColumn dataGridViewCheckBoxColumn = new DataGridViewCheckBoxColumn();
            dataGridViewCheckBoxColumn.DataPropertyName = "IsAbsent";
            dgvAttendance.Columns.Add(dataGridViewCheckBoxColumn);
            dgvAttendance.Columns["rollcol"].DataPropertyName = "Student.Roll";
            dgvAttendance.Columns["namecol"].DataPropertyName = "Student.LastName";
            dgvAttendance.Columns[2].Name = "Absent";
            dgvAttendance.DataSource = rollCallBooks;


        }
        private void HomeForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Environment.Exit(0);
        }

        private void btLogout_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            resetPosition();
            pnProfile.Location = new Point(280, 0);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            resetPosition();
            pnAttendance.Location = new Point(280, 0);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            resetPosition();
            pnGrade.Location = new Point(280, 0);
        }
        private void resetPosition()
        {
            pnProfile.Location = new Point(1200,700);
            pnAttendance.Location = new Point(290, 700);
            pnGrade.Location = new Point(1200, 0);
        }

        private void splitContainer1_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btSave_Click(object sender, EventArgs e)
        {
            UpdateInstructorInfor();
        }
        private void  UpdateInstructorInfor()
        {
            InstructorManager instructorManager = new InstructorManager();
            AccountManager accountManager = new AccountManager();

            account.Address = tbAddress.Text;
            account.Email = tbEmail.Text;
            account.Phone = tbPhone.Text;

            accountManager.UpdateAccount(account);
            Instructor instructor = instructorManager.GetInstructor(account.UserId);
            
            instructor.InstructorFirstName = tbFirstName.Text;
            instructor.InstructorLastName = tbLastName.Text;
            instructor.InstructorMidName = tbMidName.Text;

            instructorManager.UpdateInstructor(instructor);

            textBox1.Text = "Hello, " + instructor.InstructorFirstName + " " + instructor.InstructorMidName + " " + instructor.InstructorLastName;
            tbMessage.Text = "Successfully";
        }

        private void dgvGrade_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            DataGridViewColumn column = dgvGrade.Columns[e.ColumnIndex];
            if (column.DataPropertyName.Contains("."))
            {
                object data = dgvGrade.Rows[e.RowIndex].DataBoundItem;
                string[] properties = column.DataPropertyName.Split('.');
                for (int i = 0; i < properties.Length && data != null; i++)
                    data = data.GetType().GetProperty(properties[i]).GetValue(data);
                dgvGrade.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = data;
            }
        }

        private void btSaveGrade_Click(object sender, EventArgs e)
        {
            int courseId = (int)lbClassGrade.SelectedValue;
            StudentCourseManager studentCourseManager = new StudentCourseManager();
            List<StudentCourse> studentCourses = studentCourseManager.GetStudentCourses(courseId);
            for(int i = 0; i < studentCourses.Count; i++)
            {
                if(dgvGrade.Rows[i].Cells[2].Value != null)
                {
                    studentCourses[i].Mark = (double?)dgvGrade.Rows[i].Cells[2].Value;
                }
            }
            studentCourseManager.Update(studentCourses);
            MessageBox.Show("Successfully");
        }

        private void lbClassGrade_SelectedIndexChanged(object sender, EventArgs e)
        {
            dgvGrade.Columns.Clear();
            dgvGrade.DataSource = null;
            int courseId = (int)lbClassGrade.SelectedValue;
            StudentCourseManager studentCourseManager = new StudentCourseManager();
            List<StudentCourse> studentCourses = studentCourseManager.GetStudentCourses(courseId);
            dgvGrade.AutoGenerateColumns = false;

            dgvGrade.Columns.Add("rollcol", "Student Roll");
            dgvGrade.Columns.Add("namecol", "Student Name");
            dgvGrade.Columns.Add("markcol", "Mark");
            dgvGrade.Columns["rollcol"].DataPropertyName = "Student.Roll";
            dgvGrade.Columns["namecol"].DataPropertyName = "Student.LastName";
            dgvGrade.Columns["markcol"].DataPropertyName = "Mark";
            dgvGrade.DataSource = studentCourses;

        }

        private void dgvAttendance_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            DataGridViewColumn column = dgvAttendance.Columns[e.ColumnIndex];
            if (column.DataPropertyName.Contains("."))
            {
                object data = dgvAttendance.Rows[e.RowIndex].DataBoundItem;
                string[] properties = column.DataPropertyName.Split('.');
                for (int i = 0; i < properties.Length && data != null; i++)
                    data = data.GetType().GetProperty(properties[i]).GetValue(data);
                dgvAttendance.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = data;
            }
        }

        private void lbClassAttendance_Format(object sender, ListControlConvertEventArgs e)
        {

        }

        private void lbClassAttendance_SelectedIndexChanged(object sender, EventArgs e)
        {
            dgvAttendance.Columns.Clear();
            dgvAttendance.DataSource = null;

            int scheduleId = (int)lbClassAttendance.SelectedValue;
            RollCallBookManager rollCallBookManager = new RollCallBookManager();
            List<RollCallBook> rollCallBooks = rollCallBookManager.GetRollCallBooks(scheduleId);
            dgvAttendance.AutoGenerateColumns = false;

            dgvAttendance.Columns.Add("rollcol", "Student Roll");
            dgvAttendance.Columns.Add("namecol", "Student Name");

            DataGridViewCheckBoxColumn dataGridViewCheckBoxColumn = new DataGridViewCheckBoxColumn();
            dataGridViewCheckBoxColumn.DataPropertyName = "IsAbsent";
            dgvAttendance.Columns.Add(dataGridViewCheckBoxColumn);
            dgvAttendance.Columns["rollcol"].DataPropertyName = "Student.Roll";
            dgvAttendance.Columns["namecol"].DataPropertyName = "Student.LastName";
            dgvAttendance.Columns[2].Name = "Absent";
            dgvAttendance.DataSource = rollCallBooks;
        }

        private void btSaveAttend_Click(object sender, EventArgs e)
        {


            int scheduleId = (int)lbClassAttendance.SelectedValue;

            RollCallBookManager rollCallBookManager = new RollCallBookManager();
            List<RollCallBook> rollCallBooks = rollCallBookManager.GetRollCallBooks(scheduleId);
            for (int i = 0; i < rollCallBooks.Count; i++)
            {
                if (dgvAttendance.Rows[i].Cells[2].Value != null)
                {
                    rollCallBooks[i].IsAbsent = (bool?)dgvAttendance.Rows[i].Cells[2].Value;
                }
            }
            rollCallBookManager.Update(rollCallBooks);
            MessageBox.Show("Successfully");


        }
        private void LoadData()
        {

        }
    }
}
