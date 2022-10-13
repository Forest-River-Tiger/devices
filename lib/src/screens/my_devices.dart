import 'package:devices/src/screens/all_devices.dart';
import 'package:flutter/material.dart';

class MyDevicePage extends StatelessWidget {
  const MyDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    return Scaffold(
      // AppBarはnavigationbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 238, 167, 149),
        title: const Text('デバイス一覧'),
      ),
    );
  }
}
