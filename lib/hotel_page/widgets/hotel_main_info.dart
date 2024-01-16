import 'package:flutter/material.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/price_text.dart';

import '../../reusable_widgets/short_main_info.dart';

class HotelMainInfo extends StatelessWidget {
  const HotelMainInfo(
      {super.key,
      required this.name,
      required this.address,
      required this.price,
      required this.priceForIt,
      required this.rating,
      required this.ratingName});
      
  final String name;
  final String address;
  final String price;
  final String priceForIt;
  final String rating;
  final String ratingName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShortMainInfoWidget(rating: rating, ratingName: ratingName, name: name, address: address),
        const SizedBox(
          height: 14,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PriceText(
              int.parse(price),
              leading: "от",
            ),
            const SizedBox(
              width: 4,
            ),
            Text("$priceForIt",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff828796),
                    height: 2.3)),
          ],
        ),
        const SizedBox(
          height: 16,
        )
      ],
    ));
  }
}

