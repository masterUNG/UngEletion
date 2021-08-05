import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungelection/states/show_score.dart';
import 'package:ungelection/utlity/my_constant.dart';

class ShowCheck extends StatefulWidget {
  const ShowCheck({Key key}) : super(key: key);

  @override
  _ShowCheckState createState() => _ShowCheckState();
}

class _ShowCheckState extends State<ShowCheck> {
  int amount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readPeople();
  }

  Future<Null> readPeople() async {
    await Dio().get(MyConstant.apiGetAllotp).then((value) {
      var result = json.decode(value.data);
      setState(() {
        amount = result.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.greenBody,
      appBar: AppBar(
        title: amount == null ? Text('จำนวนผู้มีสิทธ์ = x คน') : Text('จำนวนผู้มีสิทธ์ = $amount คน') ,
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
      ),
      body: ShowScore(),
    );
  }
}
