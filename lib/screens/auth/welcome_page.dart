import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wingman/provider/otp_request_provider.dart';
import 'package:wingman/screens/global_widgets/text_form_field_widget.dart';
import 'package:wingman/screens/global_widgets/wingman_elevated_button.dart';
import 'package:wingman/utils/colors.dart';
import 'package:wingman/utils/font_sizes.dart';
import 'package:wingman/utils/textstyle.dart';

GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

class WelcomeSignUpPage extends HookConsumerWidget {
  final bool isChangePasswordOrPhone;
  const WelcomeSignUpPage({super.key, this.isChangePasswordOrPhone = false});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
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
                              Container(
                                margin: EdgeInsets.only(
                                  top: 6.h,
                                  bottom: 8.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Welcome",
                                        style: textSmallBold14.copyWith(
                                            color: purpleText2,
                                            fontSize: fontSize24),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 6.h,
                                  bottom: 18.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Looks like you are new here. Tell us a bit about yourself.",
                                        style: textSmallBold14.copyWith(
                                            color: purpleText2,
                                            fontSize: fontSize14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WingManTextFormField(
                                    controller: nameController,
                                    validators: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(),
                                      ],
                                    ),
                                    name: 'name',
                                    labelText: 'Name',
                                    onchanged: (val) {},
                                    textInputType: TextInputType.text,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  WingManTextFormField(
                                    controller: emailController,
                                    name: 'email',
                                    labelText: 'E-mail',
                                    onchanged: (val) {},
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 56.h,
                                  bottom: 58.h,
                                ),
                                child: ElevationButton(
                                  isDisabledButton: false,
                                  ontap: () {
                                    if (formKey.currentState
                                            ?.saveAndValidate() ??
                                        false) {
                                      ref
                                          .read(otpVerifyProvider.notifier)
                                          .submitData(
                                            context: context,
                                            name: formKey
                                                .currentState!.value['name'],
                                            email: formKey
                                                .currentState!.value['email'],
                                          );
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         const EnterCodeSent(),
                                      //   ),
                                      // );
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
