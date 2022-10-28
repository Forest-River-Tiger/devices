import 'package:devices/src/screens/all_devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'input_page.dart';
import 'device_list_store.dart';
import 'device.dart';
import 'package:devices/src/app.dart';

class MyDeviceListPage extends StatelessWidget {
  const MyDeviceListPage({Key? key}) : super(key: key);

//   @override
//   State<MyDeviceListPage> createState() => _MyDeviceListPageState();
// }

// class _MyDeviceListPageState extends State<MyDeviceListPage> {
//   final DeviceListStore _store = DeviceListStore();
//   static const _screens = [
//     MyDeviceListPage(),
//     AllDeviceListPage(),
//   ];

  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // void _InputPage([Device? device]) async {
  //   await Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return InputPage(device: device,);
  //       },
  //     ),
  //   );
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   Future(
  //     () async {
  //       setState(() => _store.load());
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('デバイス一覧'),
      ),
    );
  }
}
      // body: ListView.builder(
      //   itemCount: _store.count(),
      //   itemBuilder: (context, index) {
      //     var item = _store.findByIndex(index);
      //     return Slidable(
      //       // 左方向にリストアイテムをスライドした場合のアクション
      //       endActionPane: ActionPane(
      //         motion: const ScrollMotion(),
      //         extentRatio: 0.25,
      //         children: [
      //           SlidableAction(
      //             onPressed: (context) {
      //               // Todoを削除し、画面を更新する
      //               setState(() => {_store.delete(item)});
      //             },
      //             backgroundColor: Colors.red,
      //             icon: Icons.edit,
      //             label: '削除',
      //           ),
      //         ],
      //       ),
      //       child: Container(
      //         decoration: const BoxDecoration(
      //           border: Border(
      //             bottom: BorderSide(color: Colors.grey),
      //           ),
      //         ),
      //         child: ListTile(
      //           // ID
      //           leading: Text(item.id.toString()),
      //           // タイトル
      //           title: Text(item.deviceTitle),
      //           // 完了か
      //           trailing: Checkbox(
      //             // チェックボックスの状態
      //             value: item.check,
      //             onChanged: (bool? value) {
      //               // Todo(完了か)を更新し、画面を更新する
      //               // setState(() => _store.update(item, value!));
      //             },
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   items: const <BottomNavigationBarItem> [
      //     BottomNavigationBarItem(icon: Icon(Icons.phone_iphone), label: 'my device'),
      //     BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'all device'),
      //   ]
      // ),
      // Todo追加画面に遷移するボタン
      // floatingActionButton: FloatingActionButton(
      //   // Todo追加画面に遷移する
      //   onPressed: _InputPage,
      //   child: const Icon(Icons.add),
      // ),
  //   );
  // }
// }