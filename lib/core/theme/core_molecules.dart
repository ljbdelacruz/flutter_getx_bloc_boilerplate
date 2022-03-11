



 


 import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'core_theme_di.dart';

class ContainerBGImage extends StatelessWidget{
  final String image;
  final double width;
  final double height;
  final Widget child;
  ContainerBGImage({this.image, this.width=0, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      width:width,
      height:height,
      child:child,
    );
  }
}


class CoreContainerBGImageMol extends StatelessWidget{
  final String image;
  final double width;
  final double height;
  final Widget content;
  CoreContainerBGImageMol({this.image='', this.width=0, this.height=0, this.content});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width:width,
      height:height,
      decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
      ),
      child:content
    );
  }
}



class FourDisplayWidgetsMol extends StatelessWidget{
  final double height;
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  final List<Widget> options;
  FourDisplayWidgetsMol(this.options, {this.height = 0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        var width = (MediaQuery.of(context).size.width * 0.9) / 4;
        List<Widget> items = [];
        List<Widget> itemsRow = [];
        options.forEach((element) { 
          if(itemsRow.length < 2){
            itemsRow.add(element);
          }else{
            itemsRow.add(element);
            items.add(SizedBox(height:MediaQuery.of(context).size.height * 0.01));
            items.add(Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:itemsRow)
            );
            itemsRow = [];
          }
        });
        items.add(SizedBox(height:MediaQuery.of(context).size.height * 0.01));
        if(itemsRow.length > 0){
          if(itemsRow.length == 1){
            itemsRow.add(SizedBox(
              width:width,
            ));
            itemsRow.add(SizedBox(
              width:width,
            ));
          }
          if(itemsRow.length == 2){
            itemsRow.add(SizedBox(
              width:width,
            ));
          }
          items.add(Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:itemsRow)
          );
        }

        var paddingSides = MediaQuery.of(context).size.width * 0.05;
        return Container(
          width:MediaQuery.of(context).size.width,
          height:height,
          padding:EdgeInsets.only(left:paddingSides, right:paddingSides),
          child:ListView(
          children:items
        ));
  }
}


class CoreSubHeaderMol extends StatelessWidget{
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  final String lbl;
  CoreSubHeaderMol(this.lbl);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var paddingHoriz = MediaQuery.of(context).size.width * 0.03;
    var paddingVert = MediaQuery.of(context).size.height * 0.02;
    return Container(
      color: themeDI.getCoreColor().disableColorRegister,
      padding:EdgeInsets.only(left:paddingHoriz, right:paddingHoriz, top:paddingVert, bottom:paddingVert),
      child: Text(lbl, style: themeDI.getCoreTextStyle().textBold(fontSz:themeDI.getCoreSize().getFontSz15(context), tColor: themeDI.getCoreColor().textColorLogin))
    );
  }
  
}