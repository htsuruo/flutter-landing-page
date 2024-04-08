import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_notifier.g.dart';

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
class ScrollNotifier extends _$ScrollNotifier {
  @override
  ScrollController build() {
    return ScrollController();
  }

  void scroll() {
    state.animateTo(
      state.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
