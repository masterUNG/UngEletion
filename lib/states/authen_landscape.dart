import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:ungelection/model/otp_model.dart';
import 'package:ungelection/states/election.dart';
import 'package:ungelection/utlity/dialog.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_logo.dart';

class AuthenLandScape extends StatefulWidget {
  @override
  _AuthenLandScapeState createState() => _AuthenLandScapeState();
}

class _AuthenLandScapeState extends State<AuthenLandScape> {
  Future<Null> checkOTP(String otp) async {
    String api =
        '${MyConstant.domain}/fluttertraining/getOtpWherePin.php?isAdd=true&otp=$otp';
    await Dio().get(api).then((value) {
      print('##### value = $value ###');
      if (value.toString() == 'null') {
        normalDialog(context, 'OTP false !!!', 'Please Try Again ?');
      } else {
        for (var item in json.decode(value.data)) {
          OtpModel model = OtpModel.fromMap(item);
          if (model.status == 'true') {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Election(otpModel: model),
                ),
                (route) => false);
          } else {
            normalDialog(
                context, 'OTP ถูกใช้ไปแล้ว ?', 'OTP นี่ได้ถูก ใช้งานไปแล้ว คะ');
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: MyConstant.greenBody),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildLogo(size),
                buildOtpTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OTPTextField buildOtpTextField() {
    return OTPTextField(
      length: 6,
      width: 250,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      onCompleted: (value) {
        checkOTP(value);
      },
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.black12,
        borderColor: MyConstant.greenBody,
      ),
    );
  }

  Container buildLogo(double size) {
    return Container(
      width: size * 0.2,
      child: ShowLogo(),
    );
  }
}
