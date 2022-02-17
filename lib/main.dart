import 'package:flutter_oauth_example/locator.dart';
import 'package:flutter_oauth_example/services/navigation_service.dart';
import 'package:flutter_oauth_example/ui/router.dart';
import 'package:flutter/material.dart';

// add crashnalytics
import 'dart:async';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// import flutter services
import 'package:flutter/services.dart';
import 'package:flutter_oauth_example/ui/views/login_view.dart';
import 'package:flutter_oauth_example/ui/views/startup_view.dart';

void main() {
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  // Crashlytics.instance.enableInDevMode = true;

  // // Pass all uncaught errors to Crashlytics.
  // FlutterError.onError = Crashlytics.instance.recordFlutterError;

  setupLocator();

  runZoned(
        () {
      runApp(MyApp());
    },
    // onError: Crashlytics.instance.recordError
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Survey PPTIK',
      home: StartUpView(),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}