<?php
/*********************************************************** 
* Class name:
*    Blog
* Descripton:
*    Extends Controller
**********************************************************/
class Blog extends Controller
{
	
	/*********************************************************** 
	* Protected members
	************************************************************/  
	protected function Index(){
		$viewmodel = new BlogModel();
		$this->returnView($viewmodel->Index(), true);
	}

	protected function add(){
		if(!isset($_SESSION['is_logged_in'])){
			header('Location: '.ROOT_URL.'shares');
		}
		$viewmodel = new BlogModel();
		$this->returnView($viewmodel->add(), true);
	}
}
