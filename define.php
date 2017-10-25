<?php

/**
 * Your database authentication information goes here
 * @see http://dbv.vizuina.com/documentation/
 */
define('DBDIFF_DEV', $project->dev);
define('DBDIFF_PROD', $project->prod);


define('DB_HOST', $project->host);
define('DB_PORT', $project->port);
define('DB_USERNAME', $project->user);
define('DB_PASSWORD', $project->pass);
define('DB_DEV_NAME', $project->dev);
define('DB_NAME', $project->prod);


/**
 * @see http://dbv.vizuina.com/documentation/#writing-adapters
 */
define('DB_ADAPTER', 'MySQL');

define('DS', DIRECTORY_SEPARATOR);
define('DBV_ROOT_PATH', dirname(__FILE__));

/**
 * Only edit this lines if you want to place your schema files in custom locations
 * @see http://dbv.vizuina.com/documentation/#optional-settings
 */
define('DBV_DATA_PATH', DBV_ROOT_PATH . DS . 'data'. DS . $project->name);
define('DBV_SCHEMA_PATH', DBV_DATA_PATH . DS . 'schema');
define('DBV_REVISIONS_PATH', DBV_DATA_PATH . DS . 'revisions');
define('DBV_META_PATH', DBV_DATA_PATH . DS . 'meta');

if(!file_exists(DBV_SCHEMA_PATH)) mkdir(DBV_SCHEMA_PATH, 0755, true);
if(!file_exists(DBV_REVISIONS_PATH)) mkdir(DBV_REVISIONS_PATH, 0755, true);
if(!file_exists(DBV_META_PATH)) mkdir(DBV_META_PATH, 0755, true);

ini_set('magic_quotes_gpc', 'Off');
error_reporting(E_ALL ^ E_NOTICE);

/**
 * I18n support
 */
define('DBV_LANGUAGES_PATH', DBV_ROOT_PATH . DS . 'languages');
define('DEFAULT_LOCALE', 'en_US');
define('DEFAULT_ENCODING', 'UTF-8');
define('DEFAULT_DOMAIN', 'default');

putenv("LC_ALL=".DEFAULT_LOCALE);
setlocale(LC_ALL, DEFAULT_LOCALE);

bindtextdomain(DEFAULT_DOMAIN, DBV_LANGUAGES_PATH);
bind_textdomain_codeset(DEFAULT_DOMAIN, DEFAULT_ENCODING);
textdomain(DEFAULT_DOMAIN);