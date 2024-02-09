<?php
$path = 'stuff.txt';
if (isset($_POST['submission'])) {
    $fh = fopen($path,"a+");
    $string = $_POST['submission'];
    fwrite($fh,$string); // Write information to the file
    fclose($fh); // Close the file
}
?>