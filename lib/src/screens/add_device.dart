import 'package:flutter/material.dart';

class AddDevicePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ボタン押下時の処理
          },
          child: const Text('デバイス追加'),
        ),
      ),
    );
  }
}