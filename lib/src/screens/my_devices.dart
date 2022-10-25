import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:devices/src/screens/all_devices.dart';
import 'device.dart';

class MyDevicePage extends StatelessWidget {
  const MyDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    return Scaffold(
      // AppBarはnavigationbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red.withOpacity(0.5),
        title: const Text(
          'デバイス一覧',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}

