import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/blue_button.dart';
import '../reusable_widgets/title_widget.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
     Random r = Random();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xffE8E9EC))),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: BlueButton(
              text: "Супер!",
              onPressed: () {
                print("pushed");
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            leading: const CupertinoNavigationBarBackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            title: const TitleWidget(
              title: "Заказ оплачен",
            ),
            backgroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  color: const Color(0xffF6F6F9),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child:
                        Image.asset("lib/success_page/assets/party_popper.png"),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              const Text("Ваш заказ принят в работу", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
              const SizedBox(height: 20,),
              Text(
                  "Подтверждение заказа №${r.nextInt(100000)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.",
                  style: const TextStyle(color: Color(0xff828796), fontWeight: FontWeight.w400, fontSize: 16), textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
 
}
