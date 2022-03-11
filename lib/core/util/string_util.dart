import 'package:intl/intl.dart';

class StringUtil {

  String removeSpecCarFromMobile(String mobile){
    return mobile.contains("+63") ? mobile.replaceAll("+63", "0") : mobile;
  }

  String amountFormatter(double balance){
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    return balance.toStringAsFixed(2).replaceAllMapped(reg, mathFunc);
  }
  String formatToYYYYMMDD(DateTime time){
    return time.year.toString()+"-"+time.month.toString()+"-"+time.day.toString();
  }
  String formatToMMDDYYYY(DateTime time){
    return time.month.toString()+"-"+time.day.toString()+"-"+time.year.toString();
  }
  String formatToMMMMDDYYYY(DateTime time){
    return DateFormat('MMMM dd, yyyy ').format(time);
  }
  String formatToMMMMDDYYYYHHMM(DateTime time){
    return DateFormat('MMMM dd, yyyy HH:MM ').format(time)+ timeIdentfier(time);
  }
  String timeIdentfier(DateTime time){
    return time.hour >=12 ? "PM" : "AM";
  }
  
}