

import 'package:devices/Second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  String nameText = '';

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    return Scaffold(
      // AppBarはnavigationbar
      appBar: AppBar(
        title: const Text('ファースト'),
      ),
      // Containerは箱(指定しなければ何もなし)
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
                ),
              TextField(
                onChanged: (text) {
                  nameText = text;
                },
              ),
              ElevatedButton(
                onPressed: (){
                  //ボタン押した時のコード
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(nameText),
                      // 下から上に画面が出てくる
                      fullscreenDialog: true,
                      ),
                  );
                },
                child: const Text('セカンドへ'),
                ),
            ],
          ),
        )
      ),
    );
  }
}