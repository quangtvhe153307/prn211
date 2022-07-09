﻿using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class StudentManager
    {
        PRNProjectContext context;

        public StudentManager()
        {
            context = new PRNProjectContext();
        }
        public List<Student> GetStudents()
        {
            return context.Students.ToList();
        }
        public Student GetStudent(int id)
        {
            return context.Students.FirstOrDefault(x => x.StudentId == id);
        }
    }
}