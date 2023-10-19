import 'package:dartz/dartz.dart';
import 'package:sold_app/feature/sign_up/domain/entities/user_data.dart';
import 'package:sold_app/feature/sign_up/domain/repositories/sign_up_domain_repo.dart';

import '../../../../core/error/failure.dart';
import '../entities/SignUpEntity.dart';

class SignUpUseCase {
  SignUpDomainRepo signUpDomainRepo;

  SignUpUseCase(this.signUpDomainRepo);

  Future<Either<Failures, SignUpEntity>> call(UserData userData) =>
      signUpDomainRepo.signUp(userData);
}
