import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/routes/my_router.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Tascom App',
          theme: MyThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRouter().generateRoute,
          initialRoute: MyRoutes.login,
        );
      },
    );
  }
}
