import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wingman/utils/colors.dart';
import 'package:wingman/utils/font_sizes.dart';

class ElevationButton extends HookConsumerWidget {
  final Icon? icons;
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final String? subTitle;
  final bool isDisabledButton;

  final Function() ontap;
  final Size? minimumSize;
  final double? fontsize;
  const ElevationButton({
    Key? key,
    this.icons,
    this.subTitle,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
    this.isDisabledButton = false,
    required this.ontap,
    this.minimumSize,
    this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textStyle2 = TextStyle(
      fontSize: !kIsWeb ? fontSize16 : fontSize5,
    );

    return ElevatedButton(
      onPressed: isDisabledButton ? null : ontap,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? minimumSize,
        disabledForegroundColor: wingmanWhiteMain,
        disabledBackgroundColor: purpleText.withOpacity(0.4),
        elevation: 0.0,
        textStyle: textStyle2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            100.0.sp,
          ),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Text(
        title,
      ),
    );
  }
}
