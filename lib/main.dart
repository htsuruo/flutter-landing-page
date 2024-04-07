import 'package:flutter/material.dart';
import 'package:flutter_lp_playground/first_view.dart';
import 'package:flutter_lp_playground/header.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'footer.dart';
import 'sections/section.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: const Scaffold(
        appBar: Header(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FirstView(),
              Section(color: Colors.red),
              Section(color: Colors.black),
              Section(color: Colors.blue),
              Section(color: Colors.green),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
