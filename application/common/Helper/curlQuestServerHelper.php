<?php
namespace app\common\helper;
class curlQuestServerHelper{
  public static function curlQuestData($url,$curlPost){
    $httpHeader=createHttpHeader()
    $ch=curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURL_HTTPHEADER,$httpHeader);
    curl_setopt($ch,CURL_HEADER,false);
    curl_setopt($ch,CURLOPT_POST,1);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$curlPost);
    curl_setopt($ch,CURLOPT_TIMEOUT,30);
    curl_setopt($ch,CURLOPT_DNS_USER_GLOBAL_CACHE,false);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
    $data=curl_exec($ch);
    curl_close($ch);
    return $data;
  }
}
 ?>
