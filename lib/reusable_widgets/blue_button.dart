import 'package:flutter/cupertino.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({super.key, required this.text, required this.onPressed});

  final Function()? onPressed;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Color(0xff0D72FF),
      borderRadius: BorderRadius.circular(15),
        onPressed: onPressed,
        //style: ButtonStyle(
        //    backgroundColor:
        //        MaterialStateProperty.all<Color>(const Color(0xff0D72FF)),
        //    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //        RoundedRectangleBorder(
        //      borderRadius: BorderRadius.circular(15.0),
        //    ))),
        child:  SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(letterSpacing: 0.1, fontSize: 16, fontWeight: FontWeight.w500),),
            ],
          ),
        ));
  }
}
