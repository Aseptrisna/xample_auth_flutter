import 'package:flutter_oauth_example/constants/const.dart';
import 'package:flutter_oauth_example/constants/route_name.dart';
import 'package:flutter_oauth_example/locator.dart';
import 'package:flutter_oauth_example/services/navigation_service.dart';
import 'package:flutter_oauth_example/services/oauth_service.dart';
import 'package:flutter_oauth_example/services/alert_service.dart';
import 'package:flutter_oauth_example/services/storage_service.dart';
import 'package:flutter_oauth_example/viewmodels/base_model.dart';
import 'package:flutter_oauth_example/models/login_data.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final OAuthService _OAuthService = locator<OAuthService>();
  final AlertService _alertService = locator<AlertService>();
  final StorageService _storageService = locator<StorageService>();
  String test2 = "";
  LoginData loginData = LoginData(
    username: "",
    first_name: "",
    last_name: "",
    email: ""
  );
  void checkUser(BuildContext context) async {
    setBusy(true);
    String? token = await _storageService.getString(K_ACCESS_TOKEN);
    if(token!=null){
      LoginData? data = await _OAuthService.checkUser(token);
      if(data!=null){
        loginData = data;
      }
    }else{

    }
    setBusy(false);
  }
  void logout(BuildContext context) async {
    _storageService.clearStorage();
    _navigationService.navigateTo(LoginViewRoute);
  }
}