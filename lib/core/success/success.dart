


import 'package:equatable/equatable.dart';

abstract class Success extends Equatable{
  Success([List properties = const<dynamic>[]]):super([properties]);
}

class WithRefNumberSuccess extends Success{
  final String refNumber;
  WithRefNumberSuccess({this.refNumber=""});
}

class NoRefNumberSuccess extends Success{}

class CacheSuccess extends Success{
  
}