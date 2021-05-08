import 'package:flutter/material.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_logo.dart';

class Election extends StatefulWidget {
  @override
  _ElectionState createState() => _ElectionState();
}

class _ElectionState extends State<Election> {
  double size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        title: Text(MyConstant.election),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyConstant.greenBody,
                ),
                child: Center(child: Text('Panel')),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyConstant.greenDark,
                ),
                child: Center(
                  child: Column(
                    children: [
                      buildLogo(),
                      buildMidButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildMidButton() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(MyConstant.nonChoose),
          buildNonChoose(),
          Text(MyConstant.cancel),
          buildCancel(),
        ],
      ),
    );
  }

  Container buildNonChoose() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      width: size * 0.25 - 150,
      height: size * 0.25 - 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: MyConstant.yellowDark),
        onPressed: () {},
        child: SizedBox(),
      ),
    );
  }

  Container buildCancel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      width: size * 0.25 - 150,
      height: size * 0.25 - 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: MyConstant.redDark),
        onPressed: () {},
        child: SizedBox(),
      ),
    );
  }

  Row buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.25 - 100,
          child: ShowLogo(),
        ),
      ],
    );
  }
}
