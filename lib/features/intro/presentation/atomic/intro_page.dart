


import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../core/theme/core_theme.dart';
import '../../../../core/theme/core_theme_di.dart';

class IntroPage extends StatefulWidget {
  
  IntroPage();
  @override
  IntroPageState createState(){
    return IntroPageState();
  }
}

class IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin {
  final CoreThemeDI themeDI = Get.put(CoreThemeDI());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CoreThemeBackground(
      ListView(children:[]),
      bgColor: themeDI.getCoreColor().transferTFBG,
      header: CoreHeaderMol(
        header:"Intro Page",
        event:(){},
        height:MediaQuery.of(context).size.height,
        iconColor: themeDI.getCoreColor().textColorLogin,
        titleStyle: themeDI.getCoreTextStyle().textBold(fontSz: themeDI.getCoreSize().getFontSz15(context), tColor: themeDI.getCoreColor().textColorLogin),
      ),
      headerHeight: themeDI.getCoreSize().getHeaderHeight(context),
    );
  }


}