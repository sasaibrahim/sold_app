import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sold_app/config/routes/routes.dart';

class MyApp extends StatelessWidget {
  String route;

  MyApp(this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: route,
        onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
      ),
    );
  }
}
