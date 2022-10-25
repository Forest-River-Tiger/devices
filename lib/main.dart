import 'package:devices/src/screens/my_devices.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

// アプリを開いた時に最初に呼ばれる箇所
void main() {
  runApp(const MyDevicePage());
}

class DeviceApp extends StatelessWidget {
  const DeviceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'デバイスリスト',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyDevicePage(),
    );
  }
}
