import 'package:flutter/material.dart';
import 'package:flutter_landing_page/const.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: MaxWidthBox(
        maxWidth: Layout.maxWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      size: ShadButtonSize.lg,
                      onPressed: () {
                        showShadDialog<void>(
                          context: context,
                          builder: (context) => ShadDialog.alert(
                            title: const Text('Conversion Action is Here!'),
                            content: Text(
                              // ignore: lines_longer_than_80_chars
                              'You can perform any desired processing such as linking to external sites.',
                              style: ShadTheme.of(context).textTheme.p,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
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
      ),
    );
  }
}
