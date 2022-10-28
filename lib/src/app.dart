import 'package:devices/src/screens/device_list_store.dart';
import 'package:flutter/material.dart';

import 'screens/my_device_list.dart';
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
      home: const DeviceListPage(),
    );
  }
}

class DeviceListPage extends StatefulWidget {
  const DeviceListPage({Key? key}) : super(key: key);

  @override
  State<DeviceListPage> createState() => _DeviceListPageState();
}

class _DeviceListPageState extends State<DeviceListPage> {
  final DeviceListStore _store = DeviceListStore();
  static const _screens = [
    MyDeviceListPage(),
    AllDeviceListPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.phone_iphone), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'お気に入り'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}