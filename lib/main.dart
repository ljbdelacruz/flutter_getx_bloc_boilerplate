



import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcase_widget.dart';

import 'core/theme/core_dialog.dart';
import 'core/theme/core_theme_di.dart';
import 'routes/routes.dart';

void main() {
  runZoned<Future<void>>(() async {
    runApp(
      ShowCaseWidget(
          onStart: (index, key) {
          },
          onComplete: (index, key) {
            if (index == 4)
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
                  .copyWith(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white));
          },
          // blurValue: 1,
          builder: Builder(builder: (context) => MyApp()),
          autoPlay: false,
          autoPlayDelay: Duration(seconds: 3),
          autoPlayLockEnable: false,
    )
      
      
      );
  });
}


class MyApp extends StatefulWidget {
  MyApp();
  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final _navigatorKey = GlobalKey<NavigatorState>();
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  Timer _timer;

  @override
  void initState() {
    super.initState();
    // this._initializeTimer();
  }


  void _initializeTimer() {
  }




  CoreDialog coreDialog;
  @override
  Widget build(BuildContext context) {
    coreDialog = new CoreDialog(myContext: context);
    return GetMaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Fortune Pay',
      debugShowCheckedModeBanner: false,
      initialRoute: introPageRoute,
      getPages: getPages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: themeDI.getCoreColor().transferTFBG,
      ),
    );
  }
}