import 'package:flutter/material.dart';

import '../../../core/responsive.dart';

class TwoWidgetPerRowWidget extends StatelessWidget {
  final Widget firstWidget;
  final Widget secondWidget;
  const TwoWidgetPerRowWidget(
      {super.key, required this.firstWidget, required this.secondWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: isSm(context)
          ? Column(
              children: [
                firstWidget,
                const SizedBox(height: 10),
                secondWidget,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: firstWidget),
                const SizedBox(width: 10),
                Expanded(child: secondWidget),
              ],
            ),
    );
  }
}
