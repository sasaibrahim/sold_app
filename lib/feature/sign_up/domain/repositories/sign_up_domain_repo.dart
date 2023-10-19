import 'package:dartz/dartz.dart';
import 'package:sold_app/feature/sign_up/domain/entities/user_data.dart';

import '../../../../core/error/failure.dart';
import '../entities/SignUpEntity.dart';

abstract class SignUpDomainRepo {
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData);
}
