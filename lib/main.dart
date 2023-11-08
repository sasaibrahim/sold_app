import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sold_app/core/utils/cach_helper.dart';
import 'package:sold_app/core/utils/observer.dart';

import 'app.dart';
import 'config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  var user = CacheHelper.getData("User");
  String route;
  if (user == null) {
    route = Routes.login;
  } else {
    route = Routes.home;
  }
  runApp(MyApp(route));
}
