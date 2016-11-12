<?php require_once 'header.php'; 
require_once 'source/blog_src.php'; 
	$get = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);
	$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		$comment_id = ($get['com']);

		$connect->query('SELECT Title, Login, Text, X_UpdateTime, blogtext.ID as blogtext_id 
			FROM blogtext 
			JOIN User ON blogtext.X_CreateUser = User.ID 
			WHERE X_RemoveTime IS NULL AND blogtext.ID = :id
			ORDER BY Status DESC, X_UpdateTime DESC');
			$connect->bindValue(':id', $comment_id, PDO::PARAM_STR);
			$rows = $connect->resultset();
			
		if($post['addcomment'])
		{
			$comment = $post['body'];
			$connect->query(
			'INSERT INTO blogcomment
			(BlogItemID, Author, Text) VALUES(:id , :user_id, :body)');
			$connect->bindValue(':id', $comment_id, PDO::PARAM_STR);
			$connect->bindValue(':user_id',$_SESSION['ID'], PDO::PARAM_STR);
			$connect->bindValue(':body', $comment, PDO::PARAM_STR);
			$connect->execute();
			
			header("Location: blog.php"); 
		}

?>

<div class="container">
  <div class="row">
   <div class="col-sm-12">
      <div class="panel panel-primary">
        <div class="panel-heading">
			<?php foreach ($rows as $row) : ?>
				<div>
				<h3><?php echo $row['Title']; ?></h3>
				<h10><?php echo $row['Login'].", ".$row['X_UpdateTime']; ?></h10>
				<p><?php echo $row['Text']; ?></p>
				</div>
			<?php endforeach; ?>

			<h2> Dodaj komentarz </h2>
			<form class="form-horizontal" role="form2" method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
				<div class="form-group">
				 <div class="col-sm-12">          
				<textarea name="body" rows="4" cols="50" value="test" class="form-control" placeholder="Mój komentarz..." ></textarea>
				</div>
				</div>
				<div class="form-group">
				<div class="col-sm-offset-8 col-sm-2">
				<input  class="form-control" type="submit" name="addcomment" value ="Dodaj komentarz" /> 
				</div>
				<div class="col-sm-2">
				<input  class="form-control" type="submit" name="abort" value ="Anuluj zmiany" /> 
				</div>
				</div>
			</form>
			</br>
			</br>
		</div>
</div>					
		
			
<?php require_once 'footer.php'; ?>