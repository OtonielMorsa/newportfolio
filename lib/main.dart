import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_portfolio/modules/background.dart';
import 'package:flutter_portfolio/modules/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    double height = 0;
    double width = 0;
    if (mq.width > mq.height) {
      height = mq.height;
      width = (mq.height / 3) * 4;
    } else {
      height = (mq.width / 4) * 3;
      width = mq.width;
    }

    return Scaffold(
        body: FadeIn(
      duration: Duration(seconds: 2),
      child: Stack(
        children: [
          const Background(),
          Positioned(
            top: height * 0.05,
            left: width * .32,
            child: const Menu(),
          ),
        ],
      ),
    ));
  }
}
