import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wingman/screens/global_widgets/widgets.dart';
import 'package:wingman/utils/colors.dart';

class WingManTextFormField extends HookWidget {
  const WingManTextFormField({
    Key? key,
    required TextEditingController controller,
    this.validators,
    this.inputFormatters,
    required this.name,
    required this.labelText,
    required this.onchanged,
    required this.textInputType,
    this.isObsecure = false,
    this.suffixIcon,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final String name;
  final String labelText;
  final Function(dynamic val) onchanged;
  final TextInputType textInputType;
  final bool isObsecure;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return WingManTextFormFieldMaterial(
      child: FormBuilderTextField(
        obscureText: isObsecure,
        controller: _controller,
        autovalidateMode: AutovalidateMode.disabled,
        name: name,
        decoration: formFieldsImputDecorations(
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
        onChanged: onchanged,
        validator: validators,
        inputFormatters:
            textInputType == TextInputType.number ? inputFormatters : null,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class WingManTextFormFieldMaterial extends HookWidget {
  const WingManTextFormFieldMaterial({
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
