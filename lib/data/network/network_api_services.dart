

import 'dart:convert';
import 'dart:io';

import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
import 'package:cupid_match/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../GlobalVariable/nullFunction.dart';
import '../../views/splash_screen.dart';
import '../../widgets/drawer.dart';
import '../app_exceptions.dart';
String? badresponseextrac;
dynamic badresponse;
class NetworkApiServices extends BaseApiServices {

  var apiresponsehit;

  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
          const Duration(seconds: 10));
      responseJson = returnResponse(response);
      apiresponsehit = jsonDecode(response.body);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    print(responseJson);
    return responseJson;
  }
@override
Future<dynamic> getApi2(String url)async{

  final prefs=await SharedPreferences.getInstance();
  if (kDebugMode) {
    print(url);
  }

  dynamic responseJson ;
  try {


    final response = await http.get(Uri.parse(url),

      headers: { "Authorization":"Bearer ${prefs.getString('BarearToken')}"},
      
    ).timeout( const Duration(seconds: 20)

    );
    print(prefs.getString('BarearToken'));
    responseJson  = returnResponse(response) ;
    apiresponsehit=jsonDecode(response.body);
  }on SocketException {
    throw InternetException('');
  }on RequestTimeOut {
    throw RequestTimeOut('');

  }
  // print(responseJson);
  return responseJson ;

}


  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      print("yes");
      final response = await http.post(Uri.parse(url),
        body: data,

      ).timeout(const Duration(seconds: 10));


      responseJson = returnResponse(response);
      apiresponsehit = jsonDecode(response.body);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future postApi2(var data, String url) async {
      final prefs=await SharedPreferences.getInstance();
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      print(BarrierToken.toString());
      var response = await http.post(Uri.parse(url),

                headers: { "Authorization":"Bearer ${prefs.getString('BarearToken')}"},


          body:data
      );
      // print(response.body);
      // print("object");
      responseJson = returnResponse(response);

      apiresponsehit = jsonDecode(response.body);
      // print(apiresponsehit);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      // print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        badresponse=jsonDecode(response.body);

        badresponseextrac=badresponse['message'];
        throw BadRequestException(badresponseextrac.toString());

      case 401:

        logout();
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException(response.body.toString());

      default:
        throw FetchDataException('error accured while communicating to server'
            'with status code' +
            response.statusCode.toString());


      // case 400:
      //   dynamic responseJson = jsonDecode(response.body);
      //   return responseJson;
      // case 404:
      //   dynamic responseJson = jsonDecode(response.body);
      //   return responseJson;
      //
      // default :
      //   throw FetchDataException(
      //       'Error accoured while communicating with server ' +
      //           response.statusCode.toString());
    }
  }

  void logout()async {
    final SharedPreferences sp=await SharedPreferences.getInstance();

    // Delete the cached data when the user logs out
    box.remove('incomingRequestData');
    box.remove('outgoingRequestData');
    box.remove('recentSeekerMatchesData');
    box.remove('seekrprofiledata');
    box.remove('seekerChatListValue');
    sp.remove("BarearToken");

    // You can also clear all data in the storage if needed
    // box.erase();

    // Add any other logout logic you have here
    GlobalVarribalNull().NullFunction();
    Get.offAll(SplashScreen());

    print("Logged out successfully");
  }
}
