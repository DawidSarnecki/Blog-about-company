<?
/*********************************************************** 
* Class name:
*    UserModel
* Descripton:
*    extends Model abstract class
**********************************************************/

class UserModel extends Model
{
	/*********************************************************** 
	* Public members
	************************************************************/ 

	public function register()
	{
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		$user = $pass = "";
		
		if (isset($_SESSION['user'])) destroySession();

		if ($post['submit'])
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
				$connect->bindValue(':user', $user);
				$rows = $connect->resultset(); 

				if ($rows)
					echo  "<h3><b> ! Użytkownik o takiej nazwie już istnieje.<br><br></b></h3>";
				else
				{
					$connect->query("INSERT INTO User (Login,Pass,Email) VALUES(:user, :pass, :email)");
					$connect->bindValue(':user', $user);
					$connect->bindValue(':pass', $token);
					$connect->bindValue(':email', $email);
					$connect->execute();
					
					// Verify
					if($this->lastInsertId())
					{
						// Redirect
						//header('Location: '.ROOT_URL.'users/login');
						echo "<h4>Konto zostało utworzone<a href =login.php> Proszę się zalogować.</a><br>";	
					}
				}
			}
		}
		return;
	}

	
	public function login()
	{
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		if($post['submit'])
		{
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
				$connect->query("SELECT * FROM show_user
				WHERE Login=:user AND Pass =:pass");
				$connect->bindValue(':user', $user);
				$connect->bindValue(':pass', $pass);
				
				$rows = $connect->resultset(); 
					//print_r($rows);
						
			  if (!$rows)
			  {
				echo "<h3>! Błędna nazwa użytkownika lub hasło.</h3>";
			  }
			  elseif ($rows[0]['IsBlocked'])
			  {
				echo "<h3>! Konto [ ".$user. " ] zostało zablokowane. Wymagany kontakt z administratorem, e-mail: admin@blog.pl.</h3>";
			  }
			  else
			  {
				$_SESSION['user'] = $user;
				$_SESSION['ID'] = $rows[0]['ID'];
				$_SESSION['IsAdmin'] = $rows[0]['IsAdmin'];
				
				$_SESSION['user_data'] = array(
					"id"	=> $row['id'],
					"name"	=> $row['name'],
					"email"	=> $row['email']
				);
				
				header("Location: blog.php");
				//header('Location: '.ROOT_URL.'shares');
			  }
			}
		  }
		}
	}
}