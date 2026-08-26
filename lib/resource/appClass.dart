import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  static const resumePath = 'resume.pdf';

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  double getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  void showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  Future<bool> downloadResume(BuildContext context) {
    return launchUrl(
      Uri.base.resolve(AppClass.resumePath),
      webOnlyWindowName: '_blank',
    );
  }

  // alertDialog(context, title, msg) {
  //   showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //               title: Text(title, style: TxtStyle().boldWhite(context)),
  //               content: Text(msg),
  //               actions: [
  //                 ElevatedButton(
  //                     style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
  //                     onPressed: () => Navigator.pop(context),
  //                     child: Text('Okay'))
  //               ]));
  // }
}
