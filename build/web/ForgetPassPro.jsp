<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.ResultSet"%>
<%
    String e=request.getParameter("email");
    db.DbConnect db=new db.DbConnect();
            ResultSet r=db.getUser(e);
            if(r.next()){
                String pass=r.getString(2);
                //MAil send COde
try{
    final String AEMAIL="skylinecse03@gmail.com";
    final String APASS="skyline16789";
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
    session.setAttribute("msg","Mail Send for Your Password success.");
}
catch(Exception ex){
    ex.printStackTrace();
    session.setAttribute("msg","MailID is Wrong.");
}
                //end--MAil send COde
            }
            else{
                session.setAttribute("msg","E-MailID is not Registered Yet.");
            }
            response.sendRedirect("forgetpassword.jsp");
%>