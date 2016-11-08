<?php require_once 'header.php'; ?>

 
 <div class="container">
			 <div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
			</div>
 <?php
   $user = $pass = "";

  if (isset($_POST['user']))
  {
    $user = ($_POST['user']);
    $pass_tmp = ($_POST['pass']);
	
	//hashing password
	$salt1="!@#?><";
	$salt2="^%yt";
	$pass = hash( 'whirlpool', "$salt1$pass_tmp$salt2");
	
    if ($user == "" || $pass == "" )
      echo "<h3>! Nie wszystkie pola zostały wypełnione.</h3>";
    else
    {
		$connect->query("SELECT ID, Login, Pass, IsAdmin, IsBlocked FROM User
        WHERE Login='$user' AND Pass='$pass'");
			//$connect->bindValue(':limit', 5, PDO::PARAM_INT);
		$rows = $connect->resultset(); 
				
			//print_r($rows);
				
      if (!$rows)
      {
        echo "<h3>! Błędna nazwa użytkownika lub hasło.</h3>";
      }
	  elseif ($rows[0]['IsBlocked'])
      {
		echo $rows[0]['IsBlocked'];
        echo "<h3>! Konto [ ".$user. " ] zostało zablokowane. Wymagany kontakt z administratorem, e-mail: admin@blog.pl.</h3>";
      }
      else
      {
        $_SESSION['user'] = $user;
        $_SESSION['pass'] = $pass;
		$_SESSION['ID'] = $rows[0]['ID'];
		$_SESSION['IsAdmin'] = $rows[0]['IsAdmin'];
		
		header("Location: blog.php"); 
		/*
        die("Jesteś zalogowany. Aby kontynuować, <a href='blog.php?view=$user'>" .
            "kliknij tutaj</a>.<br><br>");
			*/
      }
    }
  }
?>
			
			<h2> LOGOWANIE </h2>
			<form class="form-horizontal" role="form2" method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
				<div class="form-group">
				  <label for="Login" class="control-label col-sm-2">login:</label>
				  <div class="col-sm-4">
					<input type='text'maxlength='16' name='user'class="form-control" placeholder="login...">
					</div>
				</div>
				<div class="form-group">
				  <label for="password" class="control-label col-sm-2" >hasło:</label>
				  <div class="col-sm-4">          
					<input type='password' maxlength='16' name='pass' class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-4">
					<input type="submit" lass="btn btn-default" value='Zaloguj'/> Nie posiadasz konta? <a href='register.php'>Kliknij tutaj</a>.
				  </div>
				</div>
			</form>
			
			</div>
			</div>
			

<?php require_once 'footer.php'; ?>