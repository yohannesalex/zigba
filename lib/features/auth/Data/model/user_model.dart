import 'package:hive/hive.dart';
import 'package:zigba/features/auth/Domain/entity/user_entity.dart';

@HiveType(typeId: 0)
class UserModel extends User {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String password;

  UserModel({
    required this.email,
    required this.password,
  }) : super(email: '', password: '');

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      password: map['password'],
    );
  }

  static UserModel toModel(User user) {
    return UserModel(
      email: user.email,
      password: user.password,
    );
  }
}
