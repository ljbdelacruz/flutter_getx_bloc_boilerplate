



import 'package:get/get.dart';

import 'encryption_util.dart';
import 'network_util.dart';
import 'picker_util.dart';
import 'redirect_util.dart';
import 'scanqr_util.dart';
import 'string_util.dart';
import 'text_input_util.dart';

class CoreUtilService extends GetxController{

  final StringUtil _stringUtil = StringUtil();
  final TextInputUtil _textInputUtil = TextInputUtil();
  final NetworkUtil _networkUtil = NetworkUtil();


  TextInputUtil getTextInputUtil(){
    return _textInputUtil;
  }

  StringUtil getStringUtil(){
    return _stringUtil;
  }

  NetworkUtil getNetworkUtil(){
    return _networkUtil;
  }
  RedirectUtil _redirectUtil = RedirectUtil();
  RedirectUtil getRedirectUtil(){
    return _redirectUtil;
  }
  
  EncryptionUtil _encryptionUtil=EncryptionUtil();
  EncryptionUtil getEncryptionUtil(){
    return _encryptionUtil;
  }

  ScanQRUtil _scanQR = ScanQRUtil();
  ScanQRUtil getScanQRUtil(){
    return _scanQR;
  }
  DatePickerUtil _datePicker=DatePickerUtil();
  DatePickerUtil getDatePickerUtil(){
    return _datePicker;
  }
  

}