import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_notifier.g.dart';

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
class ScrollNotifier extends _$ScrollNotifier {
  @override
  ScrollController build() => ScrollController();

  void scrollTop() => _animateTo(Offset.zero.dy);

  void scroll() => _animateTo(state.position.maxScrollExtent);

  void _animateTo(double offset) => state.animateTo(
        offset,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
}
