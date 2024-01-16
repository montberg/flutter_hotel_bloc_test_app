
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/blue_button.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/card.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/peculiarities/peculiarities_group.dart';
import 'package:flutter_hotel_test_app/reusable_widgets/photo_carousel.dart';

import '../../reusable_widgets/price_text.dart';

class RoomCard extends StatelessWidget {
  final String name;
  final int price;
  final String priceForIt;
  final List<String> peculiarities;
  final List<String> imageUrls;
  final Function()? onPressed;


  const RoomCard(
      {super.key,
      required this.name,
      required this.price,
      required this.priceForIt,
      required this.peculiarities,
      required this.imageUrls,
      required this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    
    return BackgroundCardWidget(
      child: SizedBox(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          PhotoCarousel(urls: imageUrls),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 22),
                ),
                const SizedBox(
                  height: 8,
                ),
                PeculiaritiesGroup(
                  tags: peculiarities,
                ),
                const SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff0D72FF).withOpacity(0.1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.min, children: [
                          Text("Подробнее о номере",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff0D72FF),
                                  fontWeight: FontWeight.w500)),
                                  CupertinoListTileChevron()
                        ]),
                      )),
                ),
                //SizedBox(
                //    width: 192,
                //    height: 29,
                //    child: CupertinoListTile(
                //      title: Text(
                //        "heh",
                //        style: TextStyle(
                //            fontSize: 16,
                //            color: Color(0xff0D72FF),
                //            fontWeight: FontWeight.w500),
                //      ),
                //      onTap: () {},
                //      trailing: CupertinoListTileChevron(),
                //      backgroundColor: const Color(0xff0D72FF).withOpacity(0.1),
                //    )),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PriceText(price),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(priceForIt,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff828796),
                            height: 2.3)),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                BlueButton(text: "Выбрать номер", onPressed: onPressed),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
