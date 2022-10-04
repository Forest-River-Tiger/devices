import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage(this.name);
  // 変数
  final String name;

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    return Scaffold(
      // AppBarはnavigationbar
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('セカンド'),
      ),
      // Containerは箱(指定しなければ何もなし)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: TextStyle(fontSize: 30),),
            ElevatedButton(
              onPressed: (){
                //ボタン押した時のコード
                Navigator.pop(context);
              },
              child: const Text('前の画面に戻る'),
              ),
          ],
        )
      ),
    );
  }
}