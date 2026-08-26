import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftPane extends ConsumerWidget {
  const LeftPane({super.key});

  static const _links = [
    _SocialLink(
      keyName: 'git',
      label: 'GitHub',
      asset: 'assets/svg/github.svg',
      url: 'https://github.com/omerfarukorhan/',
    ),
    _SocialLink(
      keyName: 'linkedIn',
      label: 'LinkedIn',
      asset: 'assets/svg/linkedIn.svg',
      url: 'https://www.linkedin.com/in/omerfarukorhan/',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeHover = ref.watch(hoverProvider);

    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _links
                    .map(
                      (link) => SizedBox(
                        height: AppClass().getMqHeight(context) * .07,
                        child: Semantics(
                          link: true,
                          label: 'Open ${link.label}',
                          child: InkWell(
                            onTap: () => launchUrl(
                              Uri.parse(link.url),
                              webOnlyWindowName: '_blank',
                            ),
                            onHover: (hovered) {
                              ref.read(hoverProvider.notifier).state =
                                  hovered ? link.keyName : '';
                            },
                            borderRadius: BorderRadius.circular(6),
                            child: AnimatedPadding(
                              duration: const Duration(milliseconds: 160),
                              padding: EdgeInsets.only(
                                right: 10,
                                bottom: activeHover == link.keyName ? 13 : 8,
                                left: 10,
                                top: activeHover == link.keyName ? 0 : 5,
                              ),
                              child: SvgPicture.asset(
                                link.asset,
                                width: 22,
                                colorFilter: ColorFilter.mode(
                                  activeHover == link.keyName
                                      ? AppColors().neonColor
                                      : AppColors().textColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 1,
              color: AppColors().textColor.withValues(alpha: .75),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLink {
  const _SocialLink({
    required this.keyName,
    required this.label,
    required this.asset,
    required this.url,
  });

  final String keyName;
  final String label;
  final String asset;
  final String url;
}
