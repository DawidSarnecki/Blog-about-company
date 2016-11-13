<?php
/*********************************************************** 
* Class name:
*    Home
* Descripton:
*    Extends Controller
**********************************************************/

class Home extends Controller
{
	
	/*********************************************************** 
	* Protected members
	************************************************************/  
	
	protected function Index(){
		$viewmodel = new HomeModel();
		$this->returnView($viewmodel->Index(), true);
	}
}