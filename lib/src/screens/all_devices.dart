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
    return Scaffold(
      appBar: AppBar(
        title: const Text('デバイス一覧'),
      ),
      body: ListView.builder(
        itemCount: _store.count(),
        itemBuilder: (context, index) {
          var item = _store.findByIndex(index);
          return Slidable(
            // 左方向にリストアイテムをスライドした場合のアクション
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Todoを削除し、画面を更新する
                    setState(() => {_store.delete(item)});
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.edit,
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
                  children: <Widget>[
                    new Expanded(child: new Text(item.id.toString(), style: new TextStyle(fontWeight: FontWeight.bold))),
                    new Expanded(child: new Text(item.deviceTitle, style: new TextStyle(fontWeight: FontWeight.bold))),
                    new Expanded(child: new Text(item.ver, style: new TextStyle(fontWeight: FontWeight.bold))),
                    new Expanded(child: new Text('□', style: new TextStyle(fontWeight: FontWeight.bold),))
                  ],
                ),
                // ID
                // leading: Text(item.id.toString()),
                // タイトル
                // title: Text(item.deviceTitle),

                // ver
                // trailing: Text('□'),
                // 完了か
                // trailing: Checkbox(
                  // チェックボックスの状態
                  // value: item.check,
                  // onChanged: (bool? value) {
                    // Todo(完了か)を更新し、画面を更新する
                    // setState(() => _store.update(item, value!));
                  // },
                // ),
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
  // Widget _listHeader() {
  //   return Container(
  //     decoration: new BoxDecoration(
  //       border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
  //     ),
  //     child: ListTile(
  //       title: new Row(
  //         children: <Widget>[
  //           new Expanded(child: new Text("名称", style: new TextStyle(fontWeight:FontWeight.bold))),
  //           new Expanded(child: new Text("URL", style: new TextStyle(fontWeight:FontWeight.bold))),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

Widget _listHeader() {
  return Container(
    decoration: new BoxDecoration(
      border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
    ),
    child: ListTile(
      title: new Row(
        children: <Widget>[
          new Expanded(child: new Text('id', style: new TextStyle(fontWeight: FontWeight.bold))),
          new Expanded(child: new Text('デバイス名', style: new TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    ),
  );
}