import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String password;

  User({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
