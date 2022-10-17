import 'package:devices/src/screens/add_device.dart';
import 'package:flutter/material.dart';

class AllDevicePage extends StatelessWidget {
  const AllDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    return Scaffold(
        // AppBarはnavigationbar
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed:() => {
              // ボタン押下時の処理
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDevicePage(),
                fullscreenDialog: true,
                )
              ),
            },
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red.withOpacity(0.5),
        title: const Text('デバイス一覧', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
        // Containerは箱(指定しなければ何もなし)
        // ListViewの場合、スクロールすることも可能
        body: ListView(
          padding: const EdgeInsets.all(5),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.grey[500],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.grey[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.grey[500],
              child: const Center(child: Text('Entry C')),
            ),
            Divider(
              height: 2,
              thickness: 3,
              color: Colors.black,
            ),
          ],
        ),

        // ListView.builder
        // body: ListView.separated(
        //   // 変数entriesの数
        //   itemCount: entries.length,
        //   // entriesの数だけ周回
        //   itemBuilder: (BuildContext context, int index) {
        //     // Textの中に変数を入れる場合は「${}で囲む」
        //     return Center(child: Text('Entry ${entries[index]}'));
        //   },
        //   separatorBuilder: (BuildContext context, int index) => const Divider(
        //     color: Colors.black,
        //   ),
        // )
        );
  }
}
