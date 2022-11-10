import 'package:devices/src/screens/device_list_store.dart';
import 'package:flutter/material.dart';

import 'screens/all_devices.dart';
import 'screens/input_page.dart';
import 'screens/device.dart';
import 'package:devices/src/app.dart';

class DeviceApp extends StatelessWidget {
  const DeviceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリケーションのタイトル
      title: 'デバイスリスト',
      // アプリケーションのテーマ
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AllDeviceListPage(),
    );
  }
}