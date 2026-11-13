// lib/main.dart
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_colors.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio – Dinny Maria Pical',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkRed,
          primary: AppColors.darkRed,
          secondary: AppColors.lightBlue,
          surface: AppColors.cream,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(),
        scaffoldBackgroundColor: AppColors.cream,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkRed,
          titleTextStyle: GoogleFonts.nunito(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          iconTheme: const IconThemeData(color: AppColors.white),
          elevation: 0,
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      home: const HomePage(),
    );
  }
}
