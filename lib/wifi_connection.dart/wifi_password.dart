import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:wifi_scan/wifi_scan.dart';

class EnterPassword extends StatefulWidget {
  const EnterPassword({super.key, required this.ssid, required this.ipvp4});
  final WiFiAccessPoint ssid;
  final String ipvp4;

  @override
  State<EnterPassword> createState() => _EnterPasswordState();
}

TextEditingController passWordController = TextEditingController();

class _EnterPasswordState extends State<EnterPassword> {
  @override
  Widget build(BuildContext context) {
    
    void sendWifiCredentialsToServer(
        String ssid, String password, String ipvp4) async {
      final channel = IOWebSocketChannel.connect('ws://$ipvp4:81');

      final message = json.encode({
        "Text1": ssid,
        "Text2": password,
      });
      channel.sink.add(message);
      Navigator.pop(context);
      // Don't forget to close the WebSocket connection when done
      channel.sink.close();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(231, 238, 250, 1),
        foregroundColor: Colors.black,
        title: Image.asset(
          'assets/SV.png',
          height: 20,
        ),
      ),
      backgroundColor: const Color.fromRGBO(231, 238, 250, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Wifi Name : ${widget.ssid.ssid}',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: passWordController,
            ),
            ElevatedButton(
                onPressed: () {
                  sendWifiCredentialsToServer(
                      widget.ssid.ssid, passWordController.text, widget.ipvp4);
                },
                child: const Text('Submit')),
            Text(widget.ipvp4)
          ],
        ),
      ),
    );
  }
}
