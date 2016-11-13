<?php
class Connection
{
	private $dbhost = 'localhost';
	private $dbname = 'sdbm';
	private $dbuser = 'admin';
	private $dbpass = 'Admin1234';
	
	private $conn;
	private $error;
	private $query;
	
	public function __construct()
	{
	// Connect to a MySQL database using driver invocation using Data Source Name (dsn)
		$dsn = 'mysql:host='. $this->dbhost .  ';dbname='. $this->dbname;

	// Create new PDO connection
		try 
		{
			$this->conn = new PDO($dsn, $this->dbuser, $this->dbpass);
			$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			//add utf8 charset
			$this->conn->query ('SET NAMES utf8');

		}catch(PDOException $e)
		{
			$this->error = $e ->getMessage();
			echo $this->error;
		}
	}

	public function query($query)
	{
		$this->query = $this->conn->prepare($query);
	}

	public function resultset()
	{
		$this->execute();
		return $this->query->fetchAll(PDO::FETCH_ASSOC);
	}

	public function execute()
	{
		return $this->query->execute();
	}
	
	public function bindValue($param, $value, $type)
	{
		 $this->query->bindValue($param, $value, $type);
	}

}