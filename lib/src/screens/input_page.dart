import 'package:flutter/material.dart';
import 'device_list_store.dart';
import 'device.dart';

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

  /// チェック
  late bool _check;

  os _gValue = os.Android;

  void _onChanged(os value) {
    setState(() {
      _gValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    var device = widget.device;

    _deviceTitle = device?.deviceTitle ?? "";
    _ver = device?.ver ?? "";
    _check = device?.check ?? false;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: os.Android,
                          groupValue: _gValue,
                          onChanged: (value) => _onChanged(os.Android),
                        ),
                        Text('Android')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: os.iOS,
                          groupValue: _gValue,
                          onChanged: (value) => _onChanged(os.iOS),
                        ),
                        Text('iOS')
                      ],
                    ),
                  ],
                ),
                                const SizedBox(height: 50),
                TextFormField(
                  // テキストラベル
                  decoration: InputDecoration(labelText: '端末名'),
                  onChanged: (String value) {
                  },
                ),
                const SizedBox(height: 50),
                TextFormField(
                  // テキストラベル
                  decoration: InputDecoration(labelText: "Ver"),
                  onChanged: (String value) {
                  },
                ),
                const SizedBox(height: 50),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).pop()
                      },
                      child: Text('キャンセル'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text('デバイス追加'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Container(
      //   padding: const EdgeInsets.all(30),
      //   child: Column(
      //     children: <Widget>[
      //       const SizedBox(height: 100),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           Row(
      //             children: [
      //               Radio(
      //                 value: os.Android,
      //                 groupValue: _gValue,
      //                 onChanged: (value) => _onChanged(os.Android),
      //               ),
      //               Text('Android')
      //             ],
      //           ),
      //           Row(
      //             children: [
      //               Radio(
      //                 value: os.iOS,
      //                 groupValue: _gValue,
      //                 onChanged: (value) => _onChanged(os.iOS),
      //               ),
      //               Text('iOS')
      //             ],
      //           ),
      //         ],
      //       ),
      //       // CheckboxListTile(
      //       //   title: const Text('(☝ ՞ਊ ՞)☝ < カンリョー'),
      //       //   value: _check,
      //       //   onChanged: (bool? value) {
      //       //     setState(() {
      //       //       _check = value ?? false;
      //       //     });
      //       //   },
      //       // ),
      //       const SizedBox(height: 50),
      //       // タイトルのテキストフィールド
      //       TextField(
      //         autofocus: true,
      //         decoration: const InputDecoration(
      //           labelText: "タイトル",
      //           enabledBorder: OutlineInputBorder(
      //             borderSide: BorderSide(
      //               color: Colors.blue,
      //             ),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderSide: BorderSide(
      //               color: Colors.blue,
      //             ),
      //           ),
      //         ),
      //         // TextEditingControllerを使用することで、いちいちsetStateしなくても画面を更新してくれる
      //         controller: TextEditingController(text: _deviceTitle),
      //         onChanged: (String value) {
      //           _deviceTitle = value;
      //         },
      //       ),
      //       const SizedBox(height: 20),
      //       // 詳細のテキストフィールド
      //       TextField(
      //         keyboardType: TextInputType.multiline,
      //         maxLines: null,
      //         minLines: 3,
      //         decoration: const InputDecoration(
      //           labelText: "詳細",
      //           enabledBorder: OutlineInputBorder(
      //             borderSide: BorderSide(
      //               color: Colors.blue,
      //             ),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderSide: BorderSide(
      //               color: Colors.blue,
      //             ),
      //           ),
      //         ),
      //         // TextEditingControllerを使用することで、いちいちsetStateしなくても画面を更新してくれる
      //         controller: TextEditingController(text: _ver),
      //         onChanged: (String value) {
      //           _ver = value;
      //         },
      //       ),
      //       const SizedBox(height: 20),
      //       // 追加/更新ボタン
      //       SizedBox(
      //         width: double.infinity,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             if (_isCreateDevice) {
      //               // Todoを追加する
      //               _store.add(_check, _deviceTitle, _ver);
      //             }
      //             // Todoリスト画面に戻る
      //             Navigator.of(context).pop();
      //           },
      //           child: Text(
      //             _isCreateDevice ? '追加' : '更新',
      //             style: const TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       // キャンセルボタン
      //       SizedBox(
      //         width: double.infinity,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             // Todoリスト画面に戻る
      //             Navigator.of(context).pop();
      //           },
      //           style: ElevatedButton.styleFrom(
      //             primary: Colors.white,
      //             side: const BorderSide(
      //               color: Colors.blue,
      //             ),
      //           ),
      //           child: const Text(
      //             "キャンセル",
      //             style: TextStyle(color: Colors.blue),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 30),
      //     ],
      //   ),
      // ),
    );
  }
}
