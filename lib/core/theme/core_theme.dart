


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'core_theme_di.dart';



//atom



class UnderlinedButtonAtom extends StatelessWidget {
  final Function event;
  final String lbl;
  final double fontSz;
  final Color tColor;
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  UnderlinedButtonAtom({this.event, this.lbl="", this.fontSz=10, this.tColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(onTap:(){
      if(event != null){
        event();
      }
    }, child:Text(lbl, style: themeDI.getCoreTextStyle().textUnderlinedBold(fontSz: fontSz, tColor:tColor))
    );
  }
}

class TextButtonAtom extends StatelessWidget {
  final Function event;
  final String lbl;
  final double fontSz;
  final Color tColor;
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  TextButtonAtom({this.event, this.lbl="", this.fontSz=10, this.tColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(onTap:(){
      if(event != null){
        event();
      }
    }, child:Text(lbl, style: themeDI.getCoreTextStyle().textBold(fontSz: fontSz, tColor:tColor))
    );
  }
}


class RawMaterialButtonAtom extends StatelessWidget{
  final Function onClick;
  final Color bgColor;
  final double radius;
  final double elevation;
  final Widget content;
  final Color borderColor;
  RawMaterialButtonAtom({this.onClick, this.bgColor = Colors.white, this.radius = 100, this.elevation=0, this.content, this.borderColor=Colors.transparent});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (){
        if(onClick != null){
          onClick();
        }
      },
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius)), side: BorderSide(color: borderColor)),
      fillColor: bgColor,
      elevation: elevation,
      child: content
    );
  }
}


class CoreRawMaterialTextButtonMol extends StatelessWidget{
  final String text;
  final Color bgColor;
  final Function event;
  final TextStyle style;
  final double width;
  final double paddingHeight;
  final bool isProcessing;
  final Color borderColor;
  final double radius;
  CoreRawMaterialTextButtonMol({this.event, this.bgColor = Colors.white, this.text="No Text", this.style, this.width=100, this.paddingHeight=10, this.isProcessing=false, this.borderColor = Colors.transparent, this.radius=100});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width:width,
      padding:EdgeInsets.only(top:paddingHeight, bottom:paddingHeight),
      child:RawMaterialButtonAtom(
      borderColor: borderColor,
      onClick: (){
        if(!this.isProcessing){
          if(event != null){
            event();
          }
        }
      },
      bgColor: bgColor,
      radius:radius,
      content: isProcessing ? Container(
        width:width * 0.1,
        height:width * 0.1,
        child:CircularProgressIndicator()) :  Text(text, textAlign:TextAlign.center, style: style),
    ));
  }
}



class PinCodeTextFieldAtom extends StatelessWidget{

  final TextEditingController controller;
  final int pinCodeLength;
  final double pincodeRadius;
  final Color pinBoxColor;
  final Color hasTextBorderColor;
  final Color defaultBorderColor;
  final Color errorBorderColor;
  final Color textColor;
  final Function getOtp;
  final double pinBoxWidth;
  final double pinBoxHeight;
  PinCodeTextFieldAtom({this.controller, this.pinCodeLength=4, this.pincodeRadius=5, this.pinBoxColor = Colors.white, this.hasTextBorderColor = Colors.grey, this.defaultBorderColor = Colors.white, this.errorBorderColor = Colors.red, this.textColor = Colors.white, this.getOtp, this.pinBoxWidth, this.pinBoxHeight});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PinCodeTextField(
        maxLength: pinCodeLength, 
        pinBoxWidth: pinBoxWidth,
        pinBoxHeight:pinBoxHeight,
        controller: controller,
        pinBoxRadius: pincodeRadius,
        pinBoxColor: pinBoxColor,
        hasTextBorderColor: hasTextBorderColor, 
        defaultBorderColor: defaultBorderColor, 
        errorBorderColor: errorBorderColor, 
        wrapAlignment: WrapAlignment.center, hideCharacter: true, maskCharacter: "\u25CF", pinTextStyle: TextStyle(color:textColor),
        onTextChanged: (otp){
          if(getOtp != null){
            getOtp(otp);
          }
        });
  }
}

class AlreadyLoginPinCodeMol extends StatelessWidget {
  final TextEditingController controller;
  final double pincodeRadius;
  final Function getOtp;
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  final double width;
  final double height;
  AlreadyLoginPinCodeMol({this.controller, this.pincodeRadius, this.getOtp, this.height, this.width});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PinCodeTextFieldAtom(
      pinBoxWidth: (width * 0.8) / 4,
      pinBoxHeight: (height * 0.9) / 4,
      controller:controller,
      pinCodeLength: 4,
      pincodeRadius: pincodeRadius,
      pinBoxColor: themeDI.getCoreColor().primaryColor,
      hasTextBorderColor: themeDI.getCoreColor().textColorLogin,
      defaultBorderColor: themeDI.getCoreColor().primaryColor,
      textColor: themeDI.getCoreColor().textColorLogin,
      getOtp: (otp){
        if(getOtp != null){
          getOtp(otp);
        }
      },
    );
  }
}


class SixDigitPinMol extends StatelessWidget {
  final TextEditingController controller;
  final double pincodeRadius;
  final Function getOtp;
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  final double width;
  final double height;
  SixDigitPinMol({this.controller, this.pincodeRadius, this.getOtp, this.height, this.width});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PinCodeTextFieldAtom(
      pinBoxWidth: (width * 0.8) / 8,
      pinBoxHeight: (height * 0.9) / 8,
      controller:controller,
      pinCodeLength: 6,
      pincodeRadius: pincodeRadius,
      pinBoxColor: themeDI.getCoreColor().primaryColor,
      hasTextBorderColor: themeDI.getCoreColor().textColorLogin,
      defaultBorderColor: themeDI.getCoreColor().primaryColor,
      textColor: themeDI.getCoreColor().textColorLogin,
      getOtp: (otp){
        if(getOtp != null){
          getOtp(otp);
        }
      },
    );
  }
}



class EmptyTextFieldFormAtom extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboard;
  final bool isObscure;
  final TextStyle textStyle;
  final Color fillColor;
  final String hint;
  final Color focusColor;
  final Color cursorColor;
  final Function onChange;
  final int charLimit;
  final bool isEnabled;

  EmptyTextFieldFormAtom({this.controller, this.keyboard, this.isObscure=false, this.textStyle, this.fillColor, this.hint="", this.focusColor, this.cursorColor, this.onChange, this.charLimit=0, this.isEnabled=true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
                      onChanged: (s){
                        if(onChange != null){
                          onChange();
                        }
                      },
                      maxLength: charLimit == 0 ? null : charLimit,
                      keyboardType: keyboard,
                      style: textStyle,
                      controller: controller,
                      obscureText: isObscure,
                      cursorColor: cursorColor,
                      enabled: isEnabled,
                      decoration: InputDecoration(labelText: hint, counterText: "", 
                      border: InputBorder.none,
                      fillColor: fillColor,
                      labelStyle: textStyle,
                      focusColor: focusColor,
              ));
  }
}

class CoreDividerAtom extends StatelessWidget{


  final double width;
  final Color color;
  final double thickness;

  CoreDividerAtom({this.width=1, this.color = Colors.white, this.thickness=1});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(width:width, child: Divider(
      color: color,
      thickness: thickness,
    ));
  }

  
}





//molecules
class CoreHeaderMol extends StatelessWidget {
  final String header;
  final Function event;
  final double height;
  final Color iconColor;
  final double iconSz;
  final TextStyle titleStyle;
  CoreHeaderMol({this.header="", this.event, this.height=50, this.iconColor=Colors.white, this.titleStyle, this.iconSz = 20});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Color(0xff131C2E),
        padding:EdgeInsets.only(left:10, right:10),
        width:MediaQuery.of(context).size.width,
        height:height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            InkWell(onTap:(){
              if(event != null){
                event();
              }
            }, child: Icon(Icons.arrow_back_ios, color: iconColor, size:20)
            ),
            SizedBox(width:30),
            Text(header, style: titleStyle)
        ])
      );
  }
}

class CoreHeaderSubmitMol extends StatelessWidget {
  final String header;
  final Function event;
  final double height;
  final Color iconColor;
  final double iconSz;
  final TextStyle titleStyle;
  final String submitLbl;
  final bool isShowSubmit;
  final Function submitEvent;
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  CoreHeaderSubmitMol({this.header="", this.event, this.submitEvent, this.height=50, this.iconColor=Colors.white, this.titleStyle, this.iconSz = 20, this.submitLbl="", this.isShowSubmit=false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Color(0xff131C2E),
        padding:EdgeInsets.only(left:10, right:10),
        width:MediaQuery.of(context).size.width,
        height:height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Row(children:[
              InkWell(onTap:(){
                if(event != null){
                  event();
                }
              }, child: Icon(Icons.arrow_back_ios, color: iconColor, size:20)
              ),
              SizedBox(width:30),
              Text(header, style: titleStyle),
            ]),
            isShowSubmit ? TextButtonAtom(event:(){
              if(this.submitEvent != null){
                submitEvent();
              }
            },
            lbl: submitLbl,
            fontSz: themeDI.getCoreSize().getFontSz15(context),
            tColor: themeDI.getCoreColor().textColorLogin,
            ) : Container()

        ])
      );
  }
}

class CoreHeaderCloseMol extends StatelessWidget {

  final String header;
  final Function event;
  final double height;
  final Color iconColor;
  final double iconSz;
  final TextStyle titleStyle;
  CoreHeaderCloseMol({this.header="", this.event, this.height=50, this.iconColor=Colors.white, this.titleStyle, this.iconSz = 20});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Color(0xff131C2E),
        padding:EdgeInsets.only(left:10, right:10),
        width:MediaQuery.of(context).size.width,
        height:height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            SizedBox(width:30),
            Text(header, style: titleStyle),
            InkWell(onTap:(){
              if(event != null){
                event();
              }
            }, child: Icon(Icons.close, color: iconColor, size:20)
            ),
        ])
      );
  }
}

//organisms

class CoreLoginHeaderOrg extends StatelessWidget{
  final String header;
  final height;
  final Function event;
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  CoreLoginHeaderOrg({this.header="", this.height, this.event});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CoreHeaderMol(
      header:header,
      event:(){
        if(event != null){
          event();
        }
      },
      height: height,
      iconColor: themeDI.getCoreColor().textColorLogin,
      titleStyle: themeDI.getCoreTextStyle().textBold(fontSz:12, tColor: themeDI.getCoreColor().textColorLogin),
      iconSz:20
    );
  }
}






class LottieAtom extends StatelessWidget {
  final double width;
  final double height;
  final String lottieAnim;
  final AnimationController controller;  
  LottieAtom({this.width, this.height, this.lottieAnim, this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
    width:width,
    height:height,
    child: Lottie.asset(lottieAnim,
        controller: controller,
        width:height,
        height:height,
        fit: BoxFit.contain,        
        onLoaded: (composition){
        // controller..duration = composition.duration..repeat();
    }));
  }
}

//template
class CoreThemeBackground extends StatelessWidget{
  final double headerHeight;
  final Widget footer;
  final Widget drawer;
  final Widget endDrawer;
  final Widget header;
  final Color bgColor;
  final Widget content;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CoreThemeBackground(this.content,{this.header, this.headerHeight=0, this.footer, this.drawer, this.endDrawer, this.bgColor = Colors.white, this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
        return SafeArea(child:Scaffold(
              key: scaffoldKey,
              appBar:PreferredSize(preferredSize: Size.fromHeight(headerHeight) , child: header != null ? header : Container()),
              body:Container(
                color:bgColor,
                width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                child:content),
              bottomNavigationBar: footer,
              drawer: drawer,
              endDrawer: endDrawer,
            )
        );
  }
}


class CoreThemeImageBackground extends StatelessWidget{
  final double headerHeight;
  final Widget footer;
  final Widget drawer;
  final Widget endDrawer;
  final Widget header;
  final Color bgColor;
  final Widget content;
  final String bgImage;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CoreThemeImageBackground(this.content,{this.header, this.headerHeight=0, this.footer, this.drawer, this.endDrawer, 
    this.bgColor = Colors.white, this.scaffoldKey, 
    this.bgImage="assets/bgimage.png"
  });
  @override
  Widget build(BuildContext context) {
        return SafeArea(child:Scaffold(
              key: scaffoldKey,
              appBar:PreferredSize(preferredSize: Size.fromHeight(headerHeight) , child: header != null ? header : Container()),
              body:Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgImage),
                    fit: BoxFit.cover,
                  ),
                ),
                width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                child:content),
              bottomNavigationBar: footer,
              drawer: drawer,
              endDrawer: endDrawer,
            )
        );
  }
}