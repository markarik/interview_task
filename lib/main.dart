import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wingman/screens/auth/sign_in_sign_up.dart';

void main() => runApp( ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  var title = "Login";

   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            title: title,
            debugShowCheckedModeBanner: false,
            home: const SignInSignUpPage(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        });
  }
}
