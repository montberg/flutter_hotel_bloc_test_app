import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  const PriceText(this.price, {super.key, this.leading});

  final String? leading;
  final int price;
  @override
  Widget build(BuildContext context) {
    var empty = "";
    
    String formattedNumber = price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+$)'), (match) => '${leading??empty} ${match[1]} ');

    return Text(formattedNumber, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30, color: Colors.black),);
  }
}