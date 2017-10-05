<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
    if(hm!=null){
        String e=(String)hm.get("email");
        String n=(String)hm.get("name");
    String te=request.getParameter("temail");
    if(te!=null){
        session.setAttribute("temail",te);
    }else{
        te=(String)session.getAttribute("temail");
    }
    db.DbConnect d=new db.DbConnect();
    ResultSet rs=d.getUser(te);
    if(rs.next()){
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Talk </title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/talk.css" rel="stylesheet">

  </head>
  <body data-spy="scroll" data-target="#my-navbar">
    <!--Navbar-->
	<!--nav class="navbar navbar-inverse" id="my-navbar"-->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="profile.jsp">PeopleTalk</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><div class="navbar-text"><p>Welcome:<%=n%> </p></div></li>
					<li><a href="logout.jsp">Logout</a><li>
				</ul>			
			</div>
		</div>
	</nav><!-- end of navbar-->
	
	</br>
	</br>
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<img src="GetPhoto?email=<%=rs.getString(1)%>" width="100" height="120">
				</div>
				<div class="col-lg-4">
					
					<div class="form-group">
					</br>
                                                <label for="name" class="control-label">Name: <font color="grey"><%=rs.getString(3)%></font></label><br>
						<label for="gender" class="control-label">Gender: <font color="grey"><%=rs.getString(5)%></font></label><br>
                                                <label for="email" class="control-label">Email:<font color="grey"> <%=rs.getString(1)%></font></label><br>
						<label for="dob" class="control-label">Date of Birth: <font color="grey"><%=rs.getString(6)%></font></label><br>
                                        </div>
				</div>
			</div>
		</div>
		</br>
                <%
                    String msg=(String)session.getAttribute("msg");
                    if(msg!=null)  
                    {
                %>
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <p><%=msg%></p>
                    </div>
                </div>
                <%
                    session.setAttribute("msg", null);
                    }
                %>
		<div class="container text-center">
			<div class="panel panel-default">
				<div class="panel-body text-center">
                                    <form action="TalkPro" enctype="multipart/form-data" method="post" class="form-horizontal">
						<div class="form-group">
							<label for="message" class="col-lg-2 control-label">Message:</label>
								<div class="col-lg-4">
									<textarea name="msg" class="form-control" rows="5" cols="50"></textarea>
								</div>
						</div><!--end form group-->
						<div class="form-group">
							<label for="filetosend" class="col-lg-2 control-label">File to Send:</label>
								<div class="col-lg-4">
									<input type="file" class="form-control" name="ufile" />
								</div>
								<div class="col-lg-2">
                                                                    <input type="hidden" name="temail" value="<%=rs.getString(1)%>"/> 
									<button type="submit" class="btn btn-primary">Send</button>
								</div>
						</div><!--end form group-->
					</form>
				</div>
			</div>
		</div>
		<div class="container text-center">
			<div class="panel panel-default">
				<div class="panel-body text-center">
					<div class="row">
						<div class="col-lg-6">
							<div class="panel panel-default">
								<div class="panel-heading text-center">
									<h5><%=n%>'s Messages</h5>
								</div>
                                                                <%
                                                                ResultSet rM1=d.getMsg(e,te);
                                                                while(rM1.next()){
                                                                %>
								<div class="panel-body text-left">
									<p><%=rM1.getString(4)%></p>
									<div class="row">
										<font size="1">
										<div class="form-group">
											<div class="col-lg-2">
                                                                                            <label for="file" class="control-label">File: </label> <a href="DownloadFile?pid=<%=rM1.getString(1)%>"><%=rM1.getString(5)%></a>
											</div>
											<div class="col-lg-2">
												<label for="date" class="control-label">Date:</label> <%=rM1.getString(7)%>
											</div>
										</div>
										</font>
									</div>
									<hr>
								</div>
                                                                <%
                                                                }
                                                                %>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="panel panel-default">
								<div class="panel-heading text-center">
									<h5><%=rs.getString(3)%>'s Messages</h5>
								</div>
                                                                <%
                                                                ResultSet rM2=d.getMsg(te,e);
                                                                while(rM2.next()){
                                                                %>
								<div class="panel-body text-left">
									<p><%=rM2.getString(4)%></p>
									<div class="row">
										<font size="1">
											<div class="form-group">
												<div class="col-lg-2">
                                                                                                    <label for="file" class="control-label">File: </label> <a href="DownloadFile?pid=<%=rM2.getString(1)%>"><%=rM2.getString(5)%></a>
                                                                                                </div>
                                                                                                <div class="col-lg-2">
                                                                                                        <label for="date" class="control-label">Date:</label> <%=rM2.getString(7)%>
                                                                                                </div>
											</div>
										</font>
									</div>
									<hr>
								</div>
                                                                <%
                                                                }
                                                                %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<hr>
	
	<!--footer-->
	
	<div class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container">
			<div class="navbar-text pull-left">
				<p>Design and Develop by Rashid</p>
			</div>
	
		</div>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
<%
        }else{
            response.sendRedirect("profile.jsp");
        }
    }else{
        session.setAttribute("msg","Plz Login First!");
        response.sendRedirect("home.jsp");
    }
%>