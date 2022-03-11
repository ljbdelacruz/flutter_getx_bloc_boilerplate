


import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePickerUtil{


  showDatePicker(BuildContext context, Function scall){
              DatePicker.showDatePicker(context,
                            showTitleActions : true,
                            minTime : DateTime(DateTime.now().year-30, 1, 1),
                            maxTime : DateTime(DateTime.now().year, 12, 31),
                            onChanged : (date) {
                              // print('change $date');
                            },
                            onConfirm : (date) {
                              scall(date);
                            },
                            currentTime : DateTime.now(), locale: LocaleType.en
              );
  }

  birthDatePicker(BuildContext context, Function scall){
      DatePicker.showDatePicker(context,
                showTitleActions : true,
                //make sure 80 years old can only use the app
                minTime : DateTime(DateTime.now().year-80, 1, 1),
                //make sure 18 years old plus can only use the app
                maxTime : DateTime(DateTime.now().year-13, 12, 31),
                onChanged : (date) {
                  // print('change $date');
                },
                onConfirm : (date) {
                  scall(date);
                },
                currentTime : DateTime.now(), locale: LocaleType.en
      );
  }


}