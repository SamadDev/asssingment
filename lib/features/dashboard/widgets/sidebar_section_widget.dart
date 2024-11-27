import 'package:flutter/material.dart';
import 'package:flutter_dashboard/features/dashboard/widgets/dashboard_sidebar_button_widget.dart';
import 'package:flutter_dashboard/features/share/widgets/text_widget.dart';
import 'package:flutter_dashboard/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/responsive.dart';
import '../../../core/theme.dart';

class SidebarSectionWidget extends StatelessWidget {
  const SidebarSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isSm(context) ? null : const EdgeInsets.all(20),
      width: 130,
      decoration: BoxDecoration(
        color: kcLightPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SvgPicture.asset('assets/logo/logo.svg', height: 60),
          ),
          const Divider(color: kcDarkGrey, height: 0),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(Assets.icons.house, height: 20),
                const TextWidget('Property'),
                const Icon(Icons.arrow_drop_down, color: kcWhite),
              ],
            ),
          ),
          const Spacer(),
          for (Map button in _buttons)
            DashboardSidebarButtonWidget(
              label: button['label'],
              icon: button['icon'],
            ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kcDarkPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_drop_down, color: kcWhite),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.mode, height: 40),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/icons/setting.svg', height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}

const _buttons = [
  {
    'label': 'Dashboard',
    'icon': 'assets/icons/dashboard.svg',
  },
  {
    'label': 'Property',
    'icon': 'assets/icons/house.svg',
  },
  {
    'label': 'Contacts',
    'icon': 'assets/icons/contact.svg',
  }
];
