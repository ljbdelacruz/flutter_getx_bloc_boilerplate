



import 'package:flutter/material.dart';

class TextInputUtil{

  TextInputType getKeyboard(String type){
    switch(type.toLowerCase()){
      case "numeric":
      case "number":
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }
}