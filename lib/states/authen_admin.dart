import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:ungelection/model/otp_admin_model.dart';
import 'package:ungelection/utlity/dialog.dart';
import 'package:ungelection/utlity/my_constant.dart';
import 'package:ungelection/widget/show_logo.dart';

class AuthenAdmin extends StatefulWidget {
  const AuthenAdmin({Key key}) : super(key: key);

  @override
  _AuthenAdminState createState() => _AuthenAdminState();
}

class _AuthenAdminState extends State<AuthenAdmin> {
  List<OtpAdminModel> otpAdminModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    String urlAPI = 'https://www.androidthai.in.th/election/getOtpAdmin.php';
    await Dio().get(urlAPI).then((value) {
      for (var item in json.decode(value.data)) {
        OtpAdminModel model = OtpAdminModel.fromMap(item);
        otpAdminModels.add(model);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.greenBody,
      appBar: AppBar(
        title: Text('สำหรับ เจ้าหน้าที่ Admin'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 150,
                child: ShowLogo(),
              ),
              OTPTextField(
                width: 250,
                length: 6,
                fieldWidth: 30,
                style: MyConstant().h1whiteStyle(),
                // otpFieldStyle: OtpFieldStyle(backgroundColor: MyConstant.greenDark),
                onCompleted: (value) {
                  print('### value = $value');
                  bool adminBool = false;
                  for (var item in otpAdminModels) {
                    if (value == item.otp) {
                      adminBool = true;
                    }
                  }
                  if (adminBool) {
                    Navigator.pushNamedAndRemoveUntil(context,
                        MyConstant.routeAdmonController, (route) => false);
                  } else {
                    normalDialog(context, 'OTP Admin False',
                        'Please Try Again OTP False');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
