import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_test/rabbit.dart';
import 'package:sample_test/stateful_sample_widget.dart';
import 'package:sample_test/stateless_sample_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value=0; 
  @override
  void initState() {
    value=0; 
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        value++;
      });
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: StatelessSampleWidget(
      //   title: "구멍이 없는 박스로 실험하는자",
      //   rabbit: Rabbit(name: "비둘기토끼1",state: RabbitState.SLEEP)
      // ),
      home: value> 10 
        ?Container()
        : StatefulSampleWidget(
          title: "구멍이 있는 박스로 실험하는 자",
          value: value,
          rabbit: Rabbit(name: "비둘기토끼2", state: RabbitState.SLEEP),
        ),
    );
  }
}
