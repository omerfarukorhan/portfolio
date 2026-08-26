import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:portfolio/view/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const ProviderScope(child: AppTheme()));
  if (kIsWeb) {
    SemanticsBinding.instance.ensureSemantics();
  }
}

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ömer Faruk Orhan — Software Developer & MD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors().primaryColor,
        scaffoldBackgroundColor: AppColors().primaryColor,
        colorScheme: ColorScheme.dark(
          primary: AppColors().neonColor,
          surface: AppColors().cardColor,
        ),
      ),
      home: const RootScreen(),
    );
  }
}

// DEPLOY COMMANDS
// flutter build web --web-renderer html --base-href /
// firebase deploy --only hosting

// ## FOR FIREBASE SSL ERROR ##
// Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
