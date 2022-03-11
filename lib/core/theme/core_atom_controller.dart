



import 'package:get/get.dart';

class CoreRawMaterialTextButtonEnabledAtomController extends GetxController{
  bool isEnabled=false;
  updateIsEnabled(bool v){
    this.isEnabled=v;
    update();
  }
}