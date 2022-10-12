import 'package:estacionamientos/providers/parking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ParkingProvider characterProvider = Provider.of<ParkingProvider>(context);
    dynamic responseFromBackend = characterProvider.onDisplayMessage.toString();

    return Scaffold(
      appBar: AppBar(title: const Text('Estacionamientos')),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(responseFromBackend),
      )
    );
  }
}