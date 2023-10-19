import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/login/domain/entities/login_entity.dart';

abstract class LoginDomainRepo {
  Future<Either<Failures, LoginEntity>> login(String email, String password);
}
