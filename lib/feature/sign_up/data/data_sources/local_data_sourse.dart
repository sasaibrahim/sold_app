import 'package:dartz/dartz.dart';
import 'package:sold_app/core/error/failure.dart';
import 'package:sold_app/feature/sign_up/data/data_sources/sign_up_data_sourses.dart';
import 'package:sold_app/feature/sign_up/data/models/SignUpModel.dart';

import '../../domain/entities/user_data.dart';

class LocaleDataSourses implements SignUpDataSources {
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
