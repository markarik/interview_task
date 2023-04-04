import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wingman/screens/auth/sign_in_sign_up.dart';

void main() => runApp(ProviderScope(child: MyApp()));

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  var title = "Login";

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primarySwatch: Colors.blue,
            ),
            title: title,
            debugShowCheckedModeBanner: false,
            home: const SignInSignUpPage(),
          );
        });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
