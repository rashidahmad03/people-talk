/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rahulchauhan
 */
@WebServlet(urlPatterns = {"/GetPhoto"})
public class GetPhoto extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String e=request.getParameter("email");
        db.DbConnect d=new db.DbConnect();
        ResultSet rs=d.getUser(e);
        if(rs!=null){
            try {
                if(rs.next()){
                    response.getOutputStream().write(rs.getBytes(10));
                }else{
                    HttpSession session=request.getSession();
                    session.setAttribute("msg","Wrong Entries.");
                    response.sendRedirect("home.jsp");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }else{
            response.sendRedirect("ExpPage.jsp");
        }
        
    }

}
