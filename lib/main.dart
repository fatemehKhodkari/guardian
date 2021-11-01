
import 'package:flutter/material.dart';
import 'package:guardian_management/pages/stagged_gridview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartApp(),
    );
  }
}


class StartApp extends StatelessWidget {
  const StartApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(child: StaggeredGridViewExample(),),
      ),
    );
  }
}
