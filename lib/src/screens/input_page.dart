import 'package:flutter/material.dart';
import 'device_list_store.dart';
import 'device.dart';
import 'dart:developer';

enum os { Android, iOS }

class InputPage extends StatefulWidget {
  final Device? device;

  const InputPage({Key? key, this.device}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final DeviceListStore _store = DeviceListStore();

  late bool _isCreateDevice;

  /// デバイス名
  late String _deviceTitle;

  /// バージョン
  late String _ver;

  /// OS
  late String _os;

  /// 人物
  late String _name;

  @override
  void initState() {
    super.initState();
    var device = widget.device;

    _deviceTitle = device?.deviceTitle ?? "";
    _ver = device?.ver ?? "";
    _os = device?.os ?? "";
    _name = device?.name?? "";
    _isCreateDevice = device == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100),
                TextFormField(
                  // テキストラベル
                  decoration: InputDecoration(labelText: 'OS'),
                  controller: TextEditingController(text: _os),
                  onChanged: (String value) {
                    _os = value;
                  },
                ),
                const SizedBox(height: 50),
                TextFormField(
                  // テキストラベル
                  decoration: InputDecoration(labelText: 'Device'),
                  controller: TextEditingController(text: _deviceTitle),
                  onChanged: (String value) {
                    _deviceTitle = value;
                  },
                ),
                const SizedBox(height: 50),
                TextFormField(
                  // テキストラベル
                  decoration: InputDecoration(labelText: "Ver"),
                  controller: TextEditingController(text: _ver),
                  onChanged: (String value) {
                    _ver = value;
                  },
                ),
                const SizedBox(height: 50),
                TextFormField(
                  // テキストラベル
                  decoration: InputDecoration(labelText: "Name"),
                  controller: TextEditingController(text: _name),
                  onChanged: (String value) {
                    _name = value;
                  },
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isCreateDevice) {
                        _store.add(_os, _deviceTitle, _ver, _name);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text('デバイスを追加'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('キャンセル'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
