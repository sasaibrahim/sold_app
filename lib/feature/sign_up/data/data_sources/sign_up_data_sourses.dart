import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/sign_up/data/models/SignUpModel.dart';

import '../../domain/entities/user_data.dart';

abstract class SignUpDataSources {
  Future<Either<Failures, SignUpModel>> signUp(UserData userData);
}
