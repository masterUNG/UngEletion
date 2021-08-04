import 'package:flutter/material.dart';
import 'package:ungelection/states/show_result.dart';
import 'package:ungelection/states/show_score.dart';

class ShowElectionResult extends StatefulWidget {
  const ShowElectionResult({Key key}) : super(key: key);

  @override
  _ShowElectionResultState createState() => _ShowElectionResultState();
}

class _ShowElectionResultState extends State<ShowElectionResult> {
  List<String> titles = ['แสดงคะแนน', 'แสดงกราฟ'];
  List<Widget> widgets = [
    ShowScore(),
    ShowReslut(),
  ];
  int indexBody = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItems() =>
      <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_1),
          label: titles[0],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_2),
          label: titles[1],
        ),
      ].toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[indexBody],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems(),
        currentIndex: indexBody,
        onTap: (value) {
          setState(() {
            indexBody = value;
          });
        },
      ),
    );
  }
}
