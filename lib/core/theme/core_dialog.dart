



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CoreDialog extends GetxController{
  final BuildContext myContext;
  CoreDialog({this.myContext});



  showMyCoreDialog(AlertDialog dialog) async{
      await showDialog(
                context: myContext,
                builder: (BuildContext context) {
                  return dialog;
                }
      );
  }


}