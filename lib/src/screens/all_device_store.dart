import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'device.dart';

// ストアクラス(取得/追加/削除/保存/読込)

class AllDeviceStore {
  final String _saveKey = 'Device';

  List<Device> _list = [];

  static final AllDeviceStore _instance = AllDeviceStore._internal();  

  AllDeviceStore._internal();

  factory AllDeviceStore() {
    return _instance;
  }

  int count() {
    return _list.length;
  }

  Device findByIndex(int index) {
    return _list[index];
  }

  // デバイスの追加
  void add(bool check, String deviceName, String ver) {
    var id = count() == 0 ? 1 : _list.last.id + 1;
    var device = Device(id, check, deviceName, ver);
    _list.add(device);
    save();
  }

  // デバイスの削除
  void delete(Device device) {
    _list.remove(device);
    save();
  }

  // デバイスの保存
  void save() async {
    var prefs = await SharedPreferences.getInstance();
    var saveTargetList = _list.map((a) => json.encode(a.toJson())).toList();
    prefs.setStringList(_saveKey, saveTargetList);
  }
}