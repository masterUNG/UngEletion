import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ungelection/model/eletiondate_model.dart';
import 'package:ungelection/model/show_result_model.dart';
import 'package:ungelection/provider/amount2_provider.dart';
import 'package:ungelection/provider/amount_provider.dart';
import 'package:ungelection/states/admin_controller.dart';
import 'package:ungelection/states/after_election.dart';
import 'package:ungelection/states/authen_admin.dart';
import 'package:ungelection/states/authen_landscape.dart';
import 'package:ungelection/states/before_election.dart';
import 'package:ungelection/states/show_check.dart';
import 'package:ungelection/states/show_election_result.dart';
import 'package:ungelection/utlity/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authenLandscape': (BuildContext context) => AuthenLandScape(),
  '/showElectionResult': (BuildContext context) => ShowElectionResult(),
  '/beforeElection': (BuildContext context) => BeforeElection(),
  '/afterElection': (BuildContext context) => AfterElection(),
  '/showCheck': (BuildContext context) => ShowCheck(),
  '/authenAdmin': (BuildContext context) => AuthenAdmin(),
  '/adminController': (BuildContext context) => AdminController(),
};

String initialRoute;
// ทดสอบ นะจ้ะ

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dio().get(MyConstant.apiGetAllElectionDate).then((value) async {
    for (var item in json.decode(value.data)) {
      ElectionDateModel model = ElectionDateModel.fromMap(item);
      DateTime nowDateTime = DateTime.now();
      DateTime electionStartDataTime = DateTime(
        int.parse(model.year),
        int.parse(model.month),
        int.parse(model.day),
        8,
        0,
      );
      DateTime electionEndDataTime = DateTime(
        int.parse(model.year),
        int.parse(model.month),
        int.parse(model.day),
        int.parse(model.hour),
        int.parse(model.minus),
      );

      if (nowDateTime.isAfter(electionStartDataTime)) {
        if (nowDateTime.isBefore(electionEndDataTime)) {
          //เวลาเลือกตั้ง
          initialRoute = MyConstant.routeAuthenLandScape;
          runApp(MyApp());
        } else {
          // ปิดหีบแล้ว หรือ หล้งเวลาเลือกตั้ง

          await Dio().get(MyConstant.apiGetShowElection).then((value) {
            print('##### value ==>> $value');
            for (var item in json.decode(value.data)) {
              ShowResultModel model = ShowResultModel.fromMap(item);
              if (model.showElection == 'true') {
                initialRoute = MyConstant.routeShowElectionResult;
                runApp(MyApp());
              } else {
                initialRoute = MyConstant.routeAferElection;
                runApp(MyApp());
              }
            }
          });
        }
      } else {
        // มาก่อนวันเลือกตั้ง
        initialRoute = MyConstant.routeBeforeElelction;
        runApp(MyApp());
      }
    }
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AmountProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Amount2Provider();
          },
        ),
      ],
      child: MaterialApp(
        routes: map,
        initialRoute: initialRoute,
        theme: ThemeData(primaryColor: Colors.green.shade900),
      ),
    );
  }
}
