import 'package:flutter/material.dart';
import 'package:flutter_landing_page/component/component.dart';
import 'package:flutter_landing_page/section/section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../const.dart';

class SectionView extends ConsumerStatefulWidget {
  const SectionView({super.key, required this.section});

  final Section section;

  @override
  ConsumerState<SectionView> createState() => _SectionViewState();
}

class _SectionViewState extends ConsumerState<SectionView> {
  late final _key = GlobalObjectKey(widget.section.index);
  double _height = 0;

  @override
  void initState() {
    super.initState();

    // スクロール用にSectionの座標を取得
    // TODO(htsuruo): 初回ロード時にセクションの座標を取得しているため
    // ウィンドウサイズを手動で変更した場合に正しい位置にスクロールされない問題がある
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _key.currentContext!.findRenderObject()! as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      ref.read(scrollNotifierProvider.notifier).updateSectionPosition(
            section: widget.section,
            dy: position.dy,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Stack(
      key: _key,
      alignment: Alignment.topCenter,
      children: [
        ColoredBox(
          color: theme.colorScheme.background,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: _height,
          ),
        ),
        SizeListener(
          onSizeChanged: (Size size) {
            setState(() {
              _height = size.height;
            });
          },
          child: MaxWidthBox(
            maxWidth: Layout.maxWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Section Title',
                    style: theme.textTheme.h2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: 100,
                      child: Divider(thickness: 1, color: Colors.white),
                    ),
                  ),
                  const Gap(60),
                  Center(
                    child: Text(
                      // ignore: lines_longer_than_80_chars
                      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: theme.textTheme.p,
                    ),
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
