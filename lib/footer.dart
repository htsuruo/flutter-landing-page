import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'const.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      height: 240,
      width: MediaQuery.sizeOf(context).width,
      color: theme.colorScheme.secondary,
      child: const MaxWidthBox(
        maxWidth: Layout.maxWidth,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _SNSIconButton(
                    filePath: 'assets/sns_x_mark.svg',
                  ),
                  Gap(16),
                  _SNSIconButton(
                    filePath: 'assets/sns_github_mark.svg',
                  ),
                  Gap(16),
                  _SNSIconButton(
                    filePath: 'assets/sns_discord_mark.svg',
                  ),
                ],
              ),
              Gap(16),
              Text(
                '© 2024 YOUR ORGANIZATION, inc. All rights reserved.',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SNSIconButton extends StatelessWidget {
  // ignore: unused_element
  const _SNSIconButton({required this.filePath, this.onPressed});

  final String filePath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      borderRadius: BorderRadius.circular(12),
      icon: WebsafeSvg.asset(filePath, width: 20),
      size: ShadButtonSize.icon,
      onPressed: onPressed ??
          () {
            showShadDialog<void>(
              context: context,
              builder: (context) => ShadDialog.alert(
                content: Text(
                  'Navigation to External SNS Site',
                  style: ShadTheme.of(context).textTheme.p,
                ),
              ),
            );
          },
    );
  }
}
