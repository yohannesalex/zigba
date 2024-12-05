abstract class Failure {
  final String message;
  Failure(this.message);
}

class UserAlreadyExistsFailure extends Failure {
  UserAlreadyExistsFailure() : super('User already exists');
}

class UserNotFoundFailure extends Failure {
  UserNotFoundFailure() : super('User not found');
}

class InvalidPasswordFailure extends Failure {
  InvalidPasswordFailure() : super('Invalid password');
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure() : super('Invalid Input');
}
