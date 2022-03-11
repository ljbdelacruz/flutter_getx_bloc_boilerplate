



import 'package:flutter/material.dart';

class CoreColor {
  Color primaryColor = Color(0xff052A60);
  Color secondaryColor = Color(0xff3155A6);
  Color tertiaryColor = Color(0xff131C2E);
  Color fourthColor = Color(0xffFFE3E3);
  
  Color headerColor = Color(0xff030E64);


  Color textColorOnboarding = Colors.black;

  //login
  Color textColorLogin = Colors.white;
  Color loginPrimaryColor = Color(0xff131C2E);


  Color transparent = Colors.transparent;


  //wallet balance


  //billers
  Color billersTextColor = Color(0xff179CFF);
  Color billerConfirmColor = Colors.white;

  //register
  Color disableColorRegister = Color(0xff282C2E);
  Color resendColorRegister = Color(0xffFCB913);


  //transfer

  Color transferTFBG = Color(0xff1A263F);
  Color headerFavBG = Color(0xff0D1422);

  
  //error
  Color errorColorLogin=Colors.red;

  Color getCoreColorByTransactionStatus(String status){
    switch(int.parse(status)){
      case 1:
        return Color(0xffFFB32C);
      case 2:
        return Color(0xff39B54A);
      default:
        return Color(0xffED1C24);
    }
  }


}