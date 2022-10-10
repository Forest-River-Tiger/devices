import 'package:devices/Second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // 「start」は上寄せ
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 150),
              child: const Text('device board',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 100),
              child: const Text('端末管理アプリ',
              style: TextStyle(
                fontSize: 15,
              ),),
            ),
            ElevatedButton(
              onPressed: () {
                // ボタンを押した時の処理
              },
              child: const Text('始める'),
              style: ButtonStyle(
                  // ボタンカラー変更(色:grey)
                  backgroundColor: MaterialStateProperty.all(Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
