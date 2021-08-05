import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungelection/model/otp_model.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_progress.dart';
import 'package:ungelection/widget/show_title.dart';

class ShowPeople extends StatefulWidget {
  const ShowPeople({Key key}) : super(key: key);

  @override
  _ShowPeopleState createState() => _ShowPeopleState();
}

class _ShowPeopleState extends State<ShowPeople> {
  int amountAll;
  int amountPeople = 0;

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
        amountAll = result.length;
      });

      for (var item in result) {
        OtpModel model = OtpModel.fromMap(item);
        if (model.status == 'false') {
          setState(() {
            amountPeople++;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.greenBody,
      body: amountAll == null ? ShowProgress() :  buildContent(),
    );
  }

  Center buildContent() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ShowTitle(
              title: 'ผู้มีสิทธิ = $amountAll คน', textStyle: MyConstant().h0Style()),
          ShowTitle(
              title: 'ใช้สิทธิ = $amountPeople คน', textStyle: MyConstant().h0Style()),
        ],
      ),
    );
  }
}
