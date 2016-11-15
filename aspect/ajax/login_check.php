<?php 
  $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING); 
  if ($post['user'])
  {
	   //echo $post['user'];
	$user = $post['user'];
	//$this->query("SELECT * FROM User WHERE login=:user");
	//$this->bindValue(':user', $user);
	//$rows = $this->resultset(); 

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