/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class NewRegister extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=null;
        HttpSession session=null;
        try {
            session=request.getSession();
            out = response.getWriter();
            String n=request.getParameter("name");
            String p=request.getParameter("phone");
            String e=request.getParameter("email");
            String d=request.getParameter("dob");
            String g=request.getParameter("gender");
            String s=request.getParameter("state");
            String c=request.getParameter("city");
            String a=request.getParameter("area");
            //code to get file from client
            Part filePart = request.getPart("photo");
            InputStream pis = filePart.getInputStream();
            //end- code to get file from client
            //code for random string 
            String pass="";
            String sss="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@#$%";
            int i,pl=8;
            for(int x=0;x<pl;x++)
            {
                i=(int)(Math.random()*(sss.length()-1));
                pass=pass+sss.charAt(i);
            }//end- code for random string
            //code to convert String into Date
            java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.util.Date dt=sdf.parse(d);
            java.sql.Date sdt=new java.sql.Date(dt.getTime());
 //check email validity  
    InternetAddress internetAddress = new InternetAddress(e);
    internetAddress.validate();
 //end---check email validity
            db.DbConnect db=new db.DbConnect();
            boolean r=db.setUser(e,pass,n,p,g,sdt,s,c,a,pis);
            if(r){
                //MAil send COde
try{
    final String AEMAIL="skylninecse03@gmail.com";
    final String APASS="skyline123456789";
    String SEMAIL=e;
    String SUB="Register Success";
    String BODY="Your Id: "+e+" <br/> Password= "+pass;
    Properties props=new Properties();
    props.put("mail.smtp.host","smtp.gmail.com");
    props.put("mail.smtp.socketFactory.port","465");
    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.auth","true");
    props.put("mail.smtp.port","465");
    Session ses=Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(AEMAIL,APASS);
                }
            }
            );
    
    Message message=new MimeMessage(ses);
    message.setFrom(new InternetAddress(AEMAIL));
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(SEMAIL));
    message.setSubject(SUB);
    message.setContent(BODY,"text/html" );
    
    Transport.send(message);
}
catch(Exception ex){
    ex.printStackTrace();
}
                //end--MAil send COde
                java.util.HashMap hm=new java.util.HashMap();
                hm.put("email", e);
                hm.put("name", n);
                session.setAttribute("userDetails", hm);
                response.sendRedirect("profile.jsp");
            }
            else{
                session.setAttribute("msg","Registration Failed.");
                response.sendRedirect("home.jsp");
            } 
        } catch (Exception ex) {
            session.setAttribute("msg", "Registration Failed: "+ex);
            ex.printStackTrace();
            response.sendRedirect("home.jsp");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
