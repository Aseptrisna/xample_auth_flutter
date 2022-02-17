import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_oauth_example/constants/const.dart';
import 'package:flutter_oauth_example/models/login_data.dart';
import 'dart:convert' show jsonDecode;
class OAuthService {
  Future<Map<String, dynamic>> loginOauth() async {
    print("Start Login");
    final callbackUrlScheme = 'oid.pptik.id';

    // Construct the url
    final url = Uri.http(BASE_URL, LOGIN_URI, {
      'response_type': 'code',
      'client_id': CLIENT_ID,
      'redirect_uri': '$REDIRECT_URI:/',
      'scope': '',
    });
    print("Starting auth");
    Map<String, dynamic> returnData = new Map();
    bool loginStatus = true;
    try{
      final result = await FlutterWebAuth.authenticate(url: url.toString(), callbackUrlScheme: REDIRECT_URI);

// Extract code from resulting url
      final code = Uri.parse(result).queryParameters['code'];
      final state = Uri.parse(result).queryParameters['state'];
      print("Code=");
      print(code);
      final uri = Uri.http(BASE_URL, CALLBACK_URI, {
        'code': code,
        'state': state
      });
      final response = await http.get(uri);
      print(response.body);
      Map<String, dynamic> accessToken = jsonDecode(response.body);
      print(accessToken);
      returnData = jsonDecode(response.body);
      returnData['statusLogin'] = true;
    }on PlatformException catch (err) {
      returnData['statusLogin'] = false;
      returnData['statusMessage'] = "Login Cancelled";
    } catch (err) {
      returnData['statusLogin'] = false;
      print(err);
      // other types of Exceptions
    }

    return returnData;
  }

  Future<LoginData?> checkUser(String token) async {
    // print("cek");
    Map<String, String> headers = {
      "Content-type":"application/json",
      "Accept":"application/json",
      "Authorization":token
    };
    final uri = Uri.http(BASE_URL, "app/auth/getuser");
    final response = await http.get(uri, headers:headers);
    // print(response);
    if(response.statusCode==200){
      Map<String, dynamic> responseData = jsonDecode(response.body);
      print(response.body);
      return LoginData(
          username:responseData['username'],
          first_name: responseData['first_name'],
          email: responseData['email'],
          last_name: responseData['last_name']
      );
    }else{
      // print(response.body);
      return null;
    }

  }

}