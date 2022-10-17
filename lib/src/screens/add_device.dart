import 'package:flutter/material.dart';

class AddDevicePage extends StatelessWidget {

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
                      onPressed: () => {},
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
                )
                // Row(
                //   children: [
                //     ElevatedButton(
                //       onPressed: () => {

                //       },
                //       child: Text('ボタン1'),
                //     ),
                //     ElevatedButton(
                //       onPressed: () => {

                //       },
                //       child: Text('ボタン2'),
                //     ),
                //   ],
                // )
                // ElevatedButton(
                //   onPressed: () => {
                //     // ボタン押下後の処理
                //   },
                //   child: Text('デバイス追加'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}