<?php 
require_once 'header.php'; 
require_once 'source/blog_src.php'; 
?>


<div class="container">
<div class="row">
<div class="col-sm-12">
<div class="panel panel-primary">
<div class="panel-heading">BLOG

<?php 
	if ($loggedin)
	{
		if ($_SESSION['IsAdmin'])
		{
		require_once 'menu_admin.php'; 
		require_once 'source/form_login.php'; 		
		require_once 'source/blog_admin.php';
		}
		else
		{
		require_once 'menu_user.php';
		require_once 'source/form_login.php'; 
		require_once 'source/blog_user.php';
		}
	}
	else
	require_once 'source/blog_public.php'; 
?>
</div>
</div> 
</div> 
</div> 
</div> 

<?php require_once 'footer.php'; ?>
