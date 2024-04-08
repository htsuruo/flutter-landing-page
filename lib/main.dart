import 'package:flutter/material.dart';
import 'package:flutter_lp_playground/first_view.dart';
import 'package:flutter_lp_playground/header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'component/scroll_notifier.dart';
import 'footer.dart';
import 'sections/section_view.dart';

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
          controller: ref.watch(scrollNotifierProvider),
          child: const Column(
            children: [
              FirstView(),
              SectionView(color: Colors.red),
              SectionView(color: Colors.black),
              SectionView(color: Colors.blue),
              SectionView(color: Colors.green),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
