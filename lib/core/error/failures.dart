


import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String message;
  final String code;
  Failure({this.message="", this.code=""});
}



///
///
///Exceptions for failure object
///
class ServerFailure extends Failure{
  final String message;
  ServerFailure({this.message=""});

}
class MappingFailure extends Failure{

}
class CacheFailure extends Failure{
}
class CacheFetchingFailure extends Failure{
}

class ValidationFailure extends Failure{
}
class NoInternetFailure extends Failure{}
class InvalidPhoneNumberFailure extends Failure{}
class PhoneNumberAlreadyRegisterdFailure extends Failure{}

class BadGatewayFailure extends Failure{}

class UnauthorizedFailure extends Failure{}

class InvalidUserFailure extends Failure{}

class RepositoryFailure extends Failure{}

class NotRegisteredYetFailure extends Failure{}

class ServiceUnavailableFailure extends Failure{}

class ForbiddenFailure extends Failure{}

class UserNotFoundFailure extends Failure{}
class UsecaseFailure extends Failure{}
class NewDeviceFoundFailure extends Failure{}
class AccountLockedFailure extends Failure{}
class AccountDeactivatedFailure extends Failure{}

class InvalidPinFailure extends Failure{
  InvalidPinFailure({String message=""}):super(message: message);
}
class InvalidOtpFailure extends Failure{}

class ConcurrentRequestNotSupportedFailure extends Failure{
  ConcurrentRequestNotSupportedFailure({String message=""}):super(message: message);
}


class NewDeviceLoginFailure extends Failure{}

class ProcessingFailure extends Failure{}


class FirebaseConfigFailure extends Failure{}


class UnableToReadQRCodeFailure extends Failure{}
class UnableToProcessQRCodeFailure extends Failure{}


//ecload

class InvalidMobileNumberFailure extends Failure{}

class PromoUnavailableFailure extends Failure{}

//unipin

class InvalidInputFailure extends Failure{}