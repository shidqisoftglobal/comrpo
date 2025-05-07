import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileScreen,
    required this.desktopScreen,
  });

  final Widget mobileScreen;
  final Widget desktopScreen;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < 600) {
          return mobileScreen;
        } else {
          return desktopScreen;
        }
      },
    );
  }
}
