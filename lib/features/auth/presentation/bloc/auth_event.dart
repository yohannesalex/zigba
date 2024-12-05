import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:zigba/features/auth/Domain/entity/user_entity.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final User user;

  const SignUpEvent(this.user);
  @override
  List<Object> get props => [user];
}

class LoginEvent extends AuthEvent {
  final User user;

  const LoginEvent(this.user);
  @override
  List<Object> get props => [user];
}
