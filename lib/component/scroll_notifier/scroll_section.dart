import 'package:flutter/material.dart';
import 'package:flutter_landing_page/section/section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scroll_section.freezed.dart';

@freezed
class ScrollSection with _$ScrollSection {
  const factory ScrollSection({
    required ScrollController controller,
    required Set<(Section, double)> sectionPositions,
    Section? selectedSection,
  }) = _ScrollSection;
}
