import 'package:compro/const.dart';
import 'package:compro/desktop/pages/desktop_home_page.dart';
import 'package:compro/desktop/pages/jumbo_bag_page.dart';
import 'package:compro/desktop/pages/kain_majun_page.dart';
import 'package:compro/desktop/pages/sarung_tangan_page.dart';
import 'package:compro/desktop/services/url_launcher.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //methode untuk switch tampilan tanpa merubah appbar
  // ignore: unused_field
  int _selectedIndex = 0;
  Widget _currentDisplay = SarungTanganPage();

  void _changeDisplayContent(Widget content, int index) {
    setState(() {
      _currentDisplay = content;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // mediquerry untuk lebar width nya
    final widthDesktop = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: widthDesktop * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        generateListTile(
                          "SARUNG TANGAN / ST",
                          0,
                          () {
                            _changeDisplayContent(SarungTanganPage(), 0);
                          },
                          Image.asset(
                            'assets/icons/rubber-gloves.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        generateListTile(
                          "KAIN MAJUN / KM",
                          1,
                          () {
                            _changeDisplayContent(KainMajunPage(), 1);
                          },
                          Image.asset(
                            'assets/icons/wipe.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        generateListTile(
                          "JUMBO BAG / BG",
                          2,
                          () {
                            _changeDisplayContent(JumboBagPage(), 2);
                          },
                          Image.asset(
                            'assets/icons/bag.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        generateListTile(
                          "SEMUA PRODUK",
                          3,
                          () {
                            _changeDisplayContent(HomePage(), 3);
                          },
                          Image.asset(
                            'assets/icons/order.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: widthDesktop * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // InkWell(
                            //   child: Image.asset(
                            //     'assets/images/logolengkap.png',
                            //     width: widthDesktop * 0.1,
                            //   ),
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => DesktopPage(),
                            //       ),
                            //     );
                            //   },
                            // ),
                            SizedBox(height: 10),
                            FittedBox(
                              child: Text(
                                "KONTAK KAMI",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                ),
                              ),
                            ),

                            SizedBox(height: 10),
                            ListTile(
                              splashColor: secondaryColor,
                              title: Text("+62 858-1455-1949"),
                              leading: Icon(Icons.wechat),
                              onTap: () {
                                openWhatsApp(
                                  '6285814551949',
                                  'Halo, saya ingin mengetahui lebih jauh produk anda',
                                );
                              },
                            ),
                            ListTile(
                              splashColor: secondaryColor,
                              title: Text("shidqisoftglobal@gmail.com"),
                              leading: Icon(Icons.email),
                              onTap: () {
                                openEmail(
                                  'shidisoftglobal@gmail.com',
                                  'Informasi Produk',
                                  'Hi Ahmad saya ingin mengetahui lebih jauh produk anda',
                                );
                              },
                            ),

                            ListTile(
                              splashColor: secondaryColor,
                              title: Text("Kragilan, Serang, Banten 42184"),
                              leading: Icon(Icons.home),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Expanded(
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: _currentDisplay,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // ini hanya boleh muncul kalo button benefits di klik
        // Expanded(
        //   child: Padding(padding: EdgeInsets.all(15), child: _currentAppBar),
        // ),
      ],
    );
  }

  ListTile generateListTile(
    String title,
    int index,
    VoidCallback onTap,
    Image icon,
  ) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      onTap: onTap,
      hoverColor: primaryColor,
      trailing: icon,
      selected: _selectedIndex == index,
      selectedColor: Colors.black,
      selectedTileColor: Colors.grey,
    );
  }
}
