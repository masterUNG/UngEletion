import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungelection/model/election_model.dart';
import 'package:ungelection/model/otp_model.dart';
import 'package:ungelection/model/result_model.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_progress.dart';

class ShowReslut extends StatefulWidget {
  const ShowReslut({Key key}) : super(key: key);

  @override
  _ShowReslutState createState() => _ShowReslutState();
}

class _ShowReslutState extends State<ShowReslut> {
  bool statusLoad = true;
  List<ElectionModel> electionModels = [];
  List<String> nameElectionChooses = [];
  List<String> idElectinChooses = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllData();
  }

  Future<Null> readAllData() async {
    String apiReadData = '${MyConstant.domain}/fluttertraining/getAllFood.php';
    await Dio().get(apiReadData).then((value) {
      for (var item in json.decode(value.data)) {
        ElectionModel model = ElectionModel.fromMap(item);
        electionModels.add(model);
      }
      readAllResult();
    });
  }

  Future<Null> readAllResult() async {
    String apiResult = '${MyConstant.domain}/fluttertraining/getAllResult.php';
    print('#### apiResult ===>> $apiResult');
    await Dio().get(apiResult).then((value) {
      for (var item in json.decode(value.data)) {
        OtpModel otpModel = OtpModel.fromMap(item);
        String string = otpModel.choiceChooseIds;
        createArrayNameEletion(string);
      }

      setState(() {
        statusLoad = false;
      });
    });
  }

  void createArrayNameEletion(String string) {
    print('### string = $string');
    String result = string.substring(1, string.length - 1);

    List<String> results = result.split(',');
    int index = 0;
    for (var item in results) {
      results[index] = item.trim();
      index++;
    }
    print('### resuts = $results');
    // for (var item in results) {
    //   if (idElectinChooses.length != 0) {
    //     for (var item2 in idElectinChooses) {
    //       if (item != item2) {
    //         idElectinChooses.add(item);
    //       }
    //     }
    //   } else {
    //     idElectinChooses.add(item);
    //   }
    // }
    print('##### idElectinChooses = $idElectinChooses');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: statusLoad ? ShowProgress() : buildChart(),
      ),
    );
  }

  var data = [
    ResultModel(xValue: 'AAA', yValue: 10),
    ResultModel(xValue: 'BBB', yValue: 50),
    ResultModel(xValue: 'CCC', yValue: 120),
    ResultModel(xValue: 'DDD', yValue: 40),
  ];

  Widget buildChart() {
    var seriesList = [
      Series(
        id: 'id',
        data: data,
        domainFn: (ResultModel model, index) => model.xValue,
        measureFn: (ResultModel model, index) => model.yValue,
      )
    ];
    return BarChart(
      seriesList,
      animate: true,
    );
  }
}
