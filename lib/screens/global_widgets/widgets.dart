import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wingman/utils/colors.dart';
import 'package:wingman/utils/textstyle.dart';

class TextFormFieldMaterial extends HookWidget {
  const TextFormFieldMaterial({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: textFieldShadow,
      borderRadius: BorderRadius.circular(
        15.0.r,
      ),
      child: child,
    );
  }
}

InputDecoration formFieldsImputDecorations(
    {required String labelText, IconButton? suffixIcon}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 0.0,
      horizontal: 10.0,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: wingmanWhiteMain,
    filled: true,
    labelText: labelText,
    labelStyle: textSmallBold14.copyWith(
      color: const Color(0xFF868E96),
    ),
    border: InputBorder.none,
    suffixIcon: suffixIcon,
    errorMaxLines: 10,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        15.0.r,
      ),
      borderSide: BorderSide(
        color: textFieldShadow,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        15.0.r,
      ),
      borderSide: BorderSide(
        color: textFieldShadow,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: textFieldShadow,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(
        15.0.r,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: wingmanRed,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(
        15.0.r,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: wingmanRed,
      ),
      borderRadius: BorderRadius.circular(
        15.0.r,
      ),
    ),
  );
}


/// `Row` is a widget that takes a list of widgets and displays them in a row
/// 
/// Returns:
///   A Row widget with a CircleAvatar widget as its child.
 logoSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: pupleSwatch,
        radius: 50.r,
        child: const Text("Logo"),
      ),
    ],
  );
}
