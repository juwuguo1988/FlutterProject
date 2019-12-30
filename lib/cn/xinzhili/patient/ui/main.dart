import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xinzhili/patient/ui/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /**
     * 进入程序后显示的第一个页面,传入的是一个Widget，
     * 但实际上这个Widget需要包裹一个Scaffold以显示该程序使用Material Design风格
     */
    return MaterialApp(
      home: HomeViewUI(),
    );
  }
}

