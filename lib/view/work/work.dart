import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Work extends StatelessWidget {
  const Work({super.key});

  static const _items = <_WorkItem>[
    _WorkItem(
      number: '01',
      title: 'OpenHBYS',
      description:
          'An open hospital information management system designed with a physician’s perspective, covering clinical workflows through a modular architecture and a transparent public roadmap.',
      technologies: ['ASP.NET Core', 'PostgreSQL', 'Vue.js', 'HealthTech'],
      url:
          'https://www.linkedin.com/feed/update/urn:li:activity:7453134322540134401/',
    ),
    _WorkItem(
      number: '02',
      title: 'TYT-AYT Cep Notları',
      description:
          'A free, ad-free exam study application published for iOS after reaching more than 238,000 downloads on Google Play.',
      technologies: ['Flutter', 'iOS', 'Android', 'EdTech'],
      url:
          'https://apps.apple.com/tr/app/tyt-ayt-cep-notlar%C4%B1/id6741572084',
    ),
    _WorkItem(
      number: '03',
      title: 'Diyesis',
      description:
          'A free nutrition platform that brings dietitian content management and food information tools together in one product.',
      technologies: ['Product', 'Nutrition', 'Web', 'HealthTech'],
      url: 'https://diyesis.com/',
    ),
    _WorkItem(
      number: '04',
      title: 'revolki AI Phone Assistant',
      description:
          'An AI-assisted ordering concept created for revolki, showing how businesses can automate incoming phone orders around the clock.',
      technologies: ['AI', 'Voice', 'Automation', 'Workflows'],
      url:
          'https://www.linkedin.com/feed/update/urn:li:activity:7389007025139068928/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenType = AppClass().getScreenType(context);
    final horizontalPadding = screenType == ScreenType.mobile ? 36.0 : 24.0;

    return Semantics(
      container: true,
      label: 'Selected work',
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: AppClass().getMqHeight(context) - 70,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            screenType == ScreenType.mobile ? 72 : 96,
            horizontalPadding,
            88,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle(isMobile: screenType == ScreenType.mobile),
              const SizedBox(height: 44),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth < 650
                      ? 1
                      : constraints.maxWidth < 1050
                          ? 2
                          : 3;
                  const gap = 18.0;
                  final cardWidth =
                      (constraints.maxWidth - (columns - 1) * gap) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: _items
                        .map((item) => _WorkCard(item: item, width: cardWidth))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: '03.',
            style: TextStyle(
              color: AppColors().neonColor,
              fontSize: isMobile ? 17 : 20,
              fontFamily: 'sfmono',
            ),
            children: [
              TextSpan(
                text: ' Selected Work',
                style: GoogleFonts.robotoSlab(
                  color: AppColors().textColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: isMobile ? 24 : 28,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: .5,
            color: AppColors().textLight.withValues(alpha: .65),
          ),
        ),
      ],
    );
  }
}

class _WorkCard extends StatefulWidget {
  const _WorkCard({required this.item, required this.width});

  final _WorkItem item;
  final double width;

  @override
  State<_WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<_WorkCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Semantics(
      button: item.url != null,
      label: item.url == null ? item.title : '${item.title}, open project',
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: widget.width,
          height: 330,
          transform: Matrix4.translationValues(0, isHovered ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: isHovered
                ? AppColors().cardColor.withValues(alpha: .98)
                : AppColors().cardColor.withValues(alpha: .78),
            border: Border.all(
              color: isHovered
                  ? AppColors().neonColor.withValues(alpha: .62)
                  : AppColors().textLight.withValues(alpha: .18),
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .24),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : null,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap:
                item.url == null ? null : () => launchUrl(Uri.parse(item.url!)),
            child: Padding(
              padding: const EdgeInsets.all(26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.number,
                        style: TextStyle(
                          color: AppColors().neonColor,
                          fontFamily: 'sfmono',
                          fontSize: 13,
                        ),
                      ),
                      Icon(
                        item.url == null
                            ? Icons.lock_outline
                            : Icons.north_east,
                        size: 20,
                        color: isHovered
                            ? AppColors().neonColor
                            : AppColors().textLight,
                      ),
                    ],
                  ),
                  const SizedBox(height: 42),
                  Text(
                    item.title,
                    style: GoogleFonts.robotoSlab(
                      color: AppColors().textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.description,
                    style: GoogleFonts.roboto(
                      color: AppColors().textLight,
                      height: 1.55,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: item.technologies
                        .map(
                          (technology) => Text(
                            technology,
                            style: TextStyle(
                              color: AppColors().textColor,
                              fontFamily: 'sfmono',
                              fontSize: 11,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkItem {
  const _WorkItem({
    required this.number,
    required this.title,
    required this.description,
    required this.technologies,
    this.url,
  });

  final String number;
  final String title;
  final String description;
  final List<String> technologies;
  final String? url;
}
