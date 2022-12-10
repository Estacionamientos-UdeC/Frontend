import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:estacionamientos/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BasicResponse{
  BasicResponse(this.key, this.value);
  final dynamic key;
  final dynamic value;

  // named constructor
  BasicResponse.fromJson(Map<dynamic, dynamic> json)
      : key = json['ping'],
        value = json['value'];
  // method
  Map<dynamic, dynamic> toJson() {
    return {
      'ping': key,
      'value': value,
    };
  }
 
}

class ParkingProvider extends ChangeNotifier{

  dynamic onDisplayMessage;
  
  ParkingProvider(){
    log("Se instancia parking provider");
    getOnDisplayParkingAvailable();
  }

  getOnDisplayParkingAvailable() async{
    const String mainURL = 'http://127.0.0.1:8000/';
    
    try{
      final response = await http.get(Uri.parse(mainURL));
      
      if(response.statusCode == 200){
        onDisplayMessage = json.decode(response.body);
        print(onDisplayMessage);
      }else{
        onDisplayMessage = "";
      }


    } on SocketException catch(e){
      onDisplayMessage = 'Problemas de conexión';
    } on HttpException catch(e){
      onDisplayMessage = 'Problemas en la Petición Http';
    } 
    notifyListeners();
  }
}