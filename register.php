<?php require_once 'header.php';?>

 <div class="container">
			 <div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
			</div>
  <h3>Wprowadź swoje dane, aby się zarejestrować.</h3>

<?php
  $$user = $pass = "";
  if (isset($_SESSION['user'])) destroySession();

  if (isset($_POST['user']))
  {
    $user = ($_POST['user']);
    $pass = ($_POST['pass']);
	$email = ($_POST['email']);
	
	$salt1="!@#?><";
	$salt2="^%yt";
	$token = hash( 'whirlpool', "$salt1$pass$salt2");

    if ($user == "" || $pass == "" || $email == "" )
      echo "<h3><b> ! Nie wszystkie pola zostały wypełnione.<br></b></h3>";
    else
    {
		$connect->query("SELECT * FROM User WHERE login=:user");
		$connect->bindValue(':user', $user, PDO::PARAM_STR);
		$rows = $connect->resultset(); 

      if ($rows)
       echo  "<h3><b> ! Użytkownik o takiej nazwie już istnieje.<br><br></b></h3>";
      else
      {
        $connect->query("INSERT INTO User (Login,Pass,Email) VALUES(:user, :pass, :email)");
		$connect->bindValue(':user', $user, PDO::PARAM_STR);
		$connect->bindValue(':pass', $token, PDO::PARAM_STR);
		$connect->bindValue(':email', $email, PDO::PARAM_STR);
		$connect->execute();

        die("<h4>Konto zostało utworzone<a href =login.php> Proszę się zalogować.</a><br>");
      }
    }
  }
?>
			<h2> NOWE KONTO </h2>
			<form class="form-horizontal" role="form2" method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
				<div class="form-group">
				
				  <label for="Login" class="control-label col-sm-2">Login:</label>
				  <div class="col-sm-4">
					<input type='text'maxlength='16' name='user'class="form-control" placeholder="login...">
					</div>
				</div>
				<div class="form-group">
				  <label for="Login" class="control-label col-sm-2">email:</label>
				  <div class="col-sm-4">
					<input type='text'maxlength='16' name='email'class="form-control" placeholder="email...">
					</div>
				</div>
				<div class="form-group">
				  <label for="password" class="control-label col-sm-2" >Hasło:</label>
				  <div class="col-sm-4">          
					<input type='password' maxlength='16' name='pass' class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-4">
					<input type="submit" lass="btn btn-default" value='Załóż konto'/> Posiadasz już konto? <a href='login.php'>Kliknij aby się zalogować</a>.
				  </div>
				</div>
			</form>
			</div>
			</div>

 
 <?php require_once 'footer.php'; ?>
  