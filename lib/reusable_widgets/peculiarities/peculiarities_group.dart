import 'package:flutter/material.dart';

import 'tag_widget.dart';

class PeculiaritiesGroup extends StatelessWidget {
  const PeculiaritiesGroup({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
        List<TagWidget> tagWidgets = [];
    for (var element in tags) {
      tagWidgets.add(TagWidget(element));
    }
    return Wrap(
      spacing: 10,
      children: tagWidgets,
    );
  }
}
