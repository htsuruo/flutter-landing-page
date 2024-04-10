import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_landing_page/component/scroll_notifier/scroll_section.dart';
import 'package:flutter_landing_page/header.dart';
import 'package:flutter_landing_page/section/section.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_notifier.g.dart';

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
class ScrollNotifier extends _$ScrollNotifier {
  @override
  ScrollSection build() => ScrollSection(
        controller: ScrollController(),
        sectionPositions: Section.values.map((s) => (s, 0.0)).toSet(),
      );

  void scrollTop() => _animateTo(Offset.zero.dy);

  void selectSection(Section section) {
    final sectionPosition = _getSection(section).$2 - Header.height;
    final maxPosition = state.controller.position.maxScrollExtent;
    // maxScrollExtentを超えないようにminで制限
    _animateTo(min(sectionPosition, maxPosition));
  }

  void updateSectionPosition({required Section section, required double dy}) {
    state = state.copyWith(
      sectionPositions: {
        ...state.sectionPositions.where((e) => e.$1 != section),
        (_getSection(section).$1, dy),
      },
    );
  }

  (Section, double) _getSection(Section section) =>
      state.sectionPositions.firstWhere((e) => e.$1 == section);

  void _animateTo(double offset) => state.controller.animateTo(
        offset,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
}
