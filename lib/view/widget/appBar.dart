import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ActionBar extends ConsumerWidget {
  const ActionBar(this.controller, {super.key});

  final AutoScrollController controller;

  Future<void> _scrollTo(int index) {
    return controller.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(milliseconds: 520),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenType = AppClass().getScreenType(context);
    final compact = screenType != ScreenType.web;

    return Semantics(
      container: true,
      label: 'Primary navigation',
      child: Container(
        height: 74,
        padding:
            EdgeInsets.fromLTRB(compact ? 24 : 44, 18, compact ? 24 : 44, 8),
        child: compact
            ? Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton<int>(
                  tooltip: 'Open navigation menu',
                  color: AppColors().cardColor,
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: AppColors().textLight.withValues(alpha: .2),
                    ),
                  ),
                  onSelected: _scrollTo,
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 1,
                      child:
                          _MenuRow(icon: Icons.person_outline, label: 'About'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: _MenuRow(
                          icon: Icons.work_outline, label: 'Experience'),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: _MenuRow(
                          icon: Icons.grid_view_rounded, label: 'Work'),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child:
                          _MenuRow(icon: Icons.mail_outline, label: 'Contact'),
                    ),
                  ],
                  icon: Icon(
                    Icons.menu_rounded,
                    color: AppColors().textColor,
                    size: 28,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _NavItem(
                    number: '01.',
                    label: 'About',
                    hoverKey: 'aboutTitle',
                    onTap: () => _scrollTo(1),
                  ),
                  _NavItem(
                    number: '02.',
                    label: 'Experience',
                    hoverKey: 'expTitle',
                    onTap: () => _scrollTo(2),
                  ),
                  _NavItem(
                    number: '03.',
                    label: 'Work',
                    hoverKey: 'workTitle',
                    onTap: () => _scrollTo(3),
                  ),
                  _NavItem(
                    number: '04.',
                    label: 'Contact',
                    hoverKey: 'contactTitle',
                    onTap: () => _scrollTo(4),
                  ),
                  const SizedBox(width: 8),
                  Semantics(
                    link: true,
                    label: 'Open résumé',
                    child: OutlinedButton(
                      onPressed: () => AppClass().downloadResume(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors().neonColor,
                        side: BorderSide(color: AppColors().neonColor),
                        minimumSize: const Size(92, 42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 12,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sfmono',
                        ),
                      ),
                      child: const Text('Resume'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(icon, size: 19, color: AppColors().neonColor),
          const SizedBox(width: 14),
          Text(label),
        ],
      ),
    );
  }
}

class _NavItem extends ConsumerWidget {
  const _NavItem({
    required this.number,
    required this.label,
    required this.hoverKey,
    required this.onTap,
  });

  final String number;
  final String label;
  final String hoverKey;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = ref.watch(hoverProvider) == hoverKey;

    return Semantics(
      button: true,
      label: 'Go to $label',
      child: InkWell(
        onTap: onTap,
        onHover: (hovered) {
          ref.read(hoverProvider.notifier).state = hovered ? hoverKey : '';
        },
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Text(
                '$number ',
                style: TextStyle(
                  color: AppColors().neonColor,
                  fontSize: 12,
                  fontFamily: 'sfmono',
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color:
                      isHovered ? AppColors().neonColor : AppColors().textColor,
                  fontSize: 12,
                  fontFamily: 'sfmono',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
