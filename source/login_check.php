<?php 
require_once 'Connection.php';
$connect = new Connection();
  $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
  
  if ($post['user'])
  {
	$user = $post['user'];
	$connect->query("SELECT * FROM User WHERE login=:user");
	$connect->bindValue(':user', $user, PDO::PARAM_STR);
	$rows = $connect->resultset(); 

    if ($rows)
      echo  "&nbsp;&#x2718; " .
            "Login już istnieje.";
    else
      echo "&nbsp;&#x2714; " .
           "Login jest dostępny.";
  }
  else
	  echo '$post is null';
?>