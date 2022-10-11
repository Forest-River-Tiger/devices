import 'package:devices/Third_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    return Scaffold(
      // AppBarはnavigationbar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 167, 149),
        title: const Text('デバイス一覧'),
      ),
      // Containerは箱(指定しなければ何もなし)
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'name',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              //ボタン押した時のコード
              Navigator.pop(context);
            },
            child: const Text('前の画面に戻る'),
          ),
          ElevatedButton(
            onPressed: () {
              // ボタンを押した時のコード
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThirdPage(),
                ),
              );
            },
            child: const Text("サードへ"),
          ),
        ],
      )),
    );
  }
}
