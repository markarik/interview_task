import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:wingman/provider/otp_request_provider.dart';
import 'package:wingman/screens/global_widgets/widgets.dart';
import 'package:wingman/screens/global_widgets/wingman_elevated_button.dart';
import 'package:wingman/utils/colors.dart';
import 'package:wingman/utils/font_sizes.dart';
import 'package:wingman/utils/textstyle.dart';

final formKey = GlobalKey<FormBuilderState>();

class EnterCodeSent extends HookConsumerWidget {
  final bool isChangePasswordOrPhone;
  final String phoneNumber;
  const EnterCodeSent({
    super.key,
    this.isChangePasswordOrPhone = false,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    const length = 6;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    final defaultPinTheme = PinTheme(
      width: 52.w,
      height: 56.h,
      textStyle: GoogleFonts.poppins(
        fontSize: kIsWeb ? fontSize5 : fontSize22,
        color: purpleText,
      ),
      decoration: BoxDecoration(
        color: purpleTextLight.withOpacity(.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  width: kIsWeb ? 200.0.w : double.infinity,
                  decoration: BoxDecoration(
                      color: colorPurple.withOpacity(
                    .1,
                  )),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: FormBuilder(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.all(18.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              logoSection(context),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 16.h,
                                  bottom: 18.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Enter OTP",
                                        style: textSmallNormal14.copyWith(
                                          fontSize:
                                              kIsWeb ? fontSize10 : fontSize20,
                                          fontWeight: FontWeight.bold,
                                          color: purpleText2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "OTP has been sent to ",
                                        style: textgrowInnerTitleGrowDecimal
                                            .copyWith(
                                          fontSize:
                                              kIsWeb ? fontSize6 : fontSize14,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "+91-$phoneNumber",
                                            style: textSmallBold14.copyWith(
                                              color: purpleText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 36.h,
                                  bottom: 18.h,
                                ),
                                child: Pinput(
                                  length: length,
                                  controller: controller,
                                  focusNode: focusNode,
                                  defaultPinTheme: defaultPinTheme,
                                  pinAnimationType: PinAnimationType.scale,
                                  onCompleted: (pin) {
                                    ref
                                        .read(otpVerifyProvider.notifier)
                                        .verifyAccount(
                                          context: context,
                                          phoneNumber: phoneNumber,
                                          otp: pin,
                                        );
                                  },
                                  onSubmitted: (value) {},
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    width: 52.w,
                                    height: 56.h,
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      border: Border.all(
                                        color: purpleText2,
                                      ),
                                    ),
                                  ),
                                  focusedPinTheme: defaultPinTheme.copyWith(
                                    width: 52.w,
                                    height: 56.h,
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      border: Border.all(
                                        color: purpleText,
                                      ),
                                    ),
                                  ),
                                  errorPinTheme: defaultPinTheme.copyWith(
                                    decoration: BoxDecoration(
                                      color: errorColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              InkWell(
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            text: "Retry ",
                                            style: textSmallBold14.copyWith(
                                              color: purpleText,
                                              fontWeight: FontWeight.w800,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    "(this button send back to first screen. with number entered.)",
                                                style: textSmallBold14.copyWith(
                                                  color: wingmanGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 26.h,
                                  bottom: 18.h,
                                ),
                                child: ElevationButton(
                                  isDisabledButton: false,
                                  ontap: () {
                                    ref
                                        .read(otpVerifyProvider.notifier)
                                        .verifyAccount(
                                          context: context,
                                          phoneNumber: phoneNumber,
                                          otp: controller.text,
                                        );
                                  },
                                  title: "Verify",
                                  minimumSize: const Size.fromHeight(50),
                                  backgroundColor: purpleText,
                                  foregroundColor: iconBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

otpTextButtonSection({required String titles, required Function() ontap}) {
  return InkWell(
    onTap: ontap,
    child: Text(
      titles,
      style: textSmallBold14.copyWith(
        color: purpleText,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
