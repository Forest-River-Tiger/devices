import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'input_page.dart';
import 'device_list_store.dart';
import 'device.dart';

class AllDeviceListPage extends StatefulWidget {
  const AllDeviceListPage({Key? key}) : super(key: key);

  @override
  State<AllDeviceListPage> createState() => _AllDeviceListPageState();
}

class _AllDeviceListPageState extends State<AllDeviceListPage> {
  final DeviceListStore _store = DeviceListStore();

  void _InputPage([Device? device]) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return InputPage(device: device,);
        },
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    Future(
      () async {
        setState(() => _store.load());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('デバイス一覧'),
        ),
        body: new Column(children: <Widget>[
          _listHeader(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _store.count(),
            itemBuilder: (context, index) {
              var item = _store.findByIndex(index);
              return Slidable(
            // 左方向にリストアイテムをスライドした場合のアクション
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.2,
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Todoを削除し、画面を更新する
                    setState(() => {_store.delete(item)});
                  },
                  backgroundColor: Colors.redAccent,
                  label: '削除',
                ),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: ListTile(
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: new Expanded(child: new Text(item.id.toString(), style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 12))),
                    ),
                    Container(
                      child: new Expanded(child: new Text(item.os, style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 12))),
                    ),
                    Container(
                      child: new Expanded(child: new Text(item.deviceTitle, style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 12))),
                    ),
                    Container(
                      child: new Expanded(child: new Text(item.ver, style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 12))),
                    ),
                    Container(
                      child: new Expanded(child: new Text(item.name, style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 12)))
                    ),
                  ],
                ),
              ),
            ),
          );
            },
          ),
        ]),
        floatingActionButton: FloatingActionButton(
        onPressed: _InputPage,
        child: const Icon(Icons.add),
      ),
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
        children: <Widget>[
          new Expanded(child: new Text('No', style: new TextStyle(fontWeight: FontWeight.bold))),
          new Expanded(child: new Text('OS', style: new TextStyle(fontWeight: FontWeight.bold))),
          new Expanded(child: new Text('Device', style: new TextStyle(fontWeight: FontWeight.bold))),
          new Expanded(child: new Text('Ver', style: new TextStyle(fontWeight: FontWeight.bold))),
          new Expanded(child: new Text('Name', style: new TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    ),
  );
}