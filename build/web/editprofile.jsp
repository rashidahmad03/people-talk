<!DOCTYPE html>
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
	<link href="css/forgetpassword.css" rel="stylesheet">

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
			<a class="navbar-brand" href="Home.jsp">PeopleTalk</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><div class="navbar-text"><p>Welcome: XYZ</p></div></li>
					<li><a href="home.jsp">Home</a></li>
					<li><a href="home.jsp">Logout</a><li>
				</ul>			
			</div>
		</div>
	</nav><!-- end of navbar-->
		<div class="container">
			<section>
				<div class="panel panel-default">
					<div class="panel-heading text-center">
						<h3>Edit Profile</h3>
					</div>
					<div class="panel-body">
						<div class="container">
							<div class="row">
								<div class="col-lg-2 col-lg-offset-1">
									<img src="img/xyz.jpg">
								</div>
								<div class="col-lg-3">
									<form action="" class="form-horizontal">
										<div class="form-group">
											<label for="changephoto" class="control-label">Change Photo:</label><br>
											<input type="file" class="form-control" name="changephoto"/>
											<input type="submit"  class="form-control btn btn-primary" value="Change"/>	
										</div>
									</form>
								</div>
							</div>
						</div>
						<hr>
						<div class="container">
							<form action="" data-toggle="validator" class="form-horizontal">
								<div class="form-group">
									<label for="email" class="col-lg-2 control-label">Email:</label>
									<div class="col-lg-5">
										<label class="form-control">xyz@gmail.com</label>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="name" class="col-lg-2 control-label">Name:</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" name="name" placeholder="Enter your name" value="XYZ" required />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="gender" class="col-lg-2 control-label">Gender:</label>
									<div class="col-lg-5">
										<label class="radio-inline"><input type="radio" name="gender" checked/>Male</label>
										<label class="radio-inline"><input type="radio" name="gender"/>Female</label>
										<label class="radio-inline"><input type="radio" name="gender"/>Other</label>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="dob" class="col-lg-2 control-label">Date of Birth:</label>
									<div class="col-lg-5">
										<input type="date" class="form-control" name="dob" value="2017-03-21" required/>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="state" class="col-lg-2 control-label">State:</label>
									<div class="col-lg-5">
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
									<label for="city" class="col-lg-2 control-label">City:</label>
									<div class="col-lg-5">
										<select name="city" class="form-control">
											<option value="Noida">Noida</option>
											<option value="GreaterNoida">GreaterNoida</option>
											<option value="Surat">Surat</option>
											<option value="Panjim">Panjim</option>
										</select>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="area" class="col-lg-2 control-label">Area:</label>
									<div class="col-lg-5">
										<select name="Area" class="form-control">
											<option value="Sector-51">Sector-51</option>
											<option value="Sector-34">Sector-34</option>
											<option value="Alpha-1">Alpha-1</option>
											<option value="Beta-1">Beta-1</option>
										</select>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="submit" class="btn btn-primary">Update Profile</button>
										<a class="btn btn-danger" href="delete.html">Delete Account</a>
									</div>
								</div>
							</form>
						</div>
					</div>							
				</div>		
		</section>
	</div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
    <script type="text/javascript" src="js/jquery-2.2.2.min.js"></script>
    <script src="js/validator.js"></script>
  </body>
</html>