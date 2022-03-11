


import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_bloc_boilerplate/core/util/network_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../device/device_info.dart';
import '../network/body.dart';
import '../network/network_info.dart';
import '../network/rest_client.dart';



class BaseDIServiceController extends GetxController{
  NetworkInfoImpl networkInfo;
  DataConnectionChecker dataConn;
  RestClient restClient;
  NetworkBody networkBody;
  DeviceInfo deviceInfo;
  SharedPreferences sharedPref;
  NetworkUtil networkUtil;
  
  BaseDIServiceController(){
    setup();
  }
  setup() async{
    this.networkUtil = NetworkUtil();
    dataConn = DataConnectionChecker();
    this.networkInfo = new NetworkInfoImpl(dataConn);
    restClient = RestClient();
    deviceInfo = DeviceInfo();
    networkBody = NetworkBody(deviceInfo.getCompanyId(), deviceInfo.getDeviceType(), deviceInfo.getDeviceInfoString(), deviceInfo.getDeviceId());
    sharedPref = await SharedPreferences.getInstance();
  }

}

class BaseRouteController extends GetxController{

  int pageState=0;
  updatePageState(int v){
    this.pageState = v;
    update();
  }


  //to camera
  popContext(BuildContext context){
    Navigator.pop(context);
  }



  // checkError(dynamic e){
  //   switch(e){
  //     case NoInternetFailure:
  //       this.toNoInternetConnection();
  //       break;
  //     default:
  //       break;
  //   }
  // }
}