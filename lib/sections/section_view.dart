import 'package:flutter/material.dart';
import 'package:flutter_landing_page/component/size_listener.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SectionView extends StatefulWidget {
  const SectionView({super.key, required this.color});

  final Color color;

  @override
  State<SectionView> createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  double height = 0;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ColoredBox(
          color: widget.color,
          child: SizedBox(
            width: double.infinity,
            height: height,
          ),
        ),
        SizeListener(
          onSizeChanged: (Size size) {
            setState(() {
              height = size.height;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  Text(
                    'Section Title',
                    style: theme.textTheme.h2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: 100,
                      child: Divider(thickness: 1, color: Colors.white),
                    ),
                  ),
                  const Gap(60),
                  Center(
                    child: Text(
                      // ignore: lines_longer_than_80_chars
                      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: theme.textTheme.p,
                    ),
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
