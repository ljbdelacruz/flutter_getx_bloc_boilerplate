


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'core_atom_controller.dart';
import 'core_theme.dart';






class BillerCategoryCellAtom extends StatelessWidget{
  final Function event;
  final TextStyle style;
  final String lbl;
  final String assetImage;
  final Color bgColor;
  final double width;
  final double imageWidth;
  final double imageHeight;
  final bool isNetwork;
  BillerCategoryCellAtom({this.event, this.style, this.lbl="", this.assetImage="", this.bgColor = Colors.white, this.width=0, this.imageHeight=0, this.imageWidth=0, this.isNetwork=false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var paddingHoriz=MediaQuery.of(context).size.width * 0.02;

    return InkWell(onTap:(){
      if(event != null){
        event();
      }
    }, child: Container(
      width:width,
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
      Container(
        padding: EdgeInsets.only(left: paddingHoriz, right: paddingHoriz),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: bgColor,
        ),
        // padding:EdgeInsets.all(15),
        child:
         isNetwork ?
         CachedNetworkImage(imageUrl: assetImage, height: imageHeight, width:imageWidth) 
         :
         Image.asset(assetImage, width: imageWidth, height: imageHeight, fit: BoxFit.contain),
      ),
      SizedBox(height:10),
      Container(
        width:width,
        child: Text(lbl, textAlign:TextAlign.center, style:style))
    ])));
  }
}



class IconButtonAtom extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final double size;
  final Function event;
  IconButtonAtom({this.icon, this.size=10, this.iconColor = Colors.white, this.event});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(onTap:(){
      if(event != null){
        event();
      }
    }, child: Icon(icon, size:size, color: iconColor));
  }
}

class ImageButtonAtom extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final String image;
  final Function event;
  ImageButtonAtom({this.image="", this.imageWidth=0, this.imageHeight=0, this.event});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(onTap:(){
      if(event != null){
        event();
      }
    }, child: Image.asset(image, fit: BoxFit.cover, height:imageHeight, width:imageWidth));
  }
  
}


//textfields


class CashinFormInputAtom extends StatelessWidget{

  final TextEditingController controller;
  final bool isObscure;
  final String lbl;
  final TextStyle lblStyle;
  final double width;
  final Color borderColor;
  final Function onChangeEvent;
  final bool isEnabled;
  CashinFormInputAtom({this.controller, this.isObscure=false, this.lbl="", this.lblStyle, this.width = 100, this.borderColor=Colors.white, this.onChangeEvent, this.isEnabled=true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[

    Text(lbl, style: lblStyle),
    Container(
              width:width,
              height:50,
              decoration: BoxDecoration(
                border: Border.all(color:borderColor),
                color: Colors.transparent,
              ),
              child: Padding(padding:EdgeInsets.all(5),child:
              Row(children:[
                // Container(
                //   width:30,
                //   child: Text("+63", style:TextStyle(color:Colors.white, fontSize:15))),
                Container(
                  width:MediaQuery.of(context).size.width - 112,
                  height: 40,
                  child:TextField(
                  enabled: this.isEnabled,
                  keyboardType: TextInputType.number,
                  inputFormatters: [],
                  onChanged: (s){
                    if(onChangeEvent != null){
                      onChangeEvent();
                    }
                  },
                  style: TextStyle(color:borderColor, fontSize:15),
                  controller: controller,
                  maxLength: 11,
                  obscureText: isObscure,
                  cursorColor: borderColor,
                  decoration: InputDecoration(labelText: "", counterText: "", 
                  border: InputBorder.none,
                  fillColor: borderColor,
                  labelStyle: TextStyle(color:borderColor),
                  focusColor: borderColor,
                )))
              ])
            
            )
            )
    ]);
  }
}


class RoundedNetworkImageAtom extends StatelessWidget{
  final double radius;
  final String src;
  RoundedNetworkImageAtom({this.radius=100, this.src=""});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(
            src
          ),
        );
  }
}


class CoreRawMaterialTextButtonEnabledAtom extends StatelessWidget{
  final String text;
  final Color bgColor;
  final Color disabledColor;
  final Function event;
  final TextStyle style;
  final bool isProcessing;
  final Color borderColor;
  final CoreRawMaterialTextButtonEnabledAtomController controller = Get.put(CoreRawMaterialTextButtonEnabledAtomController());
  CoreRawMaterialTextButtonEnabledAtom({this.text="", this.bgColor=Colors.white, this.disabledColor=Colors.black, this.style, this.isProcessing=false, this.borderColor=Colors.transparent, this.event});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<CoreRawMaterialTextButtonEnabledAtomController>(builder:(_){
      return CoreRawMaterialTextButtonMol(
        bgColor: _.isEnabled ? bgColor : disabledColor,
        text:text,
        style:style,
        width:MediaQuery.of(context).size.width,
        paddingHeight: 1,
        isProcessing: isProcessing,
        borderColor: borderColor,
        event:(){
          if(_.isEnabled){
            if(this.event != null){
              event();
            }
          }
        },
      );
    });
  }
}


class CurrencyAmountTextAtom extends StatelessWidget{
  final TextStyle style;
  final Widget contents;
  CurrencyAmountTextAtom(this.style, this.contents);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(children:[
      Text("PHP ", style: style),
      contents
    ]);
  }
  
}
