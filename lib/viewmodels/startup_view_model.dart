import 'dart:async';
import 'dart:io';

import 'package:flutter_oauth_example/constants/const.dart';
import 'package:flutter_oauth_example/constants/route_name.dart';
import 'package:flutter_oauth_example/locator.dart';
import 'package:flutter_oauth_example/services/navigation_service.dart';
import 'package:flutter_oauth_example/services/storage_service.dart';
import 'package:flutter_oauth_example/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();


  void checkLoginStatus() async {
    String? token = await _storageService.getString(K_ACCESS_TOKEN);
    if(token!=null){
      _navigationService.navigateTo(HomeViewRoute);
    }else{
      _navigationService.navigateTo(LoginViewRoute);
    }
  }



}