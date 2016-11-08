<?php require_once 'header.php'; 
$connect->query(
					'SELECT Author, Text, BlogComment.X_CreateTime as Time, Login
					FROM blogcomment 
					JOIN USER ON BlogComment.Author = USER.ID
					where BlogItemID = :blog_id');
					$connect->bindValue(':blog_id', $row['blogtext_id'], PDO::PARAM_STR);
					$comments = $connect->resultset();
					if ($comments) : ?>

					<?php foreach ($comments as $row) : ?>
						<div id="comment">
						<p><?php echo $row['Login'].", ".$row['Time']; ?></p>
						<p><?php echo $row['Text']; ?></p>
						</div>
					<?php endforeach;?>

					<?php endif; ?>