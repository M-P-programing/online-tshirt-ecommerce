<?php 

class Database {
	public static function connect(){
		$db = new mysqli('localhost', 'Marco', 'root', 'master_shop');
		$db->query("SET NAMES 'utf8");
		return $db;
	}
}