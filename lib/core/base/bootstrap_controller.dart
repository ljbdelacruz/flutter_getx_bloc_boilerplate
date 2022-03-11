

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../device/device_info.dart';
import '../error/failures.dart';
import '../theme/core_dialog.dart';
import '../util/config.util.dart';
import '../util/scanqr_util.dart';
import '../util/util_di.dart';
import 'base_controller.dart';


/// initialize and setup application controllers and functionalities
class BootStrapController extends BaseRouteController {

  bool _isTokenInvalid=false;
  updateIsTokenInvalid(bool v){
    this._isTokenInvalid=v;
  }
  bool getTokenIsInvalid(){
    return _isTokenInvalid;
  }


  checkTokenValidity(Function scall){
    if(this._isTokenInvalid){
      scall();
    }
  }


  DeviceInfo deviceInfo;
  SharedPreferences sharedPref;
  CoreUtilService _coreUtilService;
  CoreUtilService getUtilService(){
    return _coreUtilService;
  }
  CoreDialog _coreDialog = Get.put(CoreDialog());
  CoreDialog getCoreDialog(){
    return _coreDialog;
  }
  DeviceInfo getDeviceInfo(){
    return deviceInfo;
  }

  ConfigUtil configUrl;
  ///initialize apps dependencies
  BootStrapController(){
  }

  ScanQRUtil _scanQRUtil = ScanQRUtil();
  ScanQRUtil getScanQRUtil(){
    return _scanQRUtil;
  }


}