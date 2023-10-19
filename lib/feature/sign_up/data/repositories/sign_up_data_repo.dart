import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/sign_up/data/data_sources/sign_up_data_sourses.dart';
import 'package:sold_app/feature/sign_up/domain/entities/SignUpEntity.dart';
import 'package:sold_app/feature/sign_up/domain/entities/user_data.dart';
import 'package:sold_app/feature/sign_up/domain/repositories/sign_up_domain_repo.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources sourses;

  SignUpDataRepo(this.sourses);

  @override
  Future<Either<Failures, SignUpEntity>> signUp(UserData userData) {
    return sourses.signUp(userData);
  }
}
