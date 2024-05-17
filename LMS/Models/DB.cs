﻿using Microsoft.AspNetCore.Components.Infrastructure;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;
namespace LMS.Models
{
    
    public class DB
    {
        public SqlConnection con {  get; set; }
        

        public DB() {
            string constr = "Data Source=DESKTOP-27HLH9T;Initial Catalog=LMS;Integrated Security=True;TrustServerCertificate=True";
            con =new SqlConnection(constr);
        }


        //Student Courses
        //Query for all
        public DataTable getAllCourses()
        {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname, course.ccode, semester from course";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }
        //Query for registered
        public DataTable getRegisteredCourses(int id, string sem)
        {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname, course.ccode, semester from course\r\ninner join course_data on course.ccode=course_data.ccode\r\nwhere course.ccode in (select ccode from registered where StID=" + id + " and sem='" + sem + "') ";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }
        //Query for Registered and search by course code
        public DataTable getRegisteredAndCodeCourses(int id, string sem, string CCode)
        {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname, course.ccode, semester from course\r\ninner join course_data on course.ccode=course_data.ccode\r\nwhere course.ccode in (select ccode from registered where StID=" + id + " and sem='" + sem + "') and course.ccode like '%" + CCode + "%'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }
        //Query for Registered and search by course name
        public DataTable getRegisteredAndNameCourses(int id, string sem, string name)
        {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname, course.ccode, semester from course\r\ninner join course_data on course.ccode=course_data.ccode\r\nwhere course.ccode in (select ccode from registered where StID=" + id + " and sem='" + sem + "') and course_data.cname like '%" + name + "%'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }
        //Query by course name
        public DataTable getByNameCourses(string name)
        {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname, course.ccode, semester from course\r\ninner join course_data on course.ccode=course_data.ccode\r\nwhere course_data.cname like '%" + name + "%'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }
        //Query by course code
        public DataTable getByCodeCourses(string CCode)
        {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname, course.ccode, semester from course\r\ninner join course_data on course.ccode=course_data.ccode\r\nwhere course.ccode like '%" + CCode + "%'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }
        //Query by course name and semester
        public DataTable getByNameandSemesterCourses(string name, string Sem)
        {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname, course.ccode, semester from course\r\ninner join course_data on course.ccode=course_data.ccode\r\nwhere course_data.cname like '%" + name + "%' and course.semester like '%" + Sem + "%'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }
        //Query by course code and semester
        public DataTable getByCodeandSemesterCourses(string CCode, string Sem)
        {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname, course.ccode, semester from course\r\ninner join course_data on course.ccode=course_data.ccode\r\nwhere course.ccode like '%" + CCode + "%' and course.semester like '%\"+Sem+\"%'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch (SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }


        //Logging in//
        public DataTable getInstID(string email, string password)
        {
            DataTable dt = new DataTable();
            string Q = "select ID from student where email='" + email + "' and pass='" + password + "'\r\nunion\r\nselect ID from instructor where email='" + email + "' and pass='" + password + "'\r\nunion\r\nselect ID from admin where email='" + email + "' and pass='" + password + "'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }

        //Teacher Selection Queries//
        public DataTable getIname(string id)
        {
            DataTable dt = new DataTable();
            string Q = "select Iname from instructor where ID =" + id;
            try {
                con.Open();
                SqlCommand cmd=new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            } 
            catch(SqlException sq) { 
            
            }
            finally { con.Close(); }
            return dt;
        }

        public DataTable getIcourses(string id) {
            DataTable dt = new DataTable();
            string Q = "select course_data.cname,course.ccode,course.semester,count(StID)\r\nfrom registered,course,instructor,course_data\r\nwhere\r\ncourse.ccode=registered.ccode and\r\ncourse.semester=registered.sem and\r\ncourse.inst_ID=instructor.ID and\r\ncourse_data.ccode=course.ccode and\r\ninst_ID=" + id + "\r\ngroup by course.ccode,course.semester,\r\ninstructor.Iname,course_data.cname";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }

        public DataTable getungraded(string id)
        {
            DataTable dt = new DataTable();
            string Q = "select ccode,Aname from assignment where assignment.ccode in(select distinct course.ccode from course where inst_ID="+id+" and assignment.sem in(select distinct course.semester from course where inst_ID=" + id + ") and (done=0 or done is null))";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch(SqlException sq) { Console.WriteLine(sq); }
            finally { con.Close(); }
            return dt;
        }

        public DataTable getallcourseassignments(string ccode, string sem)
        {
            DataTable dt = new DataTable();
            string Q = "select assignment.Aname,assignment.due_date,count(StID)\r\nfrom assignment,assignment_submissions\r\nwhere assignment.Aname=assignment_submissions.Aname and\r\nassignment.ccode=assignment_submissions.ccode and\r\nassignment.sem=assignment_submissions.sem and\r\nassignment.ccode='" + ccode + "' and assignment.sem='" + sem + "'\r\ngroup by assignment.Aname,assignment.due_date";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }

        public DataTable getassignmentsub(string aname, string ccode, string sem)
        {
            DataTable dt = new DataTable();
            string Q = "select student.Sname,assignment_submissions.Submission,\r\nassignment_submissions.grade\r\nfrom assignment_submissions,student\r\nwhere StID=ID and Aname='" + aname + "' and ccode='" + ccode + "' and\r\nsem='" + sem + "'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }

        public DataTable getmaterial(string ccode)
        {
            DataTable dt = new DataTable();
            string Q = "select Mname,link from material where ccode = '"+ccode+"'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                dt.Load(cmd.ExecuteReader());
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
            return dt;
        }

        //Teacher Manipulation Queries//
        public void addassignment(string ccode, string sem, string aname, string due_date)
        {
            string Q = "insert into assignment(Aname,ccode,sem,due_date)\r\nvalues('" + aname + "','" + ccode + "','" + sem + "'," + due_date + ")"; 
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                cmd.ExecuteNonQuery();
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
        }

        public void addmaterial(string ccode, string mname, string link)
        {
            string Q = "insert into material(ccode,Mname,link)\r\nvalues('" + ccode + "','" + mname + "','" + link + "')";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                cmd.ExecuteNonQuery();
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
        }

        public void addannouncement(string ccode,string sem,string title, string content)
        {
            string Q = "insert into announcement(ccode,sem,title,content)\r\nvalues('" + ccode + "','" + sem + "','" + title + "','" + content + "')";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                cmd.ExecuteNonQuery();
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
        }

        public void registerstudent(string ccode, string sem, string stid)
        {
            string Q = "insert into registered(StID,ccode,sem)\r\nvalues('" + stid + "','" + ccode + "','" + sem + "')";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                cmd.ExecuteNonQuery();
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
        }

        public void gradeassignment(string aname, string ccode, string sem, string stid, string grade)
        {
            string Q = "update assignment_submissions\r\nset grade=" + grade + "\r\nwhere Aname='" + aname + "' and ccode='" + ccode + "' and sem='" + sem + "' and StID='" + stid + "'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                cmd.ExecuteNonQuery();
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
        }

        public void addexam(string ccode,string sem, string venue,string proctor, string date)
        {
            string Q = "insert into exam(ccode,sem,venue,proctor_ID,exam_date)\r\nvalues('" + ccode + "','" + sem + "','" + venue + "','" + proctor + "','" + date + "')";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                cmd.ExecuteNonQuery();
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
        }

        public void gradeexam(string ccode, string sem, string stid, string grade)
        {
            string Q = "insert into exam_submissions(ccode,sem,StID,grade) values('"+ccode+"','"+sem+"','"+stid+"',"+grade+")'"
                ;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                cmd.ExecuteNonQuery();
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
        }

        public void addfinalgrade(string ccode, string sem, string stid, string grade)
        {
            string Q = "insert into transcript(ccode,sem,StID,grade) values('"+ccode+"','"+sem+"','"+stid+"',"+grade+")";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(Q, con);
                cmd.ExecuteNonQuery();
            }
            catch(SqlException sq) { }
            finally { con.Close(); }
        }
        public void AddTodo(string stid, string task, string ccode, string sem)
{
    string Q = "insert into todo(StID,task,done,ccode,sem) values(@stid,@task,0,@ccode,@sem)";
    try
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(Q, con);
        cmd.Parameters.AddWithValue("@stid", stid);
        cmd.Parameters.AddWithValue("@task", task);
        cmd.Parameters.AddWithValue("@ccode", ccode);
        cmd.Parameters.AddWithValue("@sem", sem);
        cmd.ExecuteNonQuery();
    }
    catch (SqlException sq) { }
    finally { con.Close(); }
}

public DataTable ViewTasks(string stid)
{
    string Q = "select task,done from todo where StID=@stid";
    DataTable dt = new DataTable();
            
           
            try
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(Q, con);
        cmd.Parameters.AddWithValue("@stid", stid);
        dt.Load(cmd.ExecuteReader());
    }
    catch (SqlException sq) { }
    finally { con.Close(); }
    return dt;
}

public void CompleteTask(string stid, string task)
{
    string Q = "update todo set done=1 where StID=@stid and task=@task";
    try
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(Q, con);
        cmd.Parameters.AddWithValue("@stid", stid);
        cmd.Parameters.AddWithValue("@task", task);
        cmd.ExecuteNonQuery();
    }
    catch (SqlException sq) { }
    finally { con.Close(); }
}

    }
}
