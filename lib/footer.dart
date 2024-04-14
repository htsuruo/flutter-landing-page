import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'const.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    // (Icon path, Navigation URL)
    final snsComponents = <(String, String)>[
      ('assets/sns_x_mark.svg', 'https://twitter.com/'),
      ('assets/sns_github_mark.svg', 'https://github.com/'),
      ('assets/sns_discord_mark.svg', 'https://discord.com/'),
    ];

    return Container(
      height: 240,
      width: MediaQuery.sizeOf(context).width,
      color: theme.colorScheme.secondary,
      child: MaxWidthBox(
        maxWidth: Layout.maxWidth,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final sns in snsComponents)
                    _SNSIconButton(
                      filePath: sns.$1,
                      externalLink: sns.$2,
                    ),
                ],
              ),
              const Gap(16),
              const Text(
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
  const _SNSIconButton({required this.filePath, required this.externalLink});

  final String filePath;
  final String externalLink;

  @override
  Widget build(BuildContext context) {
    return ShadButton.outline(
      borderRadius: BorderRadius.circular(12),
      icon: WebsafeSvg.asset(filePath, width: 20),
      size: ShadButtonSize.icon,
      onPressed: () {
        final uri = Uri.tryParse(externalLink);
        if (uri == null) {
          throw Exception('Invalid URL: $externalLink');
        }
        launchUrl(uri);
      },
    );
  }
}
