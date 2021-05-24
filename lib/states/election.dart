import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungelection/model/election_model.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_logo.dart';
import 'package:ungelection/widget/show_progress.dart';

class Election extends StatefulWidget {
  @override
  _ElectionState createState() => _ElectionState();
}

class _ElectionState extends State<Election> {
  double size;
  bool nonChooseBool = false; // false => Yollow Light
  bool cancelBool = false; // false => Red Light
  List<ElectionModel> electionModels = [];
  bool load = true;
  List<Widget> widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    String api = '${MyConstant.domain}/fluttertraining/getAllFood.php';

    await Dio().get(api).then(
      (value) {
        print('### value = $value');
        if (value.toString() != 'null') {
          for (var item in json.decode(value.data)) {
            ElectionModel model = ElectionModel.fromMap(item);
            setState(() {
              load = false;
              electionModels.add(model);
              widgets.add(createWidget(model));
            });
          }
        }
      },
    );
  }

  Widget createWidget(ElectionModel model) => Row(
    children: [
      Container(
            width: 100,
            height: 100,
            child: Image.network('${MyConstant.domain}${model.image}'),
          ),Text(model.nameFood),
    ],
  );

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
                child: load
                    ? ShowProgress()
                    : GridView.extent(
                        maxCrossAxisExtent: 250,
                        children: widgets,
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

  Container buildSave() => Container(
      width: size * 0.25 * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 32),
      child: Image.asset(MyConstant.cancelImage));

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

  Container buildCancel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      width: size * 0.25 - 150,
      height: size * 0.25 - 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: MyConstant.redDark,
        ),
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
