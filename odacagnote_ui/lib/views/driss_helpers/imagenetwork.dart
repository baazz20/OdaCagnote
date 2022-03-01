import 'package:flutter/material.dart';

ImageProvider verifImage(var url){
  if(url==null){
    return NetworkImage('http://192.168.252.127:8000/media/default.png');
  }
  else{
    return NetworkImage('http://192.168.252.127:8000${url}');
  }
}