import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ungelection/states/election.dart';

final Map<String, WidgetBuilder> map = {
  '/election': (BuildContext context) => Election(),
};

String initialRoute;

void main() {
  initialRoute = '/election';
  runApp(MyApp());
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
    return MaterialApp(
      routes: map,
      initialRoute: initialRoute,
      theme: ThemeData(primaryColor: Colors.green.shade900),
    );
  }
}
