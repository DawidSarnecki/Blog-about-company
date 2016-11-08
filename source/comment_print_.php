<?php require_once 'header.php';
$get = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);
	
		$blog_id = $get['blog_id'];
$connect->query(
					'SELECT Author, Text, BlogComment.X_CreateTime as Time, Login
					FROM blogcomment 
					JOIN USER ON BlogComment.Author = USER.ID
					WHERE BlogItemID = :blog_id
					ORDER BY Time DESC');
					$connect->bindValue(':blog_id', $blog_id, PDO::PARAM_STR);
					$comments = $connect->resultset();
					if ($comments) : ?>

					<?php foreach ($comments as $row) : ?>
						<div id="comment">
						<p><?php echo $row['Login'].", ".$row['Time']; ?></p>
						<p><?php echo $row['Text']; ?></p>
						</div>
					<?php endforeach;?>

					<?php endif; ?>