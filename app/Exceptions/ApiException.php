<?php

namespace App\Exceptions;

use Exception;

class ApiException extends Exception
{
    private $json;

    public function __construct($message)
    {
        $this->json = ["success" => false,
            "exception" => [
                "message" => $message
            ]];
    }

    public function render($request)
    {       
        return response()->json($this->json);       
    }
}
