


import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfo{
  String deviceId;
  String os;
  String deviceType;
  String manufacturer;
  String deviceVersion;
  String imei;

  DeviceInfo({bool isTestMode=false}){
    if(!isTestMode){
      this.setup();
    }
    //disable this when runnng test
  }
  setup()async{
    var deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS){
      var iosInfo = await deviceInfoPlugin.iosInfo;
      this.deviceId = iosInfo.identifierForVendor;
      this.deviceType="I";
      this.os="IOS";
      this.manufacturer="Apple";
      this.deviceVersion=iosInfo.model;
    } else {
      var androidInfo = await deviceInfoPlugin.androidInfo;
      this.os="ANDROID";
      this.deviceType="A";
      this.manufacturer="Android";
      this.deviceId=androidInfo.androidId;
      this.deviceVersion=androidInfo.model;
    }
  }

  Map<String, dynamic> getDeviceInfo(){
    return {			  "DeviceVersion" : deviceVersion,
                           "IMEINumber" : "",
                           "NetworkCountryISO" : 150,
                           "SIMCountryISO" :340,
                           "SIMSerialID" : "",
                           "SIMState" : "",
                           "UUIDNumber" : deviceId,
                           "DeviceManufacturer" : manufacturer,
                           "PhoneNumber" : "09394242879",
                           "DeviceOS" : os,
                           "BuildVersion" : ""
    };
  }
  String getDeviceInfoString(){
    return jsonEncode({			  "DeviceVersion" : deviceVersion,
                           "IMEINumber" : "",
                           "NetworkCountryISO" : 150,
                           "SIMCountryISO" :340,
                           "SIMSerialID" : "",
                           "SIMState" : "",
                           "UUIDNumber" : deviceId,
                           "DeviceManufacturer" : manufacturer,
                           "PhoneNumber" : "09394242879",
                           "DeviceOS" : os,
                           "BuildVersion" : ""
    });
  }

  ///get device ID
  String getDeviceId(){
    return "9e9523e81515145f";
  }
  /// get company ID
  String getCompanyId(){
    return "4bf735e97269421a80b82359e7dc2288";
  }

  /// wether its iphone (I) or (A) for android
  String getDeviceType(){
    return "I";
  }
}