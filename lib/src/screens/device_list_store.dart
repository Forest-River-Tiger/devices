import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'device.dart';

class DeviceListStore {

  final String _saveKey = "Device";

  List<Device> _list = [];

  static final DeviceListStore _instance = DeviceListStore._internal();

  DeviceListStore._internal();

  factory DeviceListStore() {
    return _instance;
  }

  int count() {
    return _list.length;
  }

  Device findByIndex(int index) {
    return _list[index];
  }

  /// "yyyy/MM/dd HH:mm"形式で日時を取得する
  String getDateTime() {
    var format = DateFormat("yyyy/MM/dd HH:mm");
    var dateTime = format.format(DateTime.now());
    return dateTime;
  }

  /// Todoを追加する
  void add(String os, String deviceTitle, String ver) {
    var id = count() == 0 ? 1 : _list.last.id + 1;
    var dateTime = getDateTime();
    var todo = Device(id, os, deviceTitle, ver);
    _list.add(todo);
    save();
  }

  /// Todoを更新する
  // void update(Device todo, bool done, [String? title, String? detail]) {
  //   todo.done = done;
  //   if (title != null) {
  //     todo.title = title;
  //   }
  //   if (detail != null) {
  //     todo.detail = detail;
  //   }
  //   todo.updateDate = getDateTime();
  //   save();
  // }

  /// Todoを削除する
  void delete(Device device) {
    _list.remove(device);
    save();
  }

  /// Todoを保存する
  void save() async {
    var prefs = await SharedPreferences.getInstance();
    // SharedPreferencesはプリミティブ型とString型リストしか扱えないため、以下の変換を行っている
    // TodoList形式 → Map形式 → JSON形式 → StrigList形式
    var saveTargetList = _list.map((a) => json.encode(a.toJson())).toList();
    prefs.setStringList(_saveKey, saveTargetList);
  }

  /// Todoを読込する
  void load() async {
    var prefs = await SharedPreferences.getInstance();
    // SharedPreferencesはプリミティブ型とString型リストしか扱えないため、以下の変換を行っている
    // StrigList形式 → JSON形式 → Map形式 → TodoList形式
    var loadTargetList = prefs.getStringList(_saveKey) ?? [];
    _list = loadTargetList.map((a) => Device.fromJson(json.decode(a))).toList();
  }
}