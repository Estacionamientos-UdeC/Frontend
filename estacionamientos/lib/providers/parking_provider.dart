import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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