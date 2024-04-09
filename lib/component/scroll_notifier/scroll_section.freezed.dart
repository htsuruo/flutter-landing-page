// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scroll_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScrollSection {
  ScrollController get controller => throw _privateConstructorUsedError;
  Set<(Section, double)> get sectionPositions =>
      throw _privateConstructorUsedError;
  Section? get selectedSection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScrollSectionCopyWith<ScrollSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollSectionCopyWith<$Res> {
  factory $ScrollSectionCopyWith(
          ScrollSection value, $Res Function(ScrollSection) then) =
      _$ScrollSectionCopyWithImpl<$Res, ScrollSection>;
  @useResult
  $Res call(
      {ScrollController controller,
      Set<(Section, double)> sectionPositions,
      Section? selectedSection});
}

/// @nodoc
class _$ScrollSectionCopyWithImpl<$Res, $Val extends ScrollSection>
    implements $ScrollSectionCopyWith<$Res> {
  _$ScrollSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? sectionPositions = null,
    Object? selectedSection = freezed,
  }) {
    return _then(_value.copyWith(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      sectionPositions: null == sectionPositions
          ? _value.sectionPositions
          : sectionPositions // ignore: cast_nullable_to_non_nullable
              as Set<(Section, double)>,
      selectedSection: freezed == selectedSection
          ? _value.selectedSection
          : selectedSection // ignore: cast_nullable_to_non_nullable
              as Section?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScrollSectionImplCopyWith<$Res>
    implements $ScrollSectionCopyWith<$Res> {
  factory _$$ScrollSectionImplCopyWith(
          _$ScrollSectionImpl value, $Res Function(_$ScrollSectionImpl) then) =
      __$$ScrollSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ScrollController controller,
      Set<(Section, double)> sectionPositions,
      Section? selectedSection});
}

/// @nodoc
class __$$ScrollSectionImplCopyWithImpl<$Res>
    extends _$ScrollSectionCopyWithImpl<$Res, _$ScrollSectionImpl>
    implements _$$ScrollSectionImplCopyWith<$Res> {
  __$$ScrollSectionImplCopyWithImpl(
      _$ScrollSectionImpl _value, $Res Function(_$ScrollSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? sectionPositions = null,
    Object? selectedSection = freezed,
  }) {
    return _then(_$ScrollSectionImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      sectionPositions: null == sectionPositions
          ? _value._sectionPositions
          : sectionPositions // ignore: cast_nullable_to_non_nullable
              as Set<(Section, double)>,
      selectedSection: freezed == selectedSection
          ? _value.selectedSection
          : selectedSection // ignore: cast_nullable_to_non_nullable
              as Section?,
    ));
  }
}

/// @nodoc

class _$ScrollSectionImpl implements _ScrollSection {
  const _$ScrollSectionImpl(
      {required this.controller,
      required final Set<(Section, double)> sectionPositions,
      this.selectedSection})
      : _sectionPositions = sectionPositions;

  @override
  final ScrollController controller;
  final Set<(Section, double)> _sectionPositions;
  @override
  Set<(Section, double)> get sectionPositions {
    if (_sectionPositions is EqualUnmodifiableSetView) return _sectionPositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_sectionPositions);
  }

  @override
  final Section? selectedSection;

  @override
  String toString() {
    return 'ScrollSection(controller: $controller, sectionPositions: $sectionPositions, selectedSection: $selectedSection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollSectionImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            const DeepCollectionEquality()
                .equals(other._sectionPositions, _sectionPositions) &&
            (identical(other.selectedSection, selectedSection) ||
                other.selectedSection == selectedSection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller,
      const DeepCollectionEquality().hash(_sectionPositions), selectedSection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollSectionImplCopyWith<_$ScrollSectionImpl> get copyWith =>
      __$$ScrollSectionImplCopyWithImpl<_$ScrollSectionImpl>(this, _$identity);
}

abstract class _ScrollSection implements ScrollSection {
  const factory _ScrollSection(
      {required final ScrollController controller,
      required final Set<(Section, double)> sectionPositions,
      final Section? selectedSection}) = _$ScrollSectionImpl;

  @override
  ScrollController get controller;
  @override
  Set<(Section, double)> get sectionPositions;
  @override
  Section? get selectedSection;
  @override
  @JsonKey(ignore: true)
  _$$ScrollSectionImplCopyWith<_$ScrollSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
