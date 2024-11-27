import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/responsive.dart';
import 'package:flutter_dashboard/features/dashboard/widgets/sidebar_section_widget.dart';

import '../../contact/widgets/contacts_section_widget.dart';
import '../widgets/header_section_widget.dart';
import '../widgets/sidebar_mobile_section.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = '/dashboard';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isSm(context) ? const MobileSidebarSection() : null,
      
      appBar: isSm(context)
          ? const PreferredSize(
              preferredSize: Size(double.infinity, 70),
              child: HeaderSectionContentWidget())
          : null,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            if (!isSm(context)) const SidebarSectionWidget(),
            Expanded(
                child: Column(
              children: [
                if (!isSm(context)) const HeaderSectionWidget(),
                const Expanded(child: ContactSectionWidget()),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
