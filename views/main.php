<!DOCTYPE html>
<html lang="pl">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>BLOG O firmie</title>
	<link rel="stylesheet" href="<?php echo ROOT_PATH; ?>aspect/css/bootstrap.css">
	<link rel="stylesheet" href="<?php echo ROOT_PATH; ?>aspect/css/w3s.css"> 
	<link rel="stylesheet" href="<?php echo ROOT_PATH; ?>aspect/css/mystyles.css"> 
	<script src="<?php echo ROOT_PATH; ?>aspect/ajax/script.js"></script>
</head>
<body>
	<div class="jumbotron"><center><img src="<?php echo ROOT_PATH; ?>aspect/files/company.jpg" style="width:30%" alt="Image">
	<h2> BLOG <i>O Firmie </i> </h2></center>
	</div>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>		
		  </button>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="<?php echo ROOT_URL; ?>">O Firmie</a></li>
				<li><a href="<?php echo ROOT_URL; ?>blog">Blog</a></li>
				<li><a href="<?php echo ROOT_URL; ?>contact">Kontakt</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<?php if(isset($_SESSION['logged_in'])) : ?>
				<li><a href="<?php echo ROOT_URL; ?>">Witaj <?php echo $_SESSION['user']; ?></a></li>
				<li><a href="<?php echo ROOT_URL; ?>user/logout">Logout</a></li>
				<?php else : ?>
				<li><a href="<?php echo ROOT_URL; ?>user/login">Login</a></li>
				<li><a href="<?php echo ROOT_URL; ?>user/register">Register</a></li>
				<?php endif; ?>
			</ul>

		</div>
	  </div>
	</nav>
	
	<div class="container">
	<div class="row">
	
	<?php require($view); ?>
	
	</div>
	</div>
	<footer class="container-fluid text-center">
		<p>Copyright Dawid Sarnecki 2016</p>  
	</footer>
</body>
</html>
	









