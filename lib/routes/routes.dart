




import '../features/intro/presentation/atomic/intro_page.dart';
import 'package:get/get.dart';



const String introPageRoute="/introPage";

List<GetPage> getPages = [
  GetPage(name: introPageRoute, page: () => IntroPage())
];