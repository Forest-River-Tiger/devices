import 'package:flutter/material.dart';

// 列挙型でボタンの値を作成
enum os { Android, iOS }

// class _State extends State<AddDevicePage> {
//   os _gValue = os.Android;

// }

class AddDevicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<AddDevicePage> {
  os _gValue = os.Android;

  void _onChanged(os value) {
    setState(() {
      _gValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
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
                        Text("Android")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: os.iOS,
                          groupValue: _gValue,
                          onChanged: (value) => _onChanged(os.iOS),
                        ),
                        Text("iOS")
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 50),
                TextFormField(
                  // テキストラベル
                  decoration: InputDecoration(labelText: '端末名'),
                  onChanged: (String value) {},
                ),
                const SizedBox(height: 50),
                TextFormField(
                  // テキストラベル
                  decoration: InputDecoration(labelText: "Ver"),
                  onChanged: (String value) {},
                ),
                const SizedBox(height: 50),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pop(context),
                      },
                      child: Text('キャンセル'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text('追加'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}