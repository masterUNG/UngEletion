import 'package:flutter/material.dart';
import 'package:ungelection/states/show_score.dart';
import 'package:ungelection/utlity/my_constant.dart';

class ShowCheck extends StatefulWidget {
  const ShowCheck({Key key}) : super(key: key);

  @override
  _ShowCheckState createState() => _ShowCheckState();
}

class _ShowCheckState extends State<ShowCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: MyConstant.greenBody,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios,
          size: 36,
          color: MyConstant.yellowlight,
        ),
      ),
      ),body: ShowScore(),
    );
  }
}
