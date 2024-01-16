import 'package:flutter/material.dart';

class ShortMainInfoWidget extends StatelessWidget {
  const ShortMainInfoWidget({
    super.key,
    required this.rating,
    required this.ratingName,
    required this.name,
    required this.address,
  });

  final String rating;
  final String ratingName;
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffFFA800).withOpacity(0.2),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.star, color: Color(0xffFFA800)),
                Text("$rating $ratingName",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xffFFA800),
                        fontWeight: FontWeight.w500)),
              ]),
            )),
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: (){},
          child: Text(
            address,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff0D72FF)),
          ),
        ),
      ],
    );
  }
}
