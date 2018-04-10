using System;

namespace MVCJquery.Models
{
    public class StudentViewModel
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string Email { get; set; }
        public Nullable<bool> IsDelete { get; set; }
        public Nullable<int> DepartamentId { get; set; }

        public string DepartamentName { get; set; }

    }
}