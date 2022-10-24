import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:devices/src/screens/add_device.dart';
import 'all_device_store.dart';
import 'device.dart';

/// デバイス一覧画面のクラス

class AllDevicePage extends StatefulWidget {
  const AllDevicePage({Key? key}) : super(key: key);

  @override
  State<AllDevicePage> createState() => _AllDevicePageState();
}

// デバイス一覧画面の状態クラス

class _AllDevicePageState extends State<AllDevicePage> {

  // ストア
  final AllDeviceStore _store = AllDeviceStore();

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    final items = [
      {
        "no": "1",
        "rental": "",
        "deviceName":"iPhone12 mini",
        "ver":"15.4"
      },
      {
        "no": "2",
        "rental": "",
        "deviceName":"iPhoneX",
        "ver":"14.0"
      },
      {
        "no": "3",
        "rental": "",
        "deviceName":"iPhone14 Pro",
        "ver":"16.0"
      },
    ];
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
      body: new Column(children: <Widget> [
        _listHeader(),
        // ListView.builder(
          // itemCount: _store.count(),
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
            // itemCount: items == null ? 0 : items.length,
            // itemBuilder: (context, index) {
            //   return _listTile(items[index]);
            // },
        // ),
      ],),
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

Widget _listHeader() {
  return Container(
    decoration: new BoxDecoration(
      border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
    ),
    child: ListTile(
      title: new Row(
        children: <Widget> [
          new Expanded(child: new Text('No', style: new TextStyle(fontWeight: FontWeight.bold),)),
          new Expanded(child: new Text('貸出', style: new TextStyle(fontWeight: FontWeight.bold),)),
          new Expanded(child: new Text('端末名', style: new TextStyle(fontWeight: FontWeight.bold),)),
          new Expanded(child: new Text('Ver', style: new TextStyle(fontWeight: FontWeight.bold),))
        ],
      ),
    ),
  );
}

 Widget _listTile(items) {
    return Container(
        decoration: new BoxDecoration(
            border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child: ListTile(
            title: new Row(children: <Widget>[
              new Expanded(child: Text("${items["no"]}")),
              new Expanded(child: Text("${items["rental"]}")),
              new Expanded(child: Text("${items["deviceName"]}")),
              new Expanded(child: Text("${items["ver"]}")),
            ]
            )
        )
    );
  }