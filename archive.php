<?php require_once 'header.php';
require_once 'source/blog_src.php'; 

	if ($loggedin) 
	{
		require_once 'source/archive_src.php'; 
		require_once 'footer.php';
	}
	else
		header("Location: blog.php"); 
?>
