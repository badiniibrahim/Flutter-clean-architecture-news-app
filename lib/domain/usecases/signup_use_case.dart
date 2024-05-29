import 'package:news_app/app/core/usecases/param_usecase.dart';
import 'package:news_app/domain/entities/user.dart';
import 'package:news_app/domain/repositories/auth_repository.dart';

class SignUpUseCase extends ParamUseCase<User, String> {
  final AuthenticationRepository _repo;
  SignUpUseCase(this._repo);

  @override
  Future<User> execute(String params) {
    return _repo.signUp(params);
  }
}
