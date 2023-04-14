<?php

namespace App\Exceptions;

use Exception;

class FieldException extends Exception
{
    private $json = [
        "success" => false,
        "exception" => [
            "message" => "Nickname and passwords fields are required"
        ]
    ];

    public function render($request)
    {
        return response()->json($this->json);
    }
}
