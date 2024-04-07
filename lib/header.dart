import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
          PageLinks(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;

  static double get height => const Header().preferredSize.height;
}

class PageLinks extends StatelessWidget {
  const PageLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShadButton.link(
          text: const Text('Section 1'),
          onPressed: () {},
        ),
        ShadButton.link(
          text: const Text('Section 2'),
          onPressed: () {},
        ),
        ShadButton.link(
          text: const Text('Section 3'),
          onPressed: () {},
        ),
        ShadButton.link(
          text: const Text('Section 4'),
          onPressed: () {},
        ),
      ],
    );
  }
}
