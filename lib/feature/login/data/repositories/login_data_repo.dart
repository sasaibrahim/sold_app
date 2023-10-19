import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/login/data/data_sources/data_sources.dart';
import 'package:sold_app/feature/login/domain/entities/login_entity.dart';
import 'package:sold_app/feature/login/domain/repositories/login_domain_repo.dart';

class LoginDataRepo implements LoginDomainRepo {
  LoginDataSources loginDataSources;

  LoginDataRepo(this.loginDataSources);

  @override
  Future<Either<Failures, LoginEntity>> login(String email, String password) =>
      loginDataSources.login(email, password);
}
