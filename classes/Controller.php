<?php
/*********************************************************** 
* Class name:
*    Bootstrap
* Descripton:
*    Comunication between View and Model
**********************************************************/
abstract class Controller
{

	/*********************************************************** 
	* Protected members
	************************************************************/  	
	
	protected $request;
	protected $action;

	 /********************************************************** 
	* Constructor
	************************************************************/
	
	public function __construct($action, $request){
		$this->action = $action;
		$this->request = $request;
	}
	
	/*********************************************************** 
	* Public members
	************************************************************/ 
	public function executeAction(){
		return $this->{$this->action}();
	}

	/*********************************************************** 
	* Protected members
	************************************************************/ 	
	protected function returnView($viewmodel, $fullview){
		$view = 'views/'. get_class($this). '/' . $this->action. '.php';
		if($fullview){
			require('views/main.php');
		} else {
			require($view);
		}
	}
}