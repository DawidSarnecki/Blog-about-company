<?php
$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

	if($post['add'])
		{
			$title = $post['title'];
			$body = $post['body'];
			$user_id = $_SESSION['ID'];
			//echo $user_id = $_SESSION['ID'];
			
			$connect->query('INSERT INTO blogtext (ID, Title, Text, X_CreateUser) VALUES (uuid(), :title, :body, :user)');
			$connect->bindValue(':title', $title, PDO::PARAM_STR);
			$connect->bindValue(':body', $body, PDO::PARAM_STR);
			$connect->bindValue(':user', $user_id, PDO::PARAM_STR);
			$connect->execute();
		}
	elseif($post['archive'])
		{
			$archive_id = $post['archive_id'];
			$connect->query('UPDATE blogtext SET X_RemoveTime = now() WHERE ID =:id');
			$connect->bindValue(':id', $archive_id, PDO::PARAM_STR);
			$connect->execute();
		}
	elseif($post['restore'])
		{
			$restore_id = $post['restore_id'];
			$connect->query('UPDATE blogtext SET X_RemoveTime = NULL WHERE ID =:id');
			$connect->bindValue(':id', $restore_id, PDO::PARAM_STR);
			$connect->execute();
		}
	elseif($post['delete'])
		{
			$delete_id = $post['delete_id'];
			//echo $delete_id = $post['delete_id'];
			$connect->query('DELETE FROM blogtext WHERE ID =:id');
			$connect->bindValue(':id', $delete_id, PDO::PARAM_STR);
			$connect->execute();
		}
	elseif($post['delcom'])
		{
			$delete_id = $post['del_id'];
			//echo $delete_id = $post['delete_id'];
			$connect->query('DELETE FROM blogcomment WHERE ID =:id');
			$connect->bindValue(':id', $delete_id, PDO::PARAM_STR);
			$connect->execute();
		}		
	elseif($post['change_status'])
		{
			$change_id;
			$status;
			if ($post['hide_id'])
			{
				$change_id = $post['hide_id'];
				$status = 0;
			}
			else
			{
				$change_id = $post['show_id'];
				$status = 1;
			}
			$connect->query('UPDATE blogtext SET Status = :status WHERE ID =:id');
			$connect->bindValue(':id', $change_id, PDO::PARAM_STR);
			$connect->bindValue(':status', $status, PDO::PARAM_INT);
			$connect->execute();
		}
	elseif($post['edit'])
		{
			$edit_id = $post['edit_id'];
			header("Location: blog_edit.php?edit=$edit_id"); 
		}
	elseif($post['comment'])
		{
			$comment_id = $post['comment_id'];
			header("Location: comment.php?com=$comment_id"); 
		}
	elseif($post['abort'])
		{
			$comment_id = $post['comment_id'];
			header("Location: blog.php"); 
		}
	elseif($post['priviliges'])
	{
		$user_id = $post['priviliges_id'];
		$isadmin = $post['isadmin'];
		
		if ($isadmin)
			{
				$isadmin = false;
			}
			else
			{
				$isadmin = true;
			}
			
			$connect->query('UPDATE User SET IsAdmin = :isadmin WHERE ID =:id');
			$connect->bindValue(':isadmin', $isadmin, PDO::PARAM_BOOL);
			$connect->bindValue(':id', $user_id, PDO::PARAM_STR);		
			$connect->execute();
	}
	elseif($post['block'])
	{
		$user_id = $post['block_id'];
		$isblocked = $post['isblocked'];
		
		if ($isblocked)
			{
				$isblocked = false;
			}
			else
			{
				$isblocked = true;
			}
			
			$connect->query('UPDATE User SET IsBlocked = :isblocked WHERE ID =:id');
			$connect->bindValue(':isblocked', $isblocked, PDO::PARAM_BOOL);
			$connect->bindValue(':id', $user_id, PDO::PARAM_STR);		
			$connect->execute();
	}

		
		
		
		
		
		