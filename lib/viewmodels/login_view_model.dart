import 'package:flutter_oauth_example/constants/const.dart';
import 'package:flutter_oauth_example/constants/route_name.dart';
import 'package:flutter_oauth_example/locator.dart';
import 'package:flutter_oauth_example/services/navigation_service.dart';
import 'package:flutter_oauth_example/services/oauth_service.dart';
import 'package:flutter_oauth_example/services/alert_service.dart';
import 'package:flutter_oauth_example/services/storage_service.dart';
import 'package:flutter_oauth_example/viewmodels/base_model.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final OAuthService _OAuthService = locator<OAuthService>();
  final AlertService _alertService = locator<AlertService>();
  final StorageService _storageService = locator<StorageService>();
  void loginAccount(BuildContext context) async {
    setBusy(true);
    Map<String, dynamic> status = await _OAuthService.loginOauth();
    // print("status login"+status['statusLogin']);
    if(status['statusLogin']){
      _storageService.setString(K_ACCESS_TOKEN, status['accessToken']);
      _navigationService.navigateTo(HomeViewRoute);
    }else{
      _alertService.showError(context, "Error", status['statusMessage'], _navigationService.pop);
    }
    setBusy(false);
  }
}