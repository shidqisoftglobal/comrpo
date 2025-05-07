import 'package:compro/const.dart';
import 'package:compro/desktop/components/dialog_benefits.dart';
import 'package:compro/desktop/pages/about_us_page.dart';
import 'package:compro/desktop/pages/contact_page.dart';
import 'package:compro/desktop/pages/product_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  int selectedIndexdesktop = 0;
  Widget? currentDisplayDesktop = ProductPage();

  void changeDisplayDesktopBody(Widget content, int index) {
    setState(() {
      currentDisplayDesktop = content;
      selectedIndexdesktop = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // mediquerry untuk lebar width nya
    final widthDesktop = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          color: tertiaryColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Text(
                    "S H I D Q I   T E X T I L E",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    changeDisplayDesktopBody(ProductPage(), 1);
                  },
                ),

                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        changeDisplayDesktopBody(AboutUsPage(), 3);
                      },
                      child: Text(
                        "Tentang Kami",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        changeDisplayDesktopBody(BenefitsPage(), 2);
                      },
                      child: Text(
                        "Benefits",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        changeDisplayDesktopBody(ProductPage(), 1);
                      },
                      child: Text(
                        "Produk",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        changeDisplayDesktopBody(ContactPage(), 4);
                      },
                      child: Text(
                        "Kontak",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: widthDesktop * 0.15,
                  color: bgColor,
                  child: CupertinoSearchTextField(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: currentDisplayDesktop,
        ),
      ),
    );
  }
}
