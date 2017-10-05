<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<%
    HashMap hm=(HashMap)session.getAttribute("userDetails");
    if(hm!=null){
        String e=(String)hm.get("email");
        String n=(String)hm.get("name");
        db.DbConnect d=new db.DbConnect();
        ResultSet rs=d.getUser(e);
        if(rs.next()){
%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="rashid ahmad">
    <meta name="author" content="">

    <title>People Talk</title>
<link rel="icon" type="image/png" href="img/rashid.png"/>
    <!-- Bootstrap Core CSS -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- Fonts -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Custom Theme CSS -->
    <link href="css/grayscale.css" rel="stylesheet">

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">

    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">
                    <i class="fa fa-play-circle"></i>  <span class="light">People</span> Talk
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#talk">Search people</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#download">Download profile</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <section class="intro">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="col-lg-4">
                                                    <img src="GetPhoto?email=<%=e%>" width="720" height="480">
						</div>
                        <div class="page-scroll">
                            <a href="#talk" class="btn btn-circle">
                                <i class="fa fa-angle-double-down animated"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                                           
                                                
                                                
                      <section id="talk" class="container content-section1 text-center">
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">                          
                                           
							
							
                                                  
                                                  
                                               
				
						<div class="panel-heading text-center">
							<h3>Search People</h3>
						</div>
						<div class="panel-body">
							<form action="peoplesearch.jsp" class="form-horizontal">
								<div class="form-group">
									<label for="state" class="col-lg-3 control-label">State:</label>
									<div class="col-lg-9">
										<select name="state" class="form-control">
											<option value="UttarPradesh">UttarPradesh</option>
											<option value="Assam">Assam</option>
											<option value="Bihar">Bihar</option>
											<option value="Goa">Goa</option>
											<option value="Gujarat ">Gujarat </option>
											<option value="Haryana">Haryana</option>
											<option value="Rajasthan">Rajasthan</option>
											<option value="UttarPradesh">UttarPradesh</option>
											<option value="UttaraKhand">Uttarakhand</option>
										</select>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="city" class="col-lg-3 control-label">City:</label>
										<div class="col-lg-9">
										<select name="city" class="form-control">
											<option value="Noida">Noida</option>
											<option value="GreaterNoida">GreaterNoida</option>
											<option value="Surat">Surat</option>
											<option value="Panjim">Panjim</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="city" class="col-lg-3 control-label">Area:</label>
										<div class="col-lg-9">
										<select name="area" class="form-control">
											<option value="Sector-51">Sector-51</option>
											<option value="Sector-34">Sector-34</option>
											<option value="Alpha-1">Alpha-1</option>
											<option value="Beta-1">Beta-1</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-3">
										<button type="submit" class="btn btn-primary">Search</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
                                              			
                                                    </section>
      
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                 <section id="about" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>About profile</h2>
            <div class="col-lg-6">
							
							<div class="form-group">
								<label for="email" class="control-label">Name: <font color="grey"><%=n%></font></label>
								
							</div><!--end form group-->
							<div class="form-group">
								<label for="name" class="control-label">Email:<font color="grey"> <%=e%></font></label>
								
							</div><!--end form group-->
							<div class="form-group">
								<label for="gender" class="control-label">Gender: <font color="grey"><%=rs.getString(5)%></font></label>
							</div><!--end form group-->
							<div class="form-group">
								<label for="dob" class="control-label">Date of Birth: <font color="grey"><%=rs.getString(6)%></font></label>
							</div><!--end form group-->
						</div>    
                                                        <div class="row">
						<div class="col-lg-10">
							<div class="col-lg-10 form-group">
								<label for="state" class="control-label">Address: <font color="grey"><%=rs.getString(9)%>, <%=rs.getString(8)%>, <%=rs.getString(7)%></font></label>
							</div><!--end form group-->
							<div class="form-group">
								<div class="col-lg-10 form-group">
									<a href="editprofile.jsp" class="btn btn-primary">Edit Profile</a>
									<a href="changepassword.jsp" class="btn btn-danger">Change Password</a>
								</div>
							</div><!--end form group-->
						</div>
					</div>
            </div>
        </div>
    </section>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <section id="download" class="content-section text-center">
        <div class="download-section">
            <div class="container">
                <div class="col-lg-8 col-lg-offset-2">
                    <h2>Download People Talk</h2>
                   <button onclick="myFunction()">Print this page</button>

<script>
function myFunction() {
    window.print();
}
</script>
                </div>
            </div>
        </div>
    </section>
  
      
      

    
<%
        }else{
            session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("home.jsp");
        }
    }else{
        session.setAttribute("msg","Plz Login First!");
        response.sendRedirect("home.jsp");
    }
%>