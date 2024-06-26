import 'package:flutter/material.dart';
import 'package:flutter_landing_page/component/component.dart';
import 'package:flutter_landing_page/section/section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'const.dart';

class Header extends ConsumerWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktopLarger =
        ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 80,
      title: MaxWidthBox(
        maxWidth: Layout.maxWidth,
        child: Row(
          children: [
            const _AppLogo(),
            const Spacer(),
            if (isDesktopLarger) const _PageLinks(),
            const ThemeSwitchButton(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);

  static double get height => const Header().preferredSize.height;
}

class _AppLogo extends ConsumerWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoFile = ShadTheme.of(context).brightness.isDark
        ? 'assets/logo_dark.svg'
        : 'assets/logo_light.svg';
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: WebsafeSvg.asset(logoFile, height: 32),
        onTap: () {
          ref.read(scrollNotifierProvider.notifier).scrollTop();
        },
      ),
    );
  }
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
