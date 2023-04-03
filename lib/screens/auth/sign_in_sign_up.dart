import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wingman/provider/otp_request_provider.dart';
import 'package:wingman/screens/global_widgets/phonenumber_input_field_widget.dart';
import 'package:wingman/screens/global_widgets/widgets.dart';
import 'package:wingman/screens/global_widgets/wingman_elevated_button.dart';
import 'package:wingman/utils/colors.dart';
import 'package:wingman/utils/font_sizes.dart';
import 'package:wingman/utils/textstyle.dart';

GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

class SignInSignUpPage extends HookConsumerWidget {
  final bool isChangePasswordOrPhone;
  const SignInSignUpPage({super.key, this.isChangePasswordOrPhone = false});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final isLoadingOtp = ref.watch(getOTPProviderLoader);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: wingmanWhiteMain,
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 90.h,
                      ),
                      child: FormBuilder(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.all(18.0.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              logoSection(),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 36.h,
                                  bottom: 38.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Get Started",
                                        style: textSmallBold14.copyWith(
                                            color: purpleText2,
                                            fontSize: fontSize18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              PhoneNumberInputField(
                                controller: phoneController,
                                name: 'phone_number',
                                labelText: 'Phone Number',
                                onchanged: (val) {},
                                
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 56.h,
                                  bottom: 58.h,
                                ),
                                child: ElevationButton(
                                  isDisabledButton: isLoadingOtp ? true : false,
                                  ontap: () {
                                    if (formKey.currentState
                                            ?.saveAndValidate() ??
                                        false) {
                                     
                                      ref.read(getOtpProvider.notifier).getOtp(
                                            context: context,
                                            phoneNumber:formKey
                                          .currentState!.value['phone_number'],
                                          );
                                    } else {
                                      debugPrint(formKey.currentState?.value
                                          .toString());
                                      debugPrint('validation failed');
                                    }
                                  },
                                  title: "Continue",
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
              );
            },
          ),
        ),
      ),
    );
  }
}
