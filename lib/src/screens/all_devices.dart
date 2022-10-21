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
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red.withOpacity(0.5),
        title: const Text(
          'デバイス一覧',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          // 追加画面に遷移
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDevicePage(),
                fullscreenDialog: true,
              )),
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
