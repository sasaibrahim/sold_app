import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sold_app/feature/login/data/models/login_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/constants.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(String email, String password);
}

class RemoteDto implements LoginDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, LoginModel>> login(
      String email, String password) async {
    try {
      var response =
          await dio.post("${Constants.baseApiUrl}${EndPoints.login}", data: {
        "email": email,
        "password": password,
      });
      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class LocaleDto implements LoginDataSources {
  @override
  Future<Either<Failures, LoginModel>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
