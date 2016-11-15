<?php
/*********************************************************** 
* Class name:
*    Model
* Descripton:
*    Data
**********************************************************/

abstract class Model
{
	/*********************************************************** 
	* Protected members
	************************************************************/  	
	
	protected $dbh;
	protected $stmt;

	/*********************************************************** 
	* Constructor
	************************************************************/ 
	
	public function __construct(){
		$this->dbh = new PDO(
		"mysql:host=".DB_HOST.";dbname=".DB_NAME,
		DB_USER, DB_PASS);
		
		$this->dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		
		//add utf8 charset
		$this->dbh->query ('SET NAMES utf8');
		
	}
	
	
	/*********************************************************** 
	* Public members
	************************************************************/  	

	public function query($query){
		$this->stmt = $this->dbh->prepare($query);
	}

	//Binds the prepare statement (anti-SQL injection)
	public function bindValue($param, $value, $type = null){
		if (is_null($type)) {
			switch (true) {
				case is_int($value):
					$type = PDO::PARAM_INT;
					break;
				case is_bool($value):
					$type = PDO::PARAM_BOOL;
					break;
				case is_null($value):
					$type = PDO::PARAM_NULL;
					break;
					default:
					$type = PDO::PARAM_STR;
			}
		}
		$this->stmt->bindValue($param, $value, $type);
	}

	public function execute(){
		$this->stmt->execute();
	}

	public function resultSet(){
		$this->execute();
		return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
	}

	public function lastInsertId(){
		return $this->dbh->lastInsertId();
	}

	public function single(){
		$this->execute();
		return $this->stmt->fetch(PDO::FETCH_ASSOC);
	}
}