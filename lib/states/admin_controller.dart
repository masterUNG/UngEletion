import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungelection/model/otp_model.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_progress.dart';
import 'package:ungelection/widget/show_title.dart';

class AdminController extends StatefulWidget {
  const AdminController({Key key}) : super(key: key);

  @override
  _AdminControllerState createState() => _AdminControllerState();
}

class _AdminControllerState extends State<AdminController> {
  List<OtpModel> otpModels = [];
  bool load = true;
  bool haveData; // true ==> Have Data

  @override
  void initState() {
    super.initState();
    readDataOtp();
  }

  Future<Null> readDataOtp() async {
    if (otpModels.length != 0) {
      otpModels.clear();
    }

    String urlAPI = MyConstant.apiGetAllotp;
    await Dio().get(urlAPI).then((value) {
      print('### value ==>> $value');

      if (value.toString() == 'null') {
        setState(() {
          load = false;
          haveData = false;
        });
      } else {
        for (var item in json.decode(value.data)) {
          OtpModel model = OtpModel.fromMap(item);
          setState(() {
            load = false;
            haveData = true;
            otpModels.add(model);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.greenBody,
      appBar: AppBar(
        title: Text('Admin Controller'),
        leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, MyConstant.routeBeforeElelction, (route) => false),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Insert'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
                  onPressed: () {},
                  child: Text('Clear'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: load
          ? ShowProgress()
          : haveData
              ? ListView.builder(
                  itemCount: otpModels.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ShowTitle(
                          title: otpModels[index].name,
                          textStyle: MyConstant().h2whiteStyle(),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ShowTitle(
                          title: otpModels[index].otp,
                          textStyle: MyConstant().h2whiteStyle(),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: ShowTitle(
                    title: 'ยังไม่มี ข้อมูล',
                    textStyle: MyConstant().h1whiteStyle(),
                  ),
                ),
    );
  }
}
