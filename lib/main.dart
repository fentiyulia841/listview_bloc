import 'package:area_api/pages/area_page.dart';
import 'package:flutter/material.dart';
import 'package:area_api/pages/wilayah_page.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Area List",
      debugShowCheckedModeBanner: false,
      home: WilayahPage(),
    );
  }
}
