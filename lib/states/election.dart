import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ungelection/model/amount_model.dart';
import 'package:ungelection/model/election_model.dart';
import 'package:ungelection/model/eletiondate_model.dart';
import 'package:ungelection/model/otp_model.dart';
import 'package:ungelection/model/sqlite_model.dart';
import 'package:ungelection/provider/amount_provider.dart';
import 'package:ungelection/utlity/dialog.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/utlity/sqlite_helper.dart';
import 'package:ungelection/widget/show_logo.dart';
import 'package:ungelection/widget/show_progress.dart';
import 'package:ungelection/widget/show_title.dart';

class Election extends StatefulWidget {
  final OtpModel otpModel;
  Election({@required this.otpModel});
  @override
  _ElectionState createState() => _ElectionState();
}

class _ElectionState extends State<Election> {
  double size;
  bool nonChooseBool =
      true; // false => Yollow Light<ไม่ประสง์ออกคะแนน>, true => Yellow Dark
  bool cancelBool = false; // false => Red Light
  List<ElectionModel> electionModels = [];
  bool load = true;
  List<Widget> widgets = [];
  int choiceInt = 1;
  List<bool> chooses = [];
  bool click = true;

  OtpModel otpModel;
  AmountProvider amountProvider;
  int amountInt;

  List<String> choiceChoosesIds = [];

  List<SQLiteModel> sqliteModels = [];

  ElectionDateModel electionDateModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    otpModel = widget.otpModel;
    amountInt = int.parse(otpModel.amount);
    AmountModel amountModel = AmountModel(amount: amountInt);
    amountProvider = Provider.of<AmountProvider>(context, listen: false);
    amountProvider.addAmountProvider(amountModel);

    readData();
    readEletionDate();
  }

  Future<Null> readEletionDate() async {
    String path = '${MyConstant.domain}/fluttertraining/getAllEletionDate.php';
    await Dio().get(path).then((value) {
      for (var item in json.decode(value.data)) {
        electionDateModel = ElectionDateModel.fromMap(item);
      }
    });
  }

  Future<Null> deleteAllSQLite() async {
    await SQLiteHelper()
        .deleteAllData()
        .then((value) => print('### deleteAllSQLite Success'));
  }

  Future<Null> readData() async {
    if (widgets.length != 0) {
      widgets.clear();
    }

    String api = '${MyConstant.domain}/fluttertraining/getAllFood.php';

    await Dio().get(api).then(
      (value) {
        // print('### value = $value');
        if (value.toString() != 'null') {
          for (var item in json.decode(value.data)) {
            ElectionModel model = ElectionModel.fromMap(item);
            if (click) {
              chooses.add(false);
            }
            setState(() {
              load = false;
              electionModels.add(model);
              widgets.add(createWidget(model, choiceInt));
            });
            choiceInt++;
          }
        }
      },
    );
  }

  Widget createWidget(ElectionModel model, int choiceInt) => Row(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    width: 60,
                    height: 60,
                    child: Image.network(
                      '${MyConstant.domain}${model.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        child: ShowTitle(
                          title: model.nameFood,
                          textStyle: MyConstant().h1Style(),
                        ),
                      ),
                      Container(
                        width: 60,
                        child: ShowTitle(
                          title: cutWord(model.detail),
                          textStyle: MyConstant().h2Style(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              click = false;
              // print('#### you Click choiceInt ==>> $choiceInt');
              setState(() {
                chooses[choiceInt - 1] = !chooses[choiceInt - 1];
                readData();
              });
            },
            child: Card(
              color: chooses[choiceInt - 1]
                  ? MyConstant.redLight
                  : MyConstant.redDark,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ShowTitle(
                  title: '$choiceInt',
                  textStyle: MyConstant().h0Style(),
                ),
              ),
            ),
          ),
        ],
      );

  String cutWord(String string) {
    String result = string;
    if (result.length > 12) {
      result = result.substring(0, 12);
      result = '$result ...';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        title: Text(MyConstant.election),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyConstant().showTitle(
                otpModel.name,
                MyConstant().h1whiteStyle(),
              ),
              buildAmount(),
            ],
          ),
          SizedBox(
            width: 30,
          ),
        ],
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
                child: load
                    ? ShowProgress()
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250, childAspectRatio: 3),
                        itemCount: electionModels.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Card(
                              child: Container(
                                width: 150,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: Image.network(
                                        '${MyConstant.domain}${electionModels[index].image}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 60,
                                      child: ShowTitle(
                                          title: electionModels[index].nameFood,
                                          textStyle: MyConstant().h1Style()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              //ที่คลิกเลือกตั้ง choose=> true เลืิิอก, false ไม่เลือก
                              onTap: () {
                                if (amountInt != 0) {
                                  setState(() {
                                    chooses[index] = !chooses[index];
                                  });

                                  if (chooses[index]) {
                                    amountInt--;
                                    AmountModel model =
                                        AmountModel(amount: amountInt);
                                    amountProvider.addAmountProvider(model);

                                    choiceChoosesIds
                                        .add(electionModels[index].id);
                                    print(
                                        '## choiceChooseIds ==>> $choiceChoosesIds');
                                  } else {
                                    amountInt++;
                                    AmountModel model =
                                        AmountModel(amount: amountInt);
                                    amountProvider.addAmountProvider(model);

                                    print(
                                        '### index ที่ไม่เลือก ==>> ${electionModels[index].id}');
                                    choiceChoosesIds
                                        .remove(electionModels[index].id);
                                    print(
                                        '## choiceChooseIds ใหม่ ==>> $choiceChoosesIds');
                                  }
                                } else if (chooses[index]) {
                                  setState(() {
                                    chooses[index] = !chooses[index];
                                  });

                                  if (chooses[index]) {
                                    amountInt--;
                                    AmountModel model =
                                        AmountModel(amount: amountInt);
                                    amountProvider.addAmountProvider(model);
                                  } else {
                                    amountInt++;
                                    AmountModel model =
                                        AmountModel(amount: amountInt);
                                    amountProvider.addAmountProvider(model);
                                  }
                                } else {
                                  normalDialog(context, 'คุณเลือกครบแล้ว !!!',
                                      'ไม่สามารถเลือกได้คะ คุณเลือกครบแล้ว');
                                }
                              },
                              child: Card(
                                color: chooses[index]
                                    ? MyConstant.redLight
                                    : MyConstant.redDark,
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: ShowTitle(
                                      title: '${index + 1}',
                                      textStyle: MyConstant().h0Style()),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildLogo(),
                        buildMidButton(),
                        buildSave(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAmount() {
    return Consumer(
      builder: (context, AmountProvider amountProvider, child) =>
          MyConstant().showTitle(
        'จำนวนที่เลือกได้ ${amountProvider.getAmountProvider()[0].amount}',
        MyConstant().h2whiteStyle(),
      ),
    );
  }

  GridView buildGridViewCount() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2,
      children: widgets,
    );
  }

  Container buildSave() => Container(
        width: size * 0.25 * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 32),
        child: InkWell(
          child: Image.asset(MyConstant.cancelImage),
          onTap: () {
            // bool nonChooseBool = true; // false => Yollow Light<ไม่ประสง์ออกคะแนน>, true => Yellow Dark
            if ((choiceChoosesIds.length == 0) && nonChooseBool) {
              normalDialog(context, 'ยังไม่ได้เลือกใครเลย ?',
                  'โปรดเลือก หรือ ไม่ประสงค์ลงคะแนน');
            } else {
              print('###### คุณเลือก ==>> $choiceChoosesIds');
              editStatusAndSaveChoiceChoosId();
            }
          },
        ),
      );

  Future<Null> readSQLite() async {
    if (sqliteModels.length != 0) {
      sqliteModels.clear();
    }

    await SQLiteHelper().readAllData().then((value) async {
      sqliteModels = value;
      for (var item in sqliteModels) {
        print('### id = ${item.id} | ${item.idOtp} | ${item.choiceChooseId}');

        String path =
            '${MyConstant.domain}/fluttertraining/editChooseWhereId.php?isAdd=true&id=${item.idOtp}&choiceChooseIds=${item.choiceChooseId}';
        print('### path api of editChoise ==>> $path');
        await Dio().get(path).then((value) => print('##### Edit Finish #####'));
      }
    }).then((value) {
      deleteAllSQLite();
      Navigator.pushNamedAndRemoveUntil(
          context, '/showResult', (route) => false);
    });
  }

  Future<Null> editStatusAndSaveChoiceChoosId() async {
    // 1. Edit Status to false
    String path =
        '${MyConstant.domain}/fluttertraining/editStatusWhereId.php?isAdd=true&id=${otpModel.id}';
    print('### path = $path');
    await Dio().get(path).then((value) async {
      if (value.toString() == 'true') {
        // 2. Save choiceChoosesIds -> Sharepreferance
        print('######## Edit Status Success ##########');

        SQLiteModel model = SQLiteModel(
            idOtp: otpModel.id, choiceChooseId: choiceChoosesIds.toString());
        await SQLiteHelper().insertValueToSQLite(model).then((value) {
          int year = int.parse(electionDateModel.year);
          int month = int.parse(electionDateModel.month);
          int day = int.parse(electionDateModel.day);
          int hour = int.parse(electionDateModel.hour);
          int minus = int.parse(electionDateModel.minus);

          print(
              'year = $year, month = $month, day = $day, hour = $hour, minus = $minus');

          DateTime dateTime = DateTime(
            year,
            month,
            day,
            hour,
            minus,
          );

          Timer(dateTime.difference(DateTime.now()), () async {
            readSQLite();
          });

          Navigator.pushNamedAndRemoveUntil(
              context, '/authenLandscape', (route) => false);
        });
      } else {
        normalDialog(context, 'มีปํญหา', 'โปรดลองใหม่อีกครั้งครับ');
      }
    });
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
        style: ElevatedButton.styleFrom(
            primary:
                nonChooseBool ? MyConstant.yellowDark : MyConstant.yellowlight),
        onPressed: () {
          setState(() {
            nonChooseBool = !nonChooseBool;
          });
        },
        child: SizedBox(),
      ),
    );
  }

  bool statusCancel = false; // true => Cencel, false => Non Cancel

  Container buildCancel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      width: size * 0.25 - 150,
      height: size * 0.25 - 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: statusCancel ? MyConstant.redLight : MyConstant.redDark,
        ),
        onPressed: () {
          setState(() {
            statusCancel = !statusCancel;
          });
          delayTime();
        },
        child: SizedBox(),
      ),
    );
  }

  Future<Null> delayTime() async {
    Duration duration = Duration(seconds: 2);
    await Timer(duration, () {
      for (var item in choiceChoosesIds) {
        amountInt++;
        AmountModel model = AmountModel(amount: amountInt);
        amountProvider.addAmountProvider(model);
      }

      chooses.clear();
      for (var item in electionModels) {
        setState(() {
          chooses.add(false);
        });
      }

      choiceChoosesIds.clear();

      setState(() {
        statusCancel = !statusCancel;
      });
    });
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
