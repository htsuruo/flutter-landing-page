import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
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
                  onPressed: () {
                    showShadDialog<void>(
                      context: context,
                      builder: (context) => const ShadDialog.alert(
                        title: Text('Convertion Action is Here!'),
                        content: Text(
                          // ignore: lines_longer_than_80_chars
                          'You can perform any desired processing such as linking to external sites.',
                        ),
                      ),
                    );
                  },
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
