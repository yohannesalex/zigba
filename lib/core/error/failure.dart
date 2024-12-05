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

class SaveFailure extends Failure {
  SaveFailure() : super('Save Failure');
}

class FetchFailure extends Failure {
  FetchFailure() : super('Fetch Failure');
}

class NotFoundFailure extends Failure {
  NotFoundFailure() : super('Not Found Failure');
}
