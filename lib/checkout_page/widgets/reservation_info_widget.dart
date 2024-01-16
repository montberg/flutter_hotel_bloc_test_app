// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/card.dart';

class ReservationInfoWidget extends StatelessWidget {
  final String departure;

  final String arrival_country;

  final String date_start;

  final String date_stop;

  final int number_of_nights;

  final String room;

  final String nutrition;
  final String hotel_name;

  const ReservationInfoWidget(
      {super.key,
      required this.departure,
      required this.arrival_country,
      required this.hotel_name,
      required this.date_start,
      required this.date_stop,
      required this.number_of_nights,
      required this.room,
      required this.nutrition});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoRowWidget(leading: "Вылет из", trailing: departure),
        const SizedBox(height: 10,),
        InfoRowWidget(leading: "Страна, город", trailing: arrival_country),
        const SizedBox(height: 10,),
        InfoRowWidget(leading: "Даты", trailing: "$date_start – $date_stop"),
        const SizedBox(height: 10,),
        InfoRowWidget(leading: "Кол-во ночей", trailing: "$number_of_nights ночей"),
        const SizedBox(height: 10,),
        InfoRowWidget(leading: "Отель", trailing: hotel_name),
        const SizedBox(height: 10,),
        InfoRowWidget(leading: "Питание", trailing: nutrition),

      ],
    );
  }
}

class InfoRowWidget extends StatelessWidget {
  const InfoRowWidget({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3,child: Text(leading, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xff828796))),),
        const Spacer(),
        Expanded(flex: 5,child: Text(trailing, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),),
      ],
    );
  }
}
