import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trip/navigator/tab_navigator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,        //状态栏背景颜色
      statusBarIconBrightness: Brightness.dark  // dark:一般显示黑色   light：一般显示白色
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabNavigator(),
    );
  }
}

// void main() {
//   // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//   //     statusBarColor: Colors.transparent, //状态栏背景颜色
//   //     statusBarIconBrightness: Brightness.dark // dark:一般显示黑色   light：一般显示白色
//   //     ));
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String showResult = '';
//
//   Future<CommonModel> fetchPost() async {
//     final response = await http.get(Uri.parse(
//         'http://www.devio.org/io/flutter_app/json/test_common_model.json'));
//     final result = json.decode(response.body);
//     return CommonModel.fromJson(result);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Http'),
//         ),
//         body: Column(
//           children: [
//             InkWell(
//               onTap: () {
//                 fetchPost().then((CommonModel value) {
//                   setState(() {
//                     showResult =
//                         '请求结果：\nhideAppBar:${value.hideAppBar} \nicon:${value.icon}';
//                   });
//                 });
//               },
//               child: const Text(
//                 '点我',
//                 style: TextStyle(fontSize: 26),
//               ),
//             ),
//             Text(showResult)
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CommonModel {
//   final String icon;
//   final String title;
//   final String url;
//   final String statusBarColor;
//   final bool hideAppBar;
//
//   CommonModel(
//       {required this.icon,
//       required this.title,
//       required this.url,
//       required this.statusBarColor,
//       required this.hideAppBar});
//
//   factory CommonModel.fromJson(Map<String, dynamic> json) {
//     return CommonModel(
//       icon: json['icon'],
//       title: json['title'],
//       url: json['url'],
//       statusBarColor: json['statusBarColor'],
//       hideAppBar: json['hideAppBar'],
//     );
//   }
// }
