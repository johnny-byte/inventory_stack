import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  BluetoothConnection? connection;
  List<BluetoothDevice>? devices;

  @override
  void initState() {
    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) {
                  setState(() {
                    devices = bondedDevices.toList();
                  });
    });
    super.initState();
  }

  void connect(String address) async {
    try {
      connection = await BluetoothConnection.toAddress(address);
      debugPrint('Connected to the device');

      connection!.input?.listen((Uint8List data) {
        //debugPrint('Data incoming: ${ascii.decode(data)}');
        //connection!.output.add(data); // Sending data
        if (ascii.decode(data).contains('!')) {
          connection!.finish(); // Closing connection
          debugPrint('Disconnecting by local host');
        }
      }).onDone(() {
        debugPrint('Disconnected by remote request');
      });
    } catch (_) {
      debugPrint('Cannot connect, exception occured');
    }

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if(devices != null)
          Expanded(child: ListView.builder(
            itemCount: devices!.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(devices![index].name ?? "un named"),
                subtitle: Text(devices![index].address),
                onTap: (){connect(devices![index].address);},
              );
            }
          )),
          ElevatedButton(
              onPressed: connection == null
                  ? null
                  : () {
                      connection!.output.add(ascii.encode("1\n"));// Uint8List.fromList("1".codeUnits));
                    },
              child: const Text("Send msg"))
        ],
      ),
    );
  }
}
