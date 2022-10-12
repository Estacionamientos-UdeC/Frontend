import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final CharacterProvider characterProvider = Provider.of<CharacterProvider>(context);
    //int numOfCharacters = characterProvider.onDisplayCharacters.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Estacionamientos')),
      backgroundColor: Colors.white,
      body: Center(
        child: const Text("Texto de prueba"),
      )
    );
  }
}