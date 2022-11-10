
class Device {
  /// ID
  late int id;

  /// OS
  late String os;

  /// 端末名
  late String deviceTitle;

  /// バージョン
  late String ver;

  // 人物
  late String name;

  /// コンストラクタ
  Device(
    this.id,
    this.os,
    this.deviceTitle,
    this.ver,
    this.name,
  );

  /// TodoモデルをMapに変換する(保存時に使用)
  Map toJson() {
    return {
      'id': id,
      'done': os,
      'title': deviceTitle,
      'ver': ver,
      'name': name
    };
  }

  /// MapをTodoモデルに変換する(読込時に使用)
  Device.fromJson(Map json) {
    id = json['id'];
    os = json['os'];
    deviceTitle = json['deviceTitle'];
    ver = json['ver'];
    name = json['name'];
  }
}