import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sold_app/feature/sign_up/data/data_sources/sign_up_data_sourses.dart';
import 'package:sold_app/feature/sign_up/data/repositories/sign_up_data_repo.dart';
import 'package:sold_app/feature/sign_up/domain/entities/user_data.dart';
import 'package:sold_app/feature/sign_up/domain/repositories/sign_up_domain_repo.dart';
import 'package:sold_app/feature/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:sold_app/feature/sign_up/presentation/manager/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpDataSources sourses;

  SignUpCubit(this.sourses) : super(SignUpInitStates());

  static SignUpCubit get(context) => BlocProvider.of(context);
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void signUp() async {
    emit(SignUpLoadingStates());
    SignUpDomainRepo signUpDomainRepo = SignUpDataRepo(sourses);
    SignUpUseCase signUpUseCase = SignUpUseCase(signUpDomainRepo);
    UserData userData = UserData(
        // name: nameController.text,
        // phone: phoneController.text,
        // password: passwordController.text,
        // email: emailController.text);
        name: "mostafaelal",
        phone: "012476222",
        password: "123@sasa",
        email: "mostafa@gmail.com");
    var result = await signUpUseCase.call(userData);
    result.fold((l) {
      emit(SignUpErrorStates(l));
    }, (r) {
      emit(SignUpSuccessStates(r));
    });
  }
}
