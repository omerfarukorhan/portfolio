import 'package:flutter/widgets.dart';
import 'package:portfolio/resource/appClass.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobileView,
    required this.tabView,
    required this.webView,
  });

  final Widget mobileView;
  final Widget tabView;
  final Widget webView;

  @override
  Widget build(BuildContext context) {
    switch (AppClass().getScreenType(context)) {
      case ScreenType.mobile:
        return mobileView;
      case ScreenType.tab:
        return tabView;
      case ScreenType.web:
        return webView;
    }
  }
}
