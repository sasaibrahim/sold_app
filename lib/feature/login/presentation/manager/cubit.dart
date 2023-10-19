import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sold_app/feature/login/data/repositories/login_data_repo.dart';
import 'package:sold_app/feature/login/domain/repositories/login_domain_repo.dart';
import 'package:sold_app/feature/login/domain/use_cases/login_use_case.dart';
import 'package:sold_app/feature/login/presentation/manager/states.dart';

import '../../data/data_sources/data_sources.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginDataSources sources;

  LoginCubit(this.sources) : super(LoginInitStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login() async {
    emit(LoginLoadingStates());
    LoginDomainRepo loginDomainRepo = LoginDataRepo(sources);
    LoginUseCase loginUseCase = LoginUseCase(loginDomainRepo);
    var result =
        await loginUseCase.call(emailController.text, passwordController.text);
    result.fold((l) {
      emit(LoginErrorStates(l));
    }, (r) {
      emit(LoginSuccessStates(r));
    });
  }
}
