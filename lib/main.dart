import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EyeCatch(),
            Section(color: Colors.red),
            Section(color: Colors.black),
            Section(color: Colors.blue),
            Section(color: Colors.green),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Row(
        children: [
          Text('Fluter LP Playground'),
          Spacer(),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class EyeCatch extends StatelessWidget {
  const EyeCatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -
          const Header().preferredSize.height,
      color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EyeCatch',
              style: ShadTheme.of(context).textTheme.h1Large.copyWith(
                    fontSize: 100,
                  ),
            ),
            const Gap(16),
            // ShadButton(
            //   text: const Text('Primary'),
            //   size: ShadButtonSize.lg,
            //   onPressed: () {},
            // ),
            ShadButton(
              size: ShadButtonSize.lg,
              onPressed: () {},
              gradient: const LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.indigo,
                ],
              ),
              shadows: [
                BoxShadow(
                  color: Colors.blue.withOpacity(.4),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
              text: const Text('Get your ticket'),
            ),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2;
    return ColoredBox(
      color: color,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: const Center(
          child: Text('text'),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      color: Colors.pink,
      child: const Center(
        child: Text('Footer'),
      ),
    );
  }
}
