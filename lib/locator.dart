// import 'package:flutter_oauth_example/services/alert_service.dart';
// import 'package:flutter_oauth_example/services/api_service.dart';
// import 'package:flutter_oauth_example/services/ftp_service.dart';
// import 'package:flutter_oauth_example/services/geolocator_service.dart';
// import 'package:flutter_oauth_example/services/guid_service.dart';
// import 'package:flutter_oauth_example/services/navigation_service.dart';
// import 'package:flutter_oauth_example/services/permission_service.dart';
// import 'package:flutter_oauth_example/services/rmq_service.dart';
// import 'package:flutter_oauth_example/services/storage_service.dart';
// import 'package:flutter_oauth_example/services/vibrate_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_oauth_example/services/oauth_service.dart';
import 'package:flutter_oauth_example/services/navigation_service.dart';
import 'package:flutter_oauth_example/services/alert_service.dart';
import 'package:flutter_oauth_example/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => OAuthService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => StorageService());
}