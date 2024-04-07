import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'header.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - Header.height,
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
            FilledButton(
              onPressed: () {},
              child: const Text('text'),
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
