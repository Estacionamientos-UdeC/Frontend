import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //final ParkingProvider characterProvider = Provider.of<ParkingProvider>(context);
    //dynamic responseFromBackend = characterProvider.onDisplayMessage.toString();

    final channel = IOWebSocketChannel.connect('ws://127.0.0.1:8000/ws');

    return Scaffold(
      appBar: AppBar(title: const Text('Estacionamientos')),
      backgroundColor: Colors.white,
      body: Center(
        child: StreamBuilder(
          stream: channel.stream, 
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(snapshot.hasData ? '${snapshot.data}' : '',style: TextStyle(fontSize: 20.0)),
            );
          }
        )
      ) //Text(responseFromBackend ,style: TextStyle(fontSize: 20.0)),
    );
  }
}