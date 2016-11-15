<?php
/**********************************************************************
* Blog About Company MVC
* (second branch)   
* 
* File name:   
*      index.php
* Brief:       
*      Include neccessary files and create boostrap object
* Author:      
*      DawidSarnecki according to 
https://www.udemy.com/learn-object-oriented-php-by-building-a-complete-website/
* Contact:
*      @
***********************************************************************/  
// Start Session

session_start();

require ('config.php');

require('classes/Bootstrap.php');
require('classes/Controller.php');
require('classes/Model.php');

require('controllers/home.php');
require('controllers/blog.php');
require('controllers/contact.php');
require('controllers/user.php');


require('models/home.php');
require('models/blog.php');
require('models/contact.php');
require('models/user.php');
require('aspect/ajax/login_check.php');

$bootstrap = new Bootstrap($_GET);
$controller = $bootstrap->createController();

// Check for the controller
if($controller){
	$controller->executeAction();
}


	
	
	
	
	
	
	
	