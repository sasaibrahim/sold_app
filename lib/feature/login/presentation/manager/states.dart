import 'package:sold_app/core/error/failure.dart';

import '../../domain/entities/login_entity.dart';

abstract class LoginStates {}

class LoginInitStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {
  LoginEntity loginEntity;

  LoginSuccessStates(this.loginEntity);
}

class LoginErrorStates extends LoginStates {
  Failures failures;

  LoginErrorStates(this.failures);
}
