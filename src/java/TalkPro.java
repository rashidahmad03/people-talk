
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class TalkPro extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        HashMap hm=(HashMap)session.getAttribute("userDetails");
        if(hm!=null){
            String e=(String)hm.get("email");
            String te=request.getParameter("temail");
            String m=request.getParameter("msg");
            Part filePart = request.getPart("ufile");
            String fileName = filePart.getSubmittedFileName();
            InputStream pis = filePart.getInputStream();
            LocalDateTime cDate = LocalDateTime.now();
            String cd=cDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm a"));
            
            db.DbConnect d=new db.DbConnect();
            boolean r=d.setMsg(e,te,m,fileName,pis,cd);
            if(r){
                session.setAttribute("msg","Sending Success.");
                response.sendRedirect("talk.jsp");
            }
            else{
                session.setAttribute("msg","Sending Failed.");
                response.sendRedirect("talk.jsp");
            }
        }else{
            session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("home.jsp");
        }
    }

}
