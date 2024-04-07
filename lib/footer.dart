import 'package:flutter/material.dart';

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
