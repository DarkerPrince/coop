import 'package:coop/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/Starting Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: coopMaterialColor),
        ),
        home: startPage());
  }
}
