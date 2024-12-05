import 'package:flutter_test/flutter_test.dart';

import 'package:zigba/features/auth/Data/model/user_model.dart';
import 'package:zigba/features/auth/Domain/entity/user_entity.dart';

void main() {
  final testUserModel =
      UserModel(email: 'user@gmail.com', password: 'abcd1234');

  final testUserEntity = User(email: 'user@gmail.com', password: 'abcd1234');

  test('should be a subclass of login entity', () async {
    expect(testUserModel, isA<User>());
  });
  test('should be return a correct user model', () async {
    final result = UserModel.toModel(testUserEntity);
    expect(result, testUserModel);
  });
}
