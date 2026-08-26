import 'package:flutter/material.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key, this.centered = true});

  final bool centered;

  static const links = [
    ('GitHub', 'https://github.com/omerfarukorhan/'),
    ('LinkedIn', 'https://www.linkedin.com/in/omerfarukorhan/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: centered ? WrapAlignment.center : WrapAlignment.start,
      spacing: 14,
      runSpacing: 12,
      children: links
          .map(
            (link) => OutlinedButton(
              onPressed: () => launchUrl(
                Uri.parse(link.$2),
                webOnlyWindowName: '_blank',
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors().neonColor,
                backgroundColor: AppColors().cardColor.withValues(alpha: .82),
                side: BorderSide(
                  color: AppColors().neonColor.withValues(alpha: .72),
                  width: 1.25,
                ),
                minimumSize: const Size(148, 50),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                textStyle: const TextStyle(
                  fontFamily: 'sfmono',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .7,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(link.$1),
                  const SizedBox(width: 10),
                  const Icon(Icons.north_east, size: 17),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
