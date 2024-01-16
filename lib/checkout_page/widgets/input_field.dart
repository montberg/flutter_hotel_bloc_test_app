import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.inputFormatters,
    this.textCapitalization,
    this.focus,
    this.onChange,
    required this.validator,
    required this.validateFunc,
    required this.formKey,
    //required this.hasError
    //this.onTap
  });
  //final bool? hasError;
  final String? Function(String?)? validator;
  final String? label;
  final void Function(String?)? onChange;
  final FocusNode? focus;
  final TextCapitalization? textCapitalization;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool Function(String value) validateFunc;
  final GlobalKey<FormFieldState> formKey;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  //final TextEditingController controller2 = TextEditingController();

  //final void Function()? onTap;
  final Color noErrorColor = const Color(0xffF6F6F9);

  final Color errorColor = const Color(0xffEB5757);

  late var currentColor;

 

  @override
  void initState() {
    currentColor = noErrorColor;

    //WidgetsBinding.instance
    //.addPostFrameCallback((_) => );

    super.initState();
  }




  //late Color currentColor;
  @override
  Widget build(BuildContext context) {
    Random r = Random();
    var name = r.nextInt(100000).toString();
    print(name);
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: (widget.validateFunc(widget.controller.text)) ? noErrorColor : errorColor.withOpacity(0.15),
      child: SizedBox(
          //height: 52,
          child: TextFormField(
            key: widget.formKey,
            controller: widget.controller,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            focusNode: widget.focus,
            //onTap: widget.onTap,
            //onChanged:widget.onChange,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: widget.inputFormatters,
            onChanged: (text) {
              setState(() {

              });

            },

            keyboardType: widget.keyboardType,
            //controller: controller2,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400),
            decoration: InputDecoration(            
                errorStyle: TextStyle(height: 0.001, color: Colors.transparent),
                border:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                labelStyle: const TextStyle(
                    color: Color(0xffA9ABB7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                floatingLabelStyle: const TextStyle(
                    color: Color(0xffA9ABB7),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                    contentPadding: EdgeInsets.all(16),
                label: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(widget.label ?? ""),
                ),
                
                isDense: true,
                isCollapsed: true,
                alignLabelWithHint: false),
                
          )),
    );
  }
}
