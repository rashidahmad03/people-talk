<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
    if(hm!=null){
        String e=(String)hm.get("email");
        String n=(String)hm.get("name");
    String s=request.getParameter("state");
    String c=request.getParameter("city");
    String a=request.getParameter("area");
    db.DbConnect d=new db.DbConnect();
    ResultSet rs=d.getSearchUsers(s, c, a);
    
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>People Talk</title>
    <link rel="icon" type="image/png" href="img/rashid.png"/>

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
	</nav>
        
	<div class="container">
                <div class="panel-body">
                    <form action="peoplesearch.jsp" class="form-horizontal">
                            <div class="form-group">
                                    
                                    <div class="col-lg-12">
									<label for="state" >State:</label>
									<div class="col-lg-9">
										<select name="state" class="form-control" id="listBox" onchange='selct_district(this.value)'>
											
										</select>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="city" class="col-lg-3 control-label">City:</label>
									<div class="col-lg-9">
										<select name="city" id='secondlist' class="form-control">
											
										</select>
									</div>
								</div>
                                        <label for="area" class="col-lg-3 control-label">Area:</label>
                                        <select name="area" class="form-control">
                                                    <option value="Sector-51">Sector-51</option>
                                                    <option value="Sector-34">Sector-34</option>
                                                    <option value="Alpha-1">Alpha-1</option>
                                                    <option value="Beta-1">Beta-1</option>
                                            </select>
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                            </div><!--end form group-->
                            
                    </form>
            </div>
		<div class="panel panel-default text center">
			<div class="panel-heading text-center">
				<h3>Search Results for: <%=s%>/<%=c%>/<%=a%></h3>
			</div>
		</div>
		
	</div>
	</br>
	</br>
		<div class="container">
                    <%
                    while(rs.next()){
                    %>
			<div class="row">
				<div class="col-lg-3">
                                    <img src="GetPhoto?email=<%=rs.getString(1)%>" width="100" height="120">
				</div>
				<div class="col-lg-7">
                                    <div class="form-group">
                                            <label for="name" class="control-label">Name: <font color="grey"><%=rs.getString(3)%></font></label><br>
                                            <label for="email" class="control-label">Email:<font color="grey"> <%=rs.getString(1)%></font></label><br>
                                            <label for="gender" class="control-label">Gender: <font color="grey"><%=rs.getString(5)%></font></label><br>
                                            <label for="dob" class="control-label">Date of Birth: <font color="grey"><%=rs.getString(6)%></font></label><br>

                                    </div>
				</div>
                                            <form action="talk.jsp" method="post" class="form-horizontal">
                                    <div class="col-lg-2">
                                            <div class="form-group">
                                                <input type="hidden" name="temail" value="<%=rs.getString(1)%>"/>  
                                            <input type="submit" class="btn btn-primary" value="Talk"/>
                                            </div>
                                    </div>
				</form>
			</div>
			<hr>
                     <%
                    }
                    %>
		</div>

	</br>
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
        session.setAttribute("msg","Plz Login First!");
        response.sendRedirect("home.jsp");
    }
%>