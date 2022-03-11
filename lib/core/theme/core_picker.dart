


import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CorePicker{
  showDatePicker(BuildContext context, Function callback){
              DatePicker.showDatePicker(context,
                            showTitleActions : true,
                            minTime : DateTime(DateTime.now().year-30, 1, 1),
                            maxTime : DateTime(DateTime.now().year, 12, 31),
                            onChanged : (date) {
                              // print('change $date');
                            },
                            onConfirm : (date) {
                              callback(date);
                            },
                            currentTime : DateTime.now(), locale: LocaleType.en);
  }
}