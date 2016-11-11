<?php require_once 'header.php';
require_once 'source/blog_src.php'; 
?>

<div class="container">
  <div class="row">
   <div class="col-sm-12">
      <div class="panel panel-primary">
        <div class="panel-heading">BLOG -> UŻYTKOWNICY
<?php 			
			$connect->query(
			'SELECT *, User.id as user_id
			FROM User
			JOIN Activity ON User.ID=Activity.UserID');
			$rows = $connect->resultset();
						
if ($loggedin) : 
if ($_SESSION['IsAdmin']) :
			
			require_once 'menu_admin.php';

			foreach ($rows as $row) : ?>
			<div id ="blogItem">
			<h3><?php echo $row['Login']; ?></h3>
			<p>@mail: <?php echo $row['Email']; ?> </p>
				
				<?php if ($row['IsAdmin']) : ?>
							<p>ROLA: ADMIN</p>
				<?php else : ?>
							<p>ROLA: USER</p>
				<?php  endif; ?>
				
			<p>WPISÓW: <?php echo $row['Blogs']; ?> </p>
			<p>KOMENTARZY: <?php echo $row['Comments']; ?></p>
			<p>DOŁĄCZYŁ: <?php echo $row['X_CreateTime']; ?></p>
			<p>OSTATNIA AKTYWNOŚĆ: <?php echo $row['LastActivity']; ?></p>
			
				<?php if ($row['IsBlocked']) : ?>
							<h3>KONTO ZABLOKOWANE</h3>
				<?php  endif; ?>
			
				
				<form method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
				<ul class="nav navbar-nav navbar-right">
					<li>
						<input type="hidden" name="priviliges_id" value="<?php echo $row['user_id']; ?>"/>
						<input type="hidden" name="isadmin" value="<?php echo $row['IsAdmin']; ?>"/>
						<input type="hidden" name="isadmin" value="<?php echo $row['IsAdmin']; ?>"/>
						<input type="submit" name="priviliges" value="Zmień Rolę"/>
					</li>
					<li>					
						<input type="hidden" name="block_id" value="<?php echo $row['user_id']; ?>"/>
						<input type="hidden" name="isblocked" value="<?php echo $row['IsBlocked']; ?>"/>
						<input type="submit" name="block" value="Zablokuj/Odblokuj">
					</li>
				</ul>
				</form>
				<br>
			</div>
			</br>
		<?php endforeach; ?>
		
<?php else :

		require_once 'menu_user.php';
		
		foreach ($rows as $row) : ?>
			<div id ="blogItem">
			<h3><?php echo $row['Login']; ?></h3>
				
				<?php if ($row['IsAdmin']) : ?>
							<p>ROLA: ADMIN</p>
				<?php else : ?>
							<p>ROLA: USER</p>
				<?php  endif; ?>
				
			<p>WPISÓW: <?php echo $row['Blogs']; ?> </p>
			<p>KOMENTARZY: <?php echo $row['Comments']; ?></p>
			<p>DOŁĄCZYŁ: <?php echo $row['X_CreateTime']; ?></p>
			<p>OSTATNIA AKTYWNOŚĆ: <?php echo $row['LastActivity']; ?></p>
			</div>
			</br>
		<?php endforeach; ?>

<?php endif; ?>		
<?php else :
	header("Location: blog.php");  
endif; ?>
		</div>
		</div>
		</div>
		</div>
</div>			

<?php require_once 'footer.php'; ?>
