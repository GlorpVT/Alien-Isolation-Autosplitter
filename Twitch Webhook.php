<?php
 
$channelName = 'bobross';
 
$clientId = 'sjpj7s665dp1nnlyepbrf0khxf0sz6';         
$online = 'online';    
$offline = 'offline';   
$json_array = json_decode(file_get_contents('https://api.twitch.tv/kraken/streams/'.strtolower($channelName).'?client_id='.$clientId), true);
 
if ($json_array['stream'] != NULL) {
    $channelTitle = $json_array['stream']['channel']['display_name'];
    $streamTitle = $json_array['stream']['channel']['status'];
    $currentGame = $json_array['stream']['channel']['game'];
 
    echo "online";
} else {
    echo "offline";
}
?>