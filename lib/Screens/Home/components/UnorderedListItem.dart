import 'package:flutter/material.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:sizer/sizer.dart';

class UnorderedList extends StatelessWidget {
  UnorderedList(this.texts);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "• ",
          style: TextStyle(
              fontSize: 10.sp,
              fontFamily: 'ClashDisplay-Light',
              color: HealthMateColors.dryGreen),
        ),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}
