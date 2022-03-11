

import 'package:get/get_state_manager/get_state_manager.dart';

import 'core_color.dart';
import 'core_picker.dart';
import 'core_size.dart';
import 'core_style.dart';

class CoreThemeDI extends GetxController{
  CorePicker _corePicker;
  CorePicker getCorePicker(){
    return _corePicker;
  }

  CoreTextStyle _coreTextStyle;
  CoreTextStyle getCoreTextStyle(){
    return _coreTextStyle;
  }

  CoreColor _coreColor;
  CoreColor getCoreColor(){
    return _coreColor;
  }
  CoreThemeDI(){
    this._coreTextStyle = new CoreTextStyle();
    this._coreColor=new CoreColor();
    this._coreSize= new CoreSize();
    _corePicker = new CorePicker();
  }
  CoreSize _coreSize;
  CoreSize getCoreSize(){
    return _coreSize;
  }


  


}