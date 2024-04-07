import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Awesome App',
                  style: ShadTheme.of(context).textTheme.h1Large.copyWith(
                        fontSize: 80,
                      ),
                ),
                const Gap(40),
                ShadButton(
                  text: const Text(
                    'Your Conversion Button is Here!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  size: ShadButtonSize.lg,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 80,
            child: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.navigate_next_outlined,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
