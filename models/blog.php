<?php
/*********************************************************** 
* Class name:
*    BlogModel
* Descripton:
*    extends Model abstract class
**********************************************************/

class BlogModel extends Model
{
	/*********************************************************** 
	* Public members
	************************************************************/ 
	public function Index(){
		$this->query('SELECT * FROM blog_public');
		$rows = $this->resultSet();
		
		//print_r($rows);
		return $rows;
	}
	
	/*********************************************************** 
	* Public members
	************************************************************/ 

	public function add()
	{
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
		
		if($post['submit']){
			
			$title = $post['title'];
			$body = $post['body'];
			$user_id = $_SESSION['ID'];
			//echo $user_id = $_SESSION['ID'];
			
			$connect->query('INSERT INTO blogtext (Title, Text, X_CreateUser) VALUES (:title, :body, :user)');
			$connect->bindValue(':title', $title);
			$connect->bindValue(':body', $body);
			$connect->bindValue(':user', $user_id);
			$connect->execute();
			
			// Verify
			if($this->lastInsertId())
			{
				// Redirect
				//header('Location: '.ROOT_URL.'users/login');
				echo "działa lastinsert";	
			}
		}
		return;
	}
}