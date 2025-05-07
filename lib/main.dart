import 'package:compro/desktop/desktop_page.dart';
import 'package:compro/desktop/view_models/jumbo_bag_view_model.dart';
import 'package:compro/desktop/view_models/majun_view_model.dart';
import 'package:compro/desktop/view_models/sarung_tangan_view_model.dart';
import 'package:compro/mobile_page.dart';
import 'package:compro/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SHIDI SOFT GLOBAL",
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.grey.shade300,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepOrange,
        ),
      ),
      home: MultiProvider(
        providers: [
          Provider<KainMajunViewModel>(create: (_) => KainMajunViewModel()),
          Provider<JumboBagViewModel>(create: (_) => JumboBagViewModel()),
          Provider<SarungTanganViewModel>(
            create: (_) => SarungTanganViewModel(),
          ),
        ],

        child: ResponsiveLayout(
          mobileScreen: MobilePage(),
          desktopScreen: DesktopPage(),
        ),
      ),
    );
  }
}
