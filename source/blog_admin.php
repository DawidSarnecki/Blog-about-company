</div>	
		<h2> Ostatnie wpisy </h2>
		<?php foreach ($rows as $row) : ?>
			<div id ="blogItem">
			<h3><?php echo $row['Title']; ?></h3>
			<h10><?php echo $row['Login'].", ".$row['X_UpdateTime']; ?></h10>
			<p><?php echo $row['Text']; ?></p>
				<form method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
				<ul class="nav navbar-nav navbar-right">
					<?php if ($row['Status'] == 0) : ?>
						<li>
						status: Ukryty
						<input type="hidden" name="show_id" value="<?php echo $row['blogtext_id']; ?>"/>
						<input type="submit" name="change_status" value="Wyświetl"/>
						</li>
					<?php elseif ($row['Status'] == 1) : ?>
						<li>
						<p>status: Wyświetlany
						<input type="hidden" name="hide_id" value="<?php echo $row['blogtext_id']; ?>"/>
						<input type="submit" name="change_status" value="Ukryj">
						</p>
						</li>
					<?php  endif; ?>
				
					<li>
						<input type="hidden" name="edit_id" value="<?php echo $row['blogtext_id']; ?>"/>
						<input type="submit" name="edit" value="Edytuj wpis"/>
					</li>
					<li>
						<input type="hidden" name="comment_id" value="<?php echo $row['blogtext_id']; ?>"/>
						<input type="submit" name="comment" value="Skomentuj"/>
					</li>
					<li>
						<input type="hidden" name="archive_id" value="<?php echo $row['blogtext_id']; ?>"/>
						<input type="submit" name="archive" value="Do archiwum"/>
					</li>
				</ul>
				</form>
				<br>
			<?php $connect->query(
					'SELECT  Author, Text, BlogComment.ID as ID, BlogComment.X_CreateTime as Time, Login
						FROM blogcomment 
						JOIN USER ON BlogComment.Author = USER.ID
						WHERE BlogItemID = :blog_id
						ORDER BY Time DESC');
						$connect->bindValue(':blog_id', $row['blogtext_id'], PDO::PARAM_STR);
						$comments = $connect->resultset();
				
							if ($comments) : ?>
							
								<?php foreach ($comments as $row) : ?>
									<div id="comment">
									<p><?php echo $row['Login'].", ".$row['Time']; ?></p>
									<p><?php echo $row['Text']; ?></p>
									
									<form method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
									<ul class="nav navbar-nav navbar-right">
										<li>
										<input type="hidden" name="del_id" value="<?php echo $row['ID']; ?>"/>
										<input type="submit" name="delcom" value="Usuń"/>
										</li>
									</div>
								<?php endforeach;
							endif; ?>			
			</div>
			</br>
		<?php endforeach; ?>
		<br>
		