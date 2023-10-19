import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sold_app/feature/login/data/data_sources/data_sources.dart';
import 'package:sold_app/feature/login/presentation/manager/cubit.dart';
import 'package:sold_app/feature/login/presentation/pages/login.dart';
import 'package:sold_app/feature/sign_up/presentation/pages/sign_up.dart';

import '../../feature/home/presentation/pages/home.dart';

class Routes {
  static const String login = "/";
  static const String signUp = "signUp";
  static const String home = "homeScreen";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        // LoginEntity loginEntity =routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => LoginCubit(RemoteDto()),
                child: LoginScreen()));
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );

      default:
        return MaterialPageRoute(builder: (context) => unDefinedRoutes());
    }
  }

  static unDefinedRoutes() {
    Scaffold(
      body: Center(
        child: Text("UndefinedRoutes"),
      ),
    );
  }
}
