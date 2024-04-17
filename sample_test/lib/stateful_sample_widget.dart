import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample_test/rabbit.dart';

class StatefulSampleWidget extends StatefulWidget {
  String? title;
  Rabbit? rabbit;
  int? value; 
  StatefulSampleWidget({this.title, this.rabbit,this.value});

  @override
  State<StatefulSampleWidget> createState() =>
      _StatefulSampleWidgetState(); //가장 최초 실행
}

class _StatefulSampleWidgetState extends State<StatefulSampleWidget> {
  bool stateBool=false; 
  @override
  void initState() {
    print("initState!!"); 
    stateBool=false; 
    super.initState(); //그 다음 실행
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   int index = timer.tick % 4;
    //   setState(() {
    //     switch (index) {
    //       case 0:
    //         widget.rabbit!.updateState(RabbitState.SLEEP);
    //         break;
    //       case 1:
    //         widget.rabbit!.updateState(RabbitState.WALK);
    //         break;
    //       case 2:
    //         widget.rabbit!.updateState(RabbitState.RUN);
    //         break;
    //       case 3:
    //         widget.rabbit!.updateState(RabbitState.EAT);
    //         break;
    //     }
    //     print(widget.rabbit!.state);
    //   });
    // });
  }
  @override
  void didChangeDependencies() {
    print("didChangeDependencies!!"); 
    super.didChangeDependencies();
  }

  @override
  void setState(VoidCallback fn) { 
    if (mounted) super.setState(fn);
    print("setState!!");
  }
  @override
  void didUpdateWidget(covariant StatefulSampleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("oldWidget: ${oldWidget.value} <> this widget ${widget.value}"); 
    if(oldWidget.value != widget.value){
      print("didUpdateWidget!!"); 
    }
  }

  @override
  void dispose() {
    print("dispose!!"); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build!!");
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!)),
      body: Container(
        child: Center(
            child: Text(
          widget.rabbit!.state.toString(),
          style: TextStyle(fontSize: 20),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //if(mounted) -> mount되었는지 매번 체크하는게 번거로울 경우 setState에 재정의하자 
            setState(() {
              stateBool=!stateBool; 
            });
        },
        child: Text("Button"),
      ),
    );
  }
}
