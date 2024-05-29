import 'package:news_app/domain/entities/user.dart';
import 'package:news_app/domain/repositories/auth_repository.dart';

class MockAuthenticationRepository extends AuthenticationRepository {
  @override
  Future<User> signUp(String username) async {
    //Fake sign up action
    await Future.delayed(const Duration(seconds: 1));
    return User(username: username);
  }
}
