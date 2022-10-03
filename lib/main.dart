import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffoldは大元の画面
    return Scaffold(
      // AppBarはnavigationbar
      appBar: AppBar(
        title: Text('appBarのテキスト'),
      ),
      // Containerは箱(指定しなければ何もなし)
      body: Container(
        color: Colors.lightGreenAccent,
        // 全体に広がる
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text('26歳'),
            Text('神奈川在住'),
            Text('男'),
            Text('趣味は登山'),
            Text('あとは珈琲'),
          ],
        ),
      ),
    );
  }
}
