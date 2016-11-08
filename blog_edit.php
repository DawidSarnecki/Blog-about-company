<?php require_once 'header.php'; 

	$get = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);
	$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		$edit_id = ($get['edit']);
		$connect->query('SELECT Title,Text FROM blogtext WHERE ID = :id');
		$connect->bindValue(':id', $edit_id, PDO::PARAM_STR);
		$rows = $connect->resultset();
		
		if($post['modify'])
		{
			$edit_id = ($get['edit']);
			$title = $post['title'];
			$body = $post['body'];
			
			$connect->query(
			'UPDATE blogtext SET
			Title = :title,
			Text = :body,
			X_UpdateTime = now()
			WHERE ID = :id');
			$connect->bindValue(':title', $title, PDO::PARAM_STR);
			$connect->bindValue(':body', $body, PDO::PARAM_STR);
			$connect->bindValue(':id', $edit_id, PDO::PARAM_STR);
			$connect->execute();
			header("Location: blog.php"); 
		}
		elseif($post['abort'])
		{
			header("Location: blog.php"); 
		}
?>

		<div class="container">
  <div class="row">
   <div class="col-sm-12">
      <div class="panel panel-primary">
        <div class="panel-heading">BLOG
			<ul class="nav navbar-nav navbar-right">
			<li><a>witaj:) <?php echo $userstr; ?> </a></li>
			<li><a href="logout.php" >wyloguj</a></li>
			</ul>
			<h2> Edycja wpisu </h2>
			<form class="form-horizontal" role="form2" method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
				<div class="form-group">
				  <label for="title" class="control-label col-sm-2">Tytuł:</label>
				  <div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title" placeholder="Dodaj tytuł..." value="<?php echo $rows[0]['Title']; ?>" />
					</div>
				</div>
				<div class="form-group">
				  <label for="message" class="control-label col-sm-2" >Treść:</label>
				 <div class="col-sm-10">          
					<textarea name="body" rows="20" cols="50" value="test" class="form-control"><?php echo $rows[0]['Text']; ?></textarea>
				</div>
				</div>
				<div class="form-group">        
				<div class="col-sm-offset-8 col-sm-2">
				<input  class="form-control" type="submit" name="modify" value ="Zapisz zmiany" /> 
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
