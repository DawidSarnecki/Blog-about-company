<?php require_once 'header.php'; ?>


 <div class="container">
			<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
			</div>
			<h2>

<?php 
  if (isset($_SESSION['user']))
  {
    $_SESSION=array();

    if (session_id() != "" || isset($_COOKIE[session_name()]))
    setcookie(session_name(), '', time()-2592000, '/');
    session_destroy();
	
	header("Location: blog.php"); 
	//echo "Zostałeś wylogowany. <a href='blog.php'>Kliknij tutaj</a>, aby odświeżyć stronę </h2></div></div>";
  }
  else 
	  echo "Nie możesz się wylogować, ponieważ nie jesteś zalogowany. <br><a href='blog.php'>Kliknij tutaj</a>, aby odświeżyć stronę </h2></div></div>";
			
require_once 'footer.php';
?>