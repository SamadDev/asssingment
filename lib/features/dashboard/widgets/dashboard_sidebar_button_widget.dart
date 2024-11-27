import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/theme.dart';
import 'package:flutter_dashboard/features/share/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardSidebarButtonWidget extends StatelessWidget {
  final String label;
  final String icon;
  const DashboardSidebarButtonWidget({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: label == 'Contacts' ? kcBlue.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: 25,
              height: 25,
            ),
            const SizedBox(height: 10),
            TextWidget(
              label,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
