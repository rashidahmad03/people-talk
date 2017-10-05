
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadFile extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            int p=Integer.parseInt(request.getParameter("pid"));
            db.DbConnect d=new db.DbConnect();
            ResultSet rs=d.getFile(p);
            if(rs.next())
            {
                String fname=rs.getString(1);
                response.setContentType("APPLICATION/OCTET-STREAM");   
                response.setHeader("Content-Disposition","attachment; filename="+fname); 
                response.getOutputStream().write(rs.getBytes(2)); 
                
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
