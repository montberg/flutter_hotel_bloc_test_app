// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/card.dart';

class CheckoutPriceWidget extends StatelessWidget {
  final int tour_price;

  final int fuel_charge;

  final int service_charge;

  const CheckoutPriceWidget(
      {super.key,
      required this.tour_price,
      required this.fuel_charge,
      required this.service_charge});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PriceRowWidget(leading: "Тур", trailing: tour_price.toString()),
        const SizedBox(
          height: 16,
        ),
        PriceRowWidget(
            leading: "Топливный сбор", trailing: fuel_charge.toString()),
        const SizedBox(
          height: 16,
        ),
        PriceRowWidget(
            leading: "Сервисный сбор", trailing: service_charge.toString()),
        const SizedBox(
          height: 16,
        ),
        PriceRowWidget(
            leading: "К оплате",
            isFinal: true,
            trailing: (tour_price + fuel_charge + service_charge).toString()),
      ],
    );
  }
}

class PriceRowWidget extends StatelessWidget {
  const PriceRowWidget({
    super.key,
    required this.leading,
    required this.trailing,
    this.isFinal = false
  });
  final bool isFinal;
  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(leading,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff828796))),
        ),
        const Spacer(),
        Text(
          "$trailing ₽",
          style: TextStyle(fontWeight: isFinal ? FontWeight.w500 : FontWeight.w400, fontSize: 16, color: isFinal ? const Color(0xff0D72FF): Colors.black),
        ),
      ],
    );
  }
}
