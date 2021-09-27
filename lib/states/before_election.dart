import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungelection/model/eletiondate_model.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_logo.dart';
import 'package:ungelection/widget/show_progress.dart';
import 'package:ungelection/widget/show_title.dart';

class BeforeElection extends StatefulWidget {
  const BeforeElection({Key key}) : super(key: key);

  @override
  _BeforeElectionState createState() => _BeforeElectionState();
}

class _BeforeElectionState extends State<BeforeElection> {
  ElectionDateModel electionDataModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readElectionData();
  }

  Future<Null> readElectionData() async {
    await Dio().get(MyConstant.apiGetAllElectionDate).then((value) {
      print('value = $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          electionDataModel = ElectionDateModel.fromMap(item);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkButton(context),
          adminButton(),
        ],
      ),
      backgroundColor: MyConstant.greenBody,
      body: Center(
        child: electionDataModel == null ? ShowProgress() : buildContent(),
      ),
    );
  }

  TextButton adminButton() {
    return TextButton(
      onPressed: () =>
          Navigator.pushNamed(context, '/authenAdmin'),
      child: ShowTitle(
        title: 'สำหรับ Admin',
        textStyle: MyConstant().h2YellowStyle(),
      ),
    );
  }

  TextButton checkButton(BuildContext context) {
    return TextButton(
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.routeShowCheck),
        child: ShowTitle(
            title: 'รายชื่อผู้สมัคร', textStyle: MyConstant().h2YellowStyle()));
  }

  Column buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          child: ShowLogo(),
        ),
        ShowTitle(
          title: electionDataModel.name,
          textStyle: MyConstant().h0Style(),
        ),
        SizedBox(
          height: 16,
        ),
        ShowTitle(
          title:
              '8:00 - ${electionDataModel.hour}: ${electionDataModel.minus}      ${electionDataModel.day} / ${electionDataModel.month} / ${electionDataModel.year}',
          textStyle: MyConstant().h1whiteStyle(),
        ),
      ],
    );
  }
}
