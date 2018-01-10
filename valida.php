<?php
function libxml_display_error($error) 
{ 
$return = "\n"; 
switch ($error->level) { 
case LIBXML_ERR_WARNING: 
$return .= "\nWarning $error->code: \n"; 
break; 
case LIBXML_ERR_ERROR: 
$return .= "\nError $error->code: \n"; 
break; 
case LIBXML_ERR_FATAL: 
$return .= "\nFatal Error $error->code: \n"; 
break; 
} 
$return .= trim($error->message); 
if ($error->file) { 
$return .= " in $error->file\n"; 
} 
$return .= " on line $error->line\n\n\n"; 

return $return; 
} 

function libxml_display_errors() { 
$errors = libxml_get_errors(); 
foreach ($errors as $error) { 
print libxml_display_error($error); 
} 
libxml_clear_errors(); 
} 

// Enable user error handling 
libxml_use_internal_errors(true); 

$xml = new DOMDocument(); 
$xml->load($argv[1]); 

if (!$xml->schemaValidate('http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd')) { 
print "\n\nIl file ".$argv[1]." non è stato validato !\n"; 
libxml_display_errors(); 
} 
else { 
print "\n\n Il file ".$argv[1]." è stato validato ! \n\n\n"; 
} 

?>
