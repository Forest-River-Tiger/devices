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
          return InputPage(
            device: device,
          );
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('デバイス一覧'),
      ),
      body: ListView.builder(
        prototypeItem: _listHeader(),
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
            // 右方向にリストアイテムをスライドした場合のアクション
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.2,
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: Colors.orangeAccent,
                  label: '追加',
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
                      child: new Expanded(
                          child: new Text(item.id.toString(),
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    Container(
                      child: new Expanded(
                          child: new Text(item.os,
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    Container(
                      child: new Expanded(
                          child: new Text(item.deviceTitle,
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    Container(
                      child: new Expanded(
                          child: new Text(item.ver,
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    Container(
                        child: new Expanded(
                            child: new Text(item.name,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold)))),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // Todo追加画面に遷移するボタン
      floatingActionButton: FloatingActionButton(
        // Todo追加画面に遷移する
        onPressed: _InputPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _listHeader() {
  return Container(
    decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
    child: ListTile(
      title: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('id',
                  style: new TextStyle(fontWeight: FontWeight.bold))),
          new Expanded(
              child: new Text('デバイス名',
                  style: new TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    ),
  );
}
