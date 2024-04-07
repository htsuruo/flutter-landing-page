import 'package:flutter/material.dart';

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
