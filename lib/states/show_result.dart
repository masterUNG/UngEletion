import 'dart:convert';

// import 'package:charts_flutter/flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungelection/model/election_model.dart';
import 'package:ungelection/model/otp_model.dart';
import 'package:ungelection/model/result_model.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_progress.dart';
import 'package:ungelection/widget/show_title.dart';

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
  Map<String, int> mapAmount = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllData();
  }

  Future<Null> readAllData() async {
    String apiReadData =
        'https://www.androidthai.in.th/election/getAllcity.php';
    await Dio().get(apiReadData).then((value) {
      for (var item in json.decode(value.data)) {
        ElectionModel model = ElectionModel.fromMap(item);
        electionModels.add(model);
      }
      readAllResult();
    });
  }

  Future<Null> readAllResult() async {
    String apiResult = '${MyConstant.domain}/election/getAllResult.php';
    // print('######### apiResult ===>> $apiResult');
    await Dio().get(apiResult).then((value) async {
      for (var item in json.decode(value.data)) {
        OtpModel otpModel = OtpModel.fromMap(item);
        String string = otpModel.choiceChooseIds;
        createArrayNameEletion(string);
      }

      print('##### mapAmount ==>> $mapAmount');
      print('##### mapAmount length ==>> ${mapAmount.length}');

      mapAmount.forEach((key, value) async {
        String nameElection = await findNameElection(key);
        print('NameEle ==>> $nameElection');
        setState(() {
          data.add(ResultModel(xValue: nameElection, yValue: value));
        });
      });

      setState(() {
        statusLoad = false;
      });
    });
  }

  Future<String> findNameElection(String id) async {
    String nameElection;
    String apiGetElectionWhereId =
        '${MyConstant.domain}/election/getElectionWhereId.php?isAdd=true&id=$id';
    print('##### url getElectionWhereID ==>>> $apiGetElectionWhereId');
    await Dio().get(apiGetElectionWhereId).then((value) {
      print('######### value ===>>>>>> $value');
      for (var item in json.decode(value.data)) {
        ElectionModel model = ElectionModel.fromMap(item);
        nameElection = model.name;
      }
    });
    return nameElection;
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

    for (var item in results) {
      mapAmount[item] = calculateAmount(item);
    }
  }

  int calculateAmount(String keyString) {
    print(
        '### keyString ==> $keyString, mapAmount[$keyString] ==> ${mapAmount[keyString]}');
    if (mapAmount[keyString] == null) {
      return 1;
    } else {
      int i = mapAmount[keyString];
      i++;
      return i;
    }
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
    ResultModel(xValue: '', yValue: 0),
  ];

  Widget buildChart() {
    // var seriesList = [
    //   Series(
    //     id: 'id',
    //     data: data,
    //     domainFn: (ResultModel model, index) => model.xValue,
    //     measureFn: (ResultModel model, index) => model.yValue,
    //   )
    // ];
    // return BarChart(
    //   seriesList,
    //   animate: true,
    // );
    ShowTitle(title: 'Cannot Use Chart', textStyle: MyConstant().h1Style());
  }
}
