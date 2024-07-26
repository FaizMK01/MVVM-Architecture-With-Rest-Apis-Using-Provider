class AppExceptions implements Exception {
  final String? message;
  final String? prefix;

  AppExceptions([this.message, this.prefix]);

  @override
  String toString() {
    return '$message $prefix';
  }
}

class ErrorCommunication extends AppExceptions{

  ErrorCommunication([String? message]):super(message , 'Error During Communication');

}
class BadRequestException extends AppExceptions{
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorizedException extends AppExceptions{

  UnauthorizedException([String? message]) : super(message , 'Unauthorized Request');
}

class InvalidInputException extends AppExceptions{
  InvalidInputException([String? message]): super(message,'Invalid Input');
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]): super(message,'Invalid Input');
}


