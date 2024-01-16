import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hotel_test_app/checkout_page/extensions/email_validator_extension.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'input_field.dart';










class ByuerInfoWidget extends StatefulWidget {
  const ByuerInfoWidget({Key? key, required this.phoneNumberController, required this.emailController, required this.emailKey, required this.phoneKey,}) : super(key: key);
  
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;

  final GlobalKey<FormFieldState<dynamic>> emailKey;
  final GlobalKey<FormFieldState<dynamic>> phoneKey;
  @override
  State<ByuerInfoWidget> createState() => _ByuerInfoWidgetState();
}

class _ByuerInfoWidgetState extends State<ByuerInfoWidget> {


  var phoneNumberMaskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy
      );

  bool _validatePhoneNumber(String value) {
    return value.replaceAll(RegExp(r'[^0-9]'), '').length == 11;
  }

  bool _validateEmail(String value) {
    
    return value.isValidEmail();
  }

  @override
  void initState() {
  
    super.initState();
  }
  //final emailBloc = FieldValidationBloc();
  //final phoneBloc = FieldValidationBloc();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Информация о покупателе",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        InputField(
          formKey: widget.phoneKey,
          validateFunc: _validatePhoneNumber,
          //onChange: (text){
          //  phoneBloc.add(TextChangedEvent(text: text!));
          //},
          validator: (val) {
            if (_validatePhoneNumber(val!)) {
              return null;
            } else {
              return "error";
            }
          },
          label: 'Номер телефона',
          controller: widget.phoneNumberController,
          keyboardType: TextInputType.phone,
          inputFormatters: [phoneNumberMaskFormatter],
        ),
        const SizedBox(
          height: 10,
        ),
        InputField(
          formKey: widget.emailKey,
          validateFunc: _validateEmail,
          validator: (val) {
            if (_validateEmail(val!)) {
              return null;
            } else {
              return "null";
            }
          },
          label: 'Электронная почта',
          controller: widget.emailController,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту",
          style: TextStyle(
              color: Color(0xff828796),
              fontSize: 14,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
