﻿</div>			
		<h2> Ostatnie wpisy </h2>
		<?php foreach ($rows as $row) : ?>
		
			<div id = "blogItem">
			<h3><?php echo $row['Title']; ?></h3>
			<h10><?php echo $row['Login'].", ".$row['X_UpdateTime']; ?></h10>
			<p><?php echo $row['Text']; ?></p>
			
				<form method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
				<ul class="nav navbar-nav navbar-right">
		<?php if ($row['X_CreateUser'] == $_SESSION['ID']): 
					if ($row['Status'] == 0) : ?>
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
		<?php else : ?>
					<li>
						<input type="hidden" name="comment_id" value="<?php echo $row['blogtext_id']; ?>"/>
						<input type="submit" name="comment" value="Skomentuj"/>
					</li>
		<?php endif; ?>		
				
				</ul>
				</form>
				<br>
				
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
			</br>
		<?php endforeach; ?>
		<br>
	