<?php

use Phalcon\Mvc\Controller;

use Phalcon\Logger;
use Phalcon\Logger\Adapter\Stream;


class ExampleController extends Controller
{
    public function indexAction()
    {
        // Contoh pengambilan data dari database
        $data = [
            ["id" => 1, "name" => "John"],
            ["id" => 2, "name" => "Jane"],
            // Tambahkan data lain sesuai kebutuhan Anda
        ];

        // Mengubah data menjadi format JSON
        $response = new \Phalcon\Http\Response();
        $response->setJsonContent($data);
        
        // // error_log("Hello, world!"); // Mencatat pesan ke file log server
        // $dataString = var_export($data, true);
        // error_log($dataString);
        
         // Mengubah array menjadi string dengan json_encode
        //  $dataString = json_encode($data);
        //  error_log($dataString);
        
        return $response;
    }   
     
}
 