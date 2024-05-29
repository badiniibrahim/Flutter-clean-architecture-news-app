import 'package:news_app/domain/entities/user.dart';
import 'package:news_app/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<User> signUp(String username) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
