<?php
/*********************************************************** 
* Class name:
*    Bootstrap
* Descripton:
*    initialize action and redirecting controller
**********************************************************/

class Bootstrap
{

	/*********************************************************** 
	* Pivate members
	************************************************************/  	
	private $controller;
	private $action;
	private $request;
	
	 /********************************************************** 
	* Constructor
	************************************************************/
	public function __construct($request)
	{
		$this->request = $request;
		
		// Check the controller and set default controller if dosn't exist
		if($this->request['controller'] == ""){
			$this->controller = 'home';
		} else {
			$this->controller = $this->request['controller'];
		}
		
		// Check the action and set default if dosn't exist
		if($this->request['action'] == ""){
			$this->action = 'index';
		} else {
			$this->action = $this->request['action'];
		}
		
		//echo "constructor is working!";
	}
	
	
	/*********************************************************** 
	* Public members
	************************************************************/  
	
	public function createController(){
		
		// Check Class
		if(class_exists($this->controller)){
			$parents = class_parents($this->controller);
			
			// Check Extend
			if(in_array("Controller", $parents)){
				if(method_exists($this->controller, $this->action)){
					return new $this->controller($this->action, $this->request);
				} else {
					// Method Does Not Exist
					echo '<h1>Method does not exist</h1>';
					return;
				}
			} else {
				// Base Controller Does Not Exist
				echo '<h1>Base controller not found</h1>';
				return;
			}
		} else {
			// Controller Class Does Not Exist
			echo '<h1>Controller class does not exist</h1>';
			return;
		}
		
		//echo "create controller is working!";
	}
	
	
}



	
	
	
	
	
	