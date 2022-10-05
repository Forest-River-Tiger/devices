import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'Taiga'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    return Scaffold(
        // AppBarはnavigationbar
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('リスト'),
        ),
        // Containerは箱(指定しなければ何もなし)
        // ListViewの場合、スクロールすることも可能
        // body: ListView(
        //   padding: const EdgeInsets.all(5),
        //   children: <Widget>[
        //     Container(
        //       height: 100,
        //       color: Colors.amber[600],
        //       child: const Center(child: Text('Entry A')),
        //     ),
        //     Container(
        //       height: 50,
        //       color: Colors.amber[500],
        //       child: const Center(child: Text('Entry B')),
        //     ),
        //     Container(
        //       height: 25,
        //       color: Colors.amber[100],
        //       child: const Center(child: Text('Entry C')),
        //     ),
        //   ],
        // ),

        // ListView.builder
        body: ListView.separated(
          // 変数entriesの数
          itemCount: entries.length,
          // entriesの数だけ周回
          itemBuilder: (BuildContext context, int index) {
            // Textの中に変数を入れる場合は「${}で囲む」
            return Center(child: Text('Entry ${entries[index]}'));
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.black,
          ),
        ));
  }
}
