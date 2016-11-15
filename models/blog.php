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
	
	
	  public function get_comments($text_id)
    {        
        //connect to database
        $this->db->connect();

        //sanitize data
        $var1 = $this->db->escape($var1);
        $var2 = $this->db->escape($var2);
        $cond = $cond1.$var1."'"; 
        $cond.= " ".$cond2." ".$var2;  

        //prepare query
        $this->db->prepare
        (
            "
            SELECT *  FROM `comments`
            WHERE $cond
            ;
            "
        );

        //execute query
        $this->query();
        $resultArr[0] = 0;
        $i = 1;
        while( $result = $this->db->fetch('array')){
            $resultArr[$i] = $result;
            $i++;
        }
        $resultArr[0] = $i;

        return $resultArr;
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