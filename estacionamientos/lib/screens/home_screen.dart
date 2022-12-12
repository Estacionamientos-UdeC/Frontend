import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  final WebSocketChannel channel = IOWebSocketChannel.connect("ws://127.0.0.1:8000/websocket");
  final String errorMessage = "Error retrieving data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estacionamientos')),
      backgroundColor: Colors.white,
      body: Center(
        child: StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                snapshot.hasData ? '${snapshot.data}' : errorMessage,
                style: TextStyle(fontSize: 20.0)
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}