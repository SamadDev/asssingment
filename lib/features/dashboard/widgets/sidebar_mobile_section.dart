import 'package:flutter/material.dart';
import 'package:flutter_dashboard/features/dashboard/widgets/sidebar_section_widget.dart';

class MobileSidebarSection extends StatelessWidget {
  const MobileSidebarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SidebarSectionWidget(),
    );
  }
}