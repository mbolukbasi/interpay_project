<?php
spl_autoload_register('AutoLoad');

function AutoLoad($classname)
{
    $directory = 'classes/';
    $fullPath = $directory . $classname . ".php";
    if (!file_exists($fullPath)) {
        return false;
    }
    include_once $fullPath;
}
