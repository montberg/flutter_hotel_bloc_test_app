import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../reusable_widgets/peculiarities/peculiarities_group.dart';
import '../../themes/colors.dart';

class HotelAdditionalInfo extends StatelessWidget {
  const HotelAdditionalInfo(
      {super.key, required this.peculiarities, required this.description});
  final List<String> peculiarities;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Об отеле",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10,),
        PeculiaritiesGroup(tags: peculiarities),
        SizedBox(height: 10,),
        Text(
          description,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
        const SizedBox(height: 16,),
        const ListSection()
      ],
    );
  }
}




class ListSection extends StatelessWidget {
  const ListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      margin: EdgeInsets.zero,
      backgroundColor: Colors.white,
      decoration: const BoxDecoration(color: backgroundColor),
      separatorColor: const Color(0xff828796).withOpacity(0.15),
      children: const [
        AddingsListTile(iconPath: "lib/hotel_page/assets/icons/emoji-happy.svg", title: "Удобства", subtitle: "Всё самое необходимое",),
        AddingsListTile(iconPath: "lib/hotel_page/assets/icons/tick-square.svg", title: "Что включено", subtitle: "Всё самое необходимое",),
        AddingsListTile(iconPath: "lib/hotel_page/assets/icons/close-square.svg", title: "Что не включено", subtitle: "Всё самое необходимое",),
      ],
    );
  }
}

class AddingsListTile extends StatelessWidget {
  final String iconPath;
  
  final String title;
  final String subtitle;
  const AddingsListTile({
    super.key, required this.iconPath, required this.title,required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leading: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(subtitle,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff828796))),
          ]),
      trailing: const CupertinoListTileChevron(),
      onTap: () {},
    );
  }
}
