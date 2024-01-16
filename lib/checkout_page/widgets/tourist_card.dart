import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'input_field.dart';

class TouristCard extends StatefulWidget {
  const TouristCard(
      {super.key,
      required this.cardName,
      required this.nameController,
      required this.surnameController,
      required this.birthdayController,
      required this.countryController,
      required this.passportNumberController,
      required this.passportDateController,
      required this.nameKey,
      required this.surnameKey,
      required this.birthdayKey,
      required this.countryKey,

      required this.passportKey,
      required this.passportDateKey});
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController birthdayController;
  final TextEditingController countryController;
  final TextEditingController passportNumberController;
  final TextEditingController passportDateController;
  final String cardName;
  final GlobalKey<FormFieldState> nameKey;
  final GlobalKey<FormFieldState> surnameKey;
  final GlobalKey<FormFieldState> birthdayKey;
  final GlobalKey<FormFieldState> countryKey;

  final GlobalKey<FormFieldState> passportKey;
  final GlobalKey<FormFieldState> passportDateKey;
  @override
  State<TouristCard> createState() => _TouristCardState();
}

class _TouristCardState extends State<TouristCard> {
  bool isValid = false;

  bool _checkForEmptyness(String value) {
    return value.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        maintainState: true,
        title: Text(
          widget.cardName,
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
        ),
        children: [
          InputField(
            formKey: widget.nameKey,
            onChange: (text) {
              //BlocProvider.of<TouristValidationBloc>(context).add(NameChanged(name: text!));
            },
            textCapitalization: TextCapitalization.words,
            controller: widget.nameController,
            validateFunc: _checkForEmptyness,
            validator: validator,
            label: 'Имя',
            //controller: emailController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
            formKey: widget.surnameKey,
            textCapitalization: TextCapitalization.words,
            validateFunc: _checkForEmptyness,
            validator: validator,
            controller: widget.surnameController,
            label: 'Фамилия',
            //controller: emailController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
            formKey: widget.birthdayKey,
            //focus: AlwaysDisabledFocusNode(),
            controller: widget.birthdayController,
            //validator: _checkForEmptyness,
            validator: validator,
            label: 'Дата рождения', keyboardType: TextInputType.datetime,
            inputFormatters: [
              MaskTextInputFormatter(
                  mask: '##.##.####',
                  // filter: {"#": RegExp(r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$')},
                  type: MaskAutoCompletionType.lazy)
            ],
            validateFunc: _checkForEmptyness,
            //controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
            formKey: widget.countryKey,
            textCapitalization: TextCapitalization.words,
            validateFunc: _checkForEmptyness,
            validator: validator,
            controller: widget.countryController,
            label: 'Гражданство',
            //controller: emailController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
            formKey: widget.passportKey,
            validateFunc: _checkForEmptyness,
            validator: validator,
            controller: widget.passportNumberController,
            label: 'Номер загранпаспорта',
            //controller: emailController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
            formKey: widget.passportDateKey,
            //focus: AlwaysDisabledFocusNode(),
            controller: widget.passportDateController,

            inputFormatters: [
              MaskTextInputFormatter(
                  mask: '##.##.####',
                  //filter: {"#": RegExp(r'^(?:(?:1[6-9]|[2-9]\d)?\d{2})(?:(?:(\/|-|\.)(?:0?[13578]|1[02])\1(?:31))|(?:(\/|-|\.)(?:0?[13-9]|1[0-2])\2(?:29|30)))$|^(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(\/|-|\.)0?2\3(?:29)$|^(?:(?:1[6-9]|[2-9]\d)?\d{2})(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:0?[1-9]|1\d|2[0-8])$')},
                  type: MaskAutoCompletionType.eager)
            ],
            //  onTap: () async {
            //    _showDialog(
            //        CupertinoDatePicker(
            //          initialDateTime: DateTime.now(),
            //          mode: CupertinoDatePickerMode.date,
            //          use24hFormat: true,
            //          onDateTimeChanged: (DateTime newDate) {
            //            setState(() => _pasportExpirationDate.text =
            //                DateFormat('dd.MM.yyyy').format(newDate));
            //          },
            //        ),
            //        context);
            //    //DateTime? pickDate = await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime.now(), initialDate: DateTime.now());
            //    //if(pickDate!=null){
            //    //  setState(() {
            //    //    _date.text = DateFormat('dd-MM-yyyy').format(pickDate);
            //    //  });
            //    //}
            //  },
            validateFunc: _checkForEmptyness,
            validator: validator,
            label: 'Срок действия загранпаспорта',
            keyboardType: TextInputType.datetime,
            // inputFormatters: [
            //   MaskTextInputFormatter(
            //       mask: '##.##.####',
            //      // filter: {"#": RegExp(r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$')},
            //       type: MaskAutoCompletionType.lazy)
            // ],
            //controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  String? validator(val) {
    if (val.isNotEmpty) return null;
    return "Не может быть пустым";
  }
}
