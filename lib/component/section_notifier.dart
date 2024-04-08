import 'package:flutter_landing_page/sections/section.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'section_notifier.g.dart';

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
class SectionNotifier extends _$SectionNotifier {
  @override
  Section? build() {
    return null;
  }

  void select(Section section) {
    state = section;
  }
}
