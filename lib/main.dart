import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app_exam/presintation/screens/shopping_main/main_box/main_box_screen.dart';
import 'package:shopping_app_exam/presintation/screens/shopping_main/router.dart';
import 'package:shopping_app_exam/utils/constants.dart';
void main() {
  runApp(const MyApp());
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // status bar color
  // ));
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainBox(),
      initialRoute: tabsRoute,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}

//flutter packages pub run build_runner build --delete-conflicting-outputs
