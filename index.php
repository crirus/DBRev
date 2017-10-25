<?php
error_reporting(E_ERROR & ~E_NOTICE);
$project = '';
require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . 'DBV.php';
require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . 'projects.php';
require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . 'config.php';
require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . 'define.php';
require_once dirname(__FILE__) . DIRECTORY_SEPARATOR . 'lib/functions.php';


$dbv = DBV::instance();
$dbv->setProject($project);
$dbv->authenticate();
$dbv->dispatch();