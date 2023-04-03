import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:wingman/screens/global_widgets/widgets.dart';

class PhoneNumberInputField extends HookWidget {
  const PhoneNumberInputField({
    Key? key,
    required this.controller,
    required this.name,
    required this.labelText,
    required this.onchanged,
  }) : super(key: key);
  final TextEditingController controller;
  final String name;
  final String labelText;
  final Function(dynamic val) onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldMaterial(
      child: FormBuilderPhoneField(
        onChanged: onchanged,
        controller: controller,
        name: name,
        decoration: formFieldsImputDecorations(
          labelText: labelText,
        ),
        priorityListByIsoCode: const ['IN'],
        defaultSelectedCountryIsoCode: 'IN',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.send,
      ),
    );
  }
}
