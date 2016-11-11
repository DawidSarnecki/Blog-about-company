<?php
$connect->query(
			'SELECT * FROM blog_public');
			$rows_show = $connect->resultset(); ?>

			<ul class="nav navbar-nav navbar-right">
			<li><a href="login.php">logowanie</a></li>
			<li><a href="register.php">rejestracja</a></li>
			</ul>
			</div>
			</div>
			
			<?php foreach ($rows_show as $row) : ?>
				<div id="blogItem">
				<h3><?php echo $row['Title']; ?></h3>
				<h10><?php echo $row['Login'].", ".$row['X_UpdateTime']; ?></h10>
				<p><?php echo $row['Text']; ?></p>
				<p><a href="login.php"> + Dodaj komentarz</a><p>
				
					<?php $connect->query(
							'SELECT * FROM all_comments 
							WHERE BlogItemID = :blog_id');
						
						$connect->bindValue(':blog_id', $row['blogtext_id'], PDO::PARAM_STR);
						$comments = $connect->resultset();
				
							if ($comments) : ?>
							
								<?php foreach ($comments as $row) : ?>
									<div id="comment">
									<p><?php echo $row['Login'].", ".$row['Time']; ?></p>
									<p><?php echo $row['Text']; ?></p>
									</div>
								<?php endforeach;
								
							endif; ?>

				</div>
				</br></br>
			<?php endforeach;?>
				
