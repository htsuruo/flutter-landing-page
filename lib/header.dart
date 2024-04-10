import 'package:flutter/material.dart';
import 'package:flutter_landing_page/component/theme_notifier.dart';
import 'package:flutter_landing_page/section/section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'component/scroll_notifier/scroll_notifier.dart';

class Header extends ConsumerWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 80,
      elevation: 0,
      title: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: WebsafeSvg.asset('assets/logo.svg', height: 32),
              onTap: () {
                ref.read(scrollNotifierProvider.notifier).scrollTop();
              },
            ),
          ),
          const Spacer(),
          const _PageLinks(),
          const ThemeSwitchButton(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);

  static double get height => const Header().preferredSize.height;
}

class _PageLinks extends ConsumerWidget {
  const _PageLinks();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        for (final section in Section.values)
          ShadButton.link(
            text: Text(section.name),
            onPressed: () {
              ref.read(scrollNotifierProvider.notifier).selectSection(section);
            },
          ),
      ],
    );
  }
}
