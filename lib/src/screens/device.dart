// モデルクラス

class Device {
  // ID
  late int id;
  // チェックリスト
  late bool check;
  // 端末名
  late String deviceName;
  // バージョン
  late String ver;

  Device(
    this.id,
    this.check,
    this.deviceName,
    this.ver
  );

  Map toJson() {
    return {
      'id' : id,
      'check' : check,
      'deviceName' : deviceName,
      'ver' : ver
    };
  }

  Device.fromJson(Map json) {
    id = json['id'];
    check = json['check'];
    deviceName = json['deviceName'];
    ver = json['ver'];
  }
}