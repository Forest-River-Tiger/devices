import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/my_devices.dart';
import 'screens/all_devices.dart';
import 'screens/add_device.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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