import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungelection/model/election_model.dart';
import 'package:ungelection/model/otp_model.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_progress.dart';
import 'package:ungelection/widget/show_title.dart';

class ShowScore extends StatefulWidget {
  const ShowScore({Key key}) : super(key: key);

  @override
  _ShowScoreState createState() => _ShowScoreState();
}

class _ShowScoreState extends State<ShowScore> {
  List<ElectionModel> electionModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateScore();
    // readData();
  }

  Future<Null> calculateScore() async {
    await Dio().get(MyConstant.apiGetAllotp).then((value) async {
      for (var item in json.decode(value.data)) {
        OtpModel model = OtpModel.fromMap(item);
        if (model.status == 'false') {
          String scoreStr = model.choiceChooseIds;
          scoreStr = scoreStr.substring(1, scoreStr.length - 1);
          List<String> strings = scoreStr.split(',');

          for (var item in strings) {
            String id = item.trim();
            String apiGetScoreWhereId =
                'https://www.androidthai.in.th/election/getElectionWhereId.php?isAdd=true&id=$id';
            await Dio().get(apiGetScoreWhereId).then((value) async {
              for (var item in json.decode(value.data)) {
                ElectionModel electionModel = ElectionModel.fromMap(item);
                String scoreStr = electionModel.score;
                int score = int.parse(scoreStr) + 1;

                String apiEditScoreWhereId =
                    'https://www.androidthai.in.th/election/editScoreWhereId.php?isAdd=true&id=$id&score=$score';
                await Dio()
                    .get(apiEditScoreWhereId)
                    .then((value) => print('### Update at id = $id OK'));
              }
            });
          }
        }
      }
      readData();
    });
  }

  Future<Null> readData() async {
    await Dio().get(MyConstant.apiGetAllCity).then((value) {
      for (var item in json.decode(value.data)) {
        ElectionModel model = ElectionModel.fromMap(item);
        setState(() {
          electionModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.greenBody,
      body: electionModels.length == 0
          ? ShowProgress()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                // mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => Card(
                color: Colors.black12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 40,
                      height: 50,
                      child: Image.network(
                          '${MyConstant.domain}/election/${electionModels[index].image}'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 60,
                      child: Column(
                        children: [
                          ShowTitle(
                            title: electionModels[index].name,
                            textStyle: MyConstant().h2whiteStyle(),
                          ),
                          ShowTitle(
                              title:
                                  'คะแนนที่ได้ = ${electionModels[index].score}',
                              textStyle: MyConstant().h2YellowStyle())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: electionModels.length,
            ),
    );
  }
}
