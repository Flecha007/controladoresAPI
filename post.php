<?php
include "config.php";
include "utils.php";


$dbConn =  connect($db);


if ($_SERVER['REQUEST_METHOD'] == 'GET')
{

      $sql = $dbConn->prepare("SELECT nombre_cliente, ci_cliente, tpaquetes.nombre as nombre_paquete, `cantidad_días`, total, usuario.nombre as nombre_usuario, fecha, `observación`  FROM usuario INNER JOIN tventas
      ON usuario.id = tventas.id_usuario INNER JOIN tpaquetes
      ON tpaquetes.cod_paquete = tventas.cod_paquete");
      $sql->execute();
      $sql->setFetchMode(PDO::FETCH_ASSOC);
      header("HTTP/1.1 200 OK");
      echo json_encode( $sql->fetchAll()  );
      exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
    $input = $_POST;
    $sql = "INSERT INTO tventas
          (nombre_cliente, ci_cliente, cod_paquete, cantidad_días, total, id_usuario, fecha, observación)
          VALUES
          (:nombre_cliente, :ci_cliente, :cod_paquete, :cantidad_días, :total, :id_usuario, :fecha, :observación)";
    $statement = $dbConn->prepare($sql);
    bindAllValues($statement, $input);
    $statement->execute();
    $postId = $dbConn->lastInsertId();
    if($postId)
    {
      $input['id_venta'] = $postId;
      header("HTTP/1.1 200 OK");
      echo json_encode($input);
      exit();
	 }
}

?>