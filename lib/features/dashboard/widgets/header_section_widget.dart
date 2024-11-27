import 'package:flutter/material.dart';
import 'package:flutter_dashboard/features/share/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/responsive.dart';
import '../../../core/theme.dart';
import '../../contact/widgets/add_edit_contact_popup.dart';

class HeaderSectionWidget extends StatelessWidget {
  const HeaderSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcLightPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const HeaderSectionContentWidget(),
    );
  }
}

class HeaderSectionContentWidget extends StatelessWidget {
  const HeaderSectionContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (isSm(context))
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: kcWhite),
            ),
          ElevatedButton.icon(
            onPressed: () => showAddEditContactPopUp(context),
            // SvgPicture.asset('assets/icons/add.svg', width: 18, height: 18,),
            icon: const Icon(Icons.add_circle_outline, color: kcWhite),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(kcBlue),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              minimumSize: WidgetStateProperty.all<Size>(const Size(150, 50)),
            ),
            label: const TextWidget(
              'Add Contact',
              color: kcWhite,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          if (!isSm(context))
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: kcWhite.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: TextFormField(

                          cursorColor: kcWhite,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search hearse...',
                            hintStyle: textStyle(context, color: kcDarkGreyLight),
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          const Spacer(),
          if (isSm(context))
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/search.svg', width: 18, height: 18),
            ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/notification.svg', width: 18, height: 18),
          ),
        ],
      ),
    );
  }
}
