import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wingman/models/otp_reponse.dart';
import 'package:wingman/models/otp_verify.dart';
import 'package:wingman/screens/auth/enter_code_sent.dart';
import 'package:wingman/screens/auth/welcome_page.dart';
import 'package:wingman/screens/home/home.dart';
import 'package:wingman/utils/constants/dio_client.dart';

final getOTPProviderLoader = StateProvider((ref) => false);
final submitingProviderLoader = StateProvider((ref) => false);

final getOtpProvider = StateNotifierProvider<OTPClass, OtPresponse>(
  (ref) => OTPClass(
    ref,
  ),
);

class OTPClass extends StateNotifier<OtPresponse> {
  Ref ref;

  OTPClass(this.ref, [OtPresponse? state])
      : super(
          state ?? OtPresponse(),
        );

  getOtp({required BuildContext context, required phoneNumber}) async {
    ref.read(getOTPProviderLoader.notifier).state = true;

    var myUrl = 'https://test-otp-api.7474224.xyz/sendotp.php';

    Response? res;
    var data = {
      "mobile": phoneNumber.substring(3),
    };
    try {
      res = await DioClient().post(
        myUrl,
        data: data,
      );
    } on DioError catch (ex) {
      ref.read(getOTPProviderLoader.notifier).state = false;
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }

    if (res.statusCode != 200) {
      throw Exception('Can\'t load OTP');
    }

    var accountList = OtPresponse.fromJson(json.decode(res.data));
    ref.read(getOTPProviderLoader.notifier).state = false;

    if (accountList.status!) {
      var snackBar = SnackBar(content: Text(accountList.response!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              EnterCodeSent(phoneNumber: phoneNumber.substring(3)),
        ),
      );
    }

    state = accountList;
  }
}

final otpVerifyProvider = StateNotifierProvider<OTPVerifyClass, OtpVerify>(
  (ref) => OTPVerifyClass(
    ref,
  ),
);

class OTPVerifyClass extends StateNotifier<OtpVerify> {
  Ref ref;

  OTPVerifyClass(this.ref, [OtpVerify? state])
      : super(
          state ?? OtpVerify(),
        );

  verifyAccount(
      {required BuildContext context,
      required phoneNumber,
      required String otp}) async {
    var myUrl = 'https://test-otp-api.7474224.xyz/verifyotp.php';

    Response? res;

    var data = {
      "request_id": phoneNumber,
      "code": otp,
    };
    try {
      res = await DioClient().post(
        myUrl,
        data: data,
      );
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex);
    }

    if (res.statusCode != 200) {
      throw Exception('Can\'t load OTP');
    }
    var datas = json.decode(res.data);

    if (!datas['status']) {
      var snackBar = SnackBar(content: Text(datas['response']));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var accountList = OtpVerify.fromJson(json.decode(res.data));

      state = accountList;
      if (!accountList.profileExists!) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WelcomeSignUpPage(),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    }
  }

  submitData(
      {required BuildContext context,
      required name,
      required String email}) async {
    ref.read(submitingProviderLoader.notifier).state = true;

    var myUrl = 'https://test-otp-api.7474224.xyz/profilesubmit.php';

    Response? res;

    var data = {
      "name": name,
      "email": email,
    };
    try {
      res = await DioClient().postToken(
        myUrl,
        data: data,
        token: state.jwt!,
      );
    } on DioError catch (ex) {
      ref.read(submitingProviderLoader.notifier).state = false;

      if (ex.type == DioErrorType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex);
    }

    if (res.statusCode != 200) {
      ref.read(submitingProviderLoader.notifier).state = false;

      throw Exception('Can\'t load OTP');
    }

    ref.read(submitingProviderLoader.notifier).state = false;

    var accountList = json.decode(res.data);

    var snackBar = SnackBar(content: Text(accountList['response']));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (accountList['status']) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }
}
