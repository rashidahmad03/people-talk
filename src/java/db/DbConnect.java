
package db;

import java.sql.*;

public class DbConnect {
    private Connection con;
    private Statement st;
    private PreparedStatement getFile,getUser,checkUser,insertUser,getSearchUsers,insertMsg,getMsg,updateUser;
    public DbConnect(){
        try{
 Class.forName("com.mysql.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/peopletalk","root","nokia");
 st=con.createStatement();
 getSearchUsers=con.prepareStatement("select * from userinfo where state=? or city=? or area=? ");
 getUser=con.prepareStatement("select * from userinfo where email=? ");
 getMsg=con.prepareStatement("select * from ptalk where sid=? and rid=? ");
 getFile=con.prepareStatement("select filename,ufile from ptalk where pid=?");
 checkUser=con.prepareStatement("select * from userinfo where email=? and pass=?");
 insertUser=con.prepareStatement("insert into userinfo values (?,?,?,?,?,?,?,?,?,?)");
 updateUser=con.prepareStatement("update userinfo set values (?,?,?,?,?,?,?,?)");
 insertMsg=con.prepareStatement("insert into ptalk (sid,rid,msg,filename,ufile,udate) values (?,?,?,?,?,?)");
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    public ResultSet checkUser(String e,String p){
        try{
 checkUser.setString(1, e);
 checkUser.setString(2, p);
 ResultSet rs=checkUser.executeQuery();
 return rs;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    public ResultSet getFile(int p){
        try{
 getFile.setInt(1, p);
 ResultSet rs=getFile.executeQuery();
 return rs;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    public ResultSet getUser(String e){
        try{
 getUser.setString(1, e);
 ResultSet rs=getUser.executeQuery();
 return rs;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    public ResultSet getMsg(String e1, String e2){
        try{
 getMsg.setString(1, e1);
 getMsg.setString(2, e2);
 ResultSet rs=getMsg.executeQuery();
 return rs;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    public ResultSet getSearchUsers(String s,String c,String a ){
        try{
 getSearchUsers.setString(1, s);
  getSearchUsers.setString(2, c);
   getSearchUsers.setString(3, a);
 ResultSet rs=getSearchUsers.executeQuery();
 return rs;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    
    
     public boolean updateUser(String p,String n,String ph,String gen,java.sql.Date d,String s,String c,String a,java.io.InputStream im){
        try{
 updateUser.setString(2, p);
 updateUser.setString(3, n);
 updateUser.setString(4, ph);
 updateUser.setDate(6, d);
 updateUser.setString(7, s);
 updateUser.setString(8, c);
 updateUser.setString(9, a);
 updateUser.setBinaryStream(10, im);
int x=updateUser.executeUpdate();
if(x==1)
 return true;
else 
 return false;
        }catch(Exception ex){
            ex.printStackTrace();
            return false;
        }
    }

   
    public boolean setUser(String e,String p,String n,String ph,String gen,java.sql.Date d,String s,String c,String a,java.io.InputStream im){
        try{
 insertUser.setString(1, e);
 insertUser.setString(2, p);
 insertUser.setString(3, n);
 insertUser.setString(4, ph);
 insertUser.setString(5, gen);
 insertUser.setDate(6, d);
 insertUser.setString(7, s);
 insertUser.setString(8, c);
 insertUser.setString(9, a);
 insertUser.setBinaryStream(10, im);
int x=insertUser.executeUpdate();
if(x==1)
 return true;
else 
 return false;
        }catch(Exception ex){
            ex.printStackTrace();
            return false;
        }
    }
    public boolean setMsg(String s,String r,String m,String fn,java.io.InputStream f,String d){
        try{
 insertMsg.setString(1, s);
 insertMsg.setString(2, r);
 insertMsg.setString(3, m);
 insertMsg.setString(4, fn);
 insertMsg.setBinaryStream(5, f);
 insertMsg.setString(6, d);
int x=insertMsg.executeUpdate();
if(x==1)
 return true;
else 
 return false;
        }catch(Exception ex){
            ex.printStackTrace();
            return false;
        }
    }
}
