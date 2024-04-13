import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'const.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.pink,
      child: const MaxWidthBox(
        maxWidth: Layout.maxWidth,
        child: Center(
          child: Text('Footer'),
        ),
      ),
    );
  }
}
