import 'package:flutter/material.dart';
import 'package:flutter_landing_page/component/theme_notifier.dart';
import 'package:flutter_landing_page/first_view.dart';
import 'package:flutter_landing_page/header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'component/scroll_notifier/scroll_notifier.dart';
import 'footer.dart';
import 'section/section.dart';
import 'section/section_view.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadApp(
      themeMode: ref.watch(themeNotifierProvider),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: Scaffold(
        appBar: const Header(),
        body: SingleChildScrollView(
          controller: ref.watch(
            scrollNotifierProvider.select((s) => s.controller),
          ),
          child: Column(
            children: [
              const FirstView(),
              for (final section in Section.values)
                SectionView(section: section),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
