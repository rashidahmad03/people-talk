<%-- 
    Document   : home
    Created on : Aug 22, 2017, 6:38:46 PM
    Author     : rashid ahmad
--%>
<!DOCTYPE html>
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
    <script language="Javascript" src="js/jquery.js"></script>
    <script type="text/JavaScript" src='js/state.js'></script>
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
                        <a href="#talk">Talk</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>
                   
                    <li class="page-scroll">
                        <a href="#contact">Contact</a>
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
                        <h1 class="brand-heading">People talk</h1>
                        <p class="intro-text">A free, premium quality, responsive one page </p>
                        <h4>by rashid ahmad</h4>
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
        <br>
        <section id="talk" class="container content-section1 text-center">
			<div class="classrow">
				<div class="col-lg-6">
					<div id="z" class="panel panel-default">
						<div class="panel-heading text-center">
							<h3>Login</h3>
						</div>
						<div class="panel-body" >
							<form  action="LoginPro.jsp" data-toggle="validator"  class="form-horizontal">
								<div class="form-group">
									<label for="email" class="col-lg-3 control-label">Email:</label>
									<div class="col-lg-9">
										<input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="password" class="col-lg-3 control-label">Password:</label>
									<div class="col-lg-9">
										<input type="password" name="pass" class="form-control" id="name" placeholder="Enter your name" required />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-3">
                                                                            <input type="submit" class="btn btn-primary" value="Login"/>
										<input type="reset" class="btn btn-primary" value="Reset">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-3">
										<a href="forgetpassword.jsp">Forget Password?</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div id="z" class="panel panel-default">
						<div class="panel-heading text-center">
							<h3>Registration</h3>
						</div>
						<div class="panel-body">
                                                    <form action="reg" enctype="multipart/form-data" method="post" data-toggle="validator" class="form-horizontal">
								<div class="form-group">
									<label for="email" class="col-lg-3 control-label">Email:</label>
									<div class="col-lg-9">
										<input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="name" class="col-lg-3 control-label"> Name: </label>
									<div class="col-lg-9">
										<input type="text" name="name" class="form-control" id="name" placeholder="Enter your name" required />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="phone" class="col-lg-3 control-label">Phone:</label>
									<div class="col-lg-9">
										<input type="text" name="phone"  maxlength="10"  class="form-control" id="phone" placeholder="Enter your Phone" required />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="gender" class="col-lg-3 control-label">Gender:</label>
									<div class="col-lg-9">
										<label class="radio-inline"><input type="radio" id="gender" name="gender" value="Male" checked/>Male</label>
										<label class="radio-inline"><input type="radio" id="gender"  name="gender" value="Female"/>Female</label>
										<label class="radio-inline"><input type="radio" id="gender"  name="gender" value="Other"/>Other</label>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="dob" class="col-lg-3 control-label">Date of Birth:</label>
									<div class="col-lg-9">
										<input type="date" name="dob" class="form-control" id="dob" required />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="state" class="col-lg-3 control-label">State:</label>
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
								</div><!--end form group-->
								<div class="form-group">
									<label for="area" class="col-lg-3 control-label">Area:</label>
									<div class="col-lg-9">
										<select name="area" class="form-control">
											<option value="Sector-51">Sector-51</option>
											<option value="Sector-34">Sector-34</option>
											<option value="Alpha-1">Alpha-1</option>
											<option value="Beta-1">Beta-1</option>
										</select>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="photo" class="col-lg-3 control-label">Photo:</label>
									<div class="col-lg-9">
										<input name="photo" type="file" class="form-control" id="photo" required />
										
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-3">
										<input type="submit" class="btn btn-primary" value="Register"/>
									</div>
								</div>
							</form>
</div>
								</div></div>
								</div>
                                                    </section>
    
    
    
    
    
    
    
    
    
    
    
    <section id="about" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>About People Talk</h2>
                <p>Conversation is interactive, communication between two or more people.

The development of conversational skills and etiquette is an important part of socialization. The development of conversational skills in a new language is a frequent focus of language teaching and learning.

Conversation analysis is a branch of sociology which studies the structure and organization of human interaction, with a more specific focus on conversational interaction.</p>
                </div>
        </div>
    </section>
    
    
    
  

   

    <section id="contact" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Contact People Talk</h2>
                <p>Feel free to email us to provide some feedback on our project, give us suggestions for new idea   and themes, or to just say hello!</p>
                <p>rashidahmad03@gmail.com</p>
                <ul class="list-inline banner-social-buttons">
                    <li><a href="https://twitter.com/rashidahmad03" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                    </li>
                    <li><a href="https://github.com/rashidahmad03" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                    </li>
                    <li><a href="https://plus.google.com/100765466458379063382" class="btn btn-default btn-lg"><i class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
                    </li>
                </ul>
            </div>
        </div>
        
    </section>
    

    <div id="map"></div>

    
    <!-- Core JavaScript Files -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Google Maps API Key - You will need to use your own API key to use the map feature -->
   
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAm05gsHKTb5xnq8NiupcjdQLNgshYu1aU"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/grayscale.js"></script>

</body>

</html>
