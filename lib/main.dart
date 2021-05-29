import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ungelection/provider/amount_provider.dart';
import 'package:ungelection/states/authen_landscape.dart';

final Map<String, WidgetBuilder> map = {
  '/authenLandscape': (BuildContext context) => AuthenLandScape(),
};

String initialRoute;

void main() {
  initialRoute = '/authenLandscape';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AmountProvider();
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
