



import 'package:url_launcher/url_launcher.dart';

class RedirectUtil{



  redirectWebAndPhone(String url) async{
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
  }

  redirectEmail(String email)async{
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String  url = params.toString();
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }

  }
}