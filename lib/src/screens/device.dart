
class Device {
  /// ID
  late int id;

    /// チェック
  late bool check;

  /// 端末名
  late String deviceTitle;

  /// バージョン
  late String ver;

  /// コンストラクタ
  Device(
    this.id,
    this.check,
    this.deviceTitle,
    this.ver,
  );

  /// TodoモデルをMapに変換する(保存時に使用)
  Map toJson() {
    return {
      'id': id,
      'done': check,
      'title': deviceTitle,
      'detail': ver
    };
  }

  /// MapをTodoモデルに変換する(読込時に使用)
  Device.fromJson(Map json) {
    id = json['id'];
    check = json['check'];
    deviceTitle = json['deviceTitle'];
    ver = json['ver'];
  }
}