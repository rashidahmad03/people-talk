<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%
    String e=request.getParameter("email");
    String p=request.getParameter("pass");
    db.DbConnect d=new db.DbConnect();
    ResultSet rs=d.checkUser(e, p);
    if(rs!=null){
        if(rs.next()){
            HashMap hm=new HashMap();
            hm.put("email", rs.getString(1));
            hm.put("name", rs.getString(3));
            rs.close();
            session.setAttribute("userDetails", hm);
            response.sendRedirect("profile.jsp");
        }else{
            session.setAttribute("msg","Wrong Entries.");
            response.sendRedirect("home.jsp");
        }
    }else{
        response.sendRedirect("ExpPage.jsp");
    }
%>