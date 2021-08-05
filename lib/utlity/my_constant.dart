import 'package:flutter/material.dart';

class MyConstant {
  
  static final String apiGetAllElectionDate =
      'https://www.androidthai.in.th/election/getAllEletionDate.php';
  static final String apiGetShowElection =
      'https://www.androidthai.in.th/election/getAllShowElection.php';
  static final String apiGetAllCity =
      'https://www.androidthai.in.th/election/getAllcity.php';
  static final String apiGetAllotp =
      'https://www.androidthai.in.th/election/getAllotp.php';

  static final String routeAuthenLandScape = '/authenLandscape';
  static final String routeShowElectionResult = '/showElectionResult';
  static final String routeBeforeElelction = '/beforeElection';
  static final String routeAferElection = '/afterElection';
  static final String routeShowCheck = '/showCheck';

  static final String election = 'ตู้เลือกตั้ง';
  static final String nonChoose = 'ไม่ประสงค์ลงคะแนน';
  static final String cancel = 'ยกเลิก';

  static final Color greenBody = Colors.green.shade800;
  static final Color greenDark = Colors.green.shade900;
  static final Color yellowlight = Color(0xffffff72);
  static final Color yellowDark = Color(0xffc8b900);
  static final Color redLight = Color(0xfffd6063);
  static final Color redDark = Color(0xff8c0013);

  static final String logo = 'images/logo.png';
  static final String cancelImage = 'images/cancel.png';

  static final String domain = 'https://www.androidthai.in.th';

  Widget showTitle(String title, TextStyle textStyle) => Text(
        title,
        style: textStyle,
      );

  TextStyle h0Style() => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  TextStyle h1Style() => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: greenDark,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      );

  TextStyle h1whiteStyle() => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  TextStyle h2whiteStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      );

  TextStyle h2YellowStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: yellowlight,
      );
}
