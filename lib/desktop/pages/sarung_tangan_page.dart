import 'package:carousel_slider/carousel_slider.dart';
import 'package:compro/desktop/services/url_launcher.dart';
import 'package:compro/desktop/view_models/sarung_tangan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SarungTanganPage extends StatelessWidget {
  const SarungTanganPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sarungTanganViewModel = Provider.of<SarungTanganViewModel>(context);
    final sarungTangans = sarungTanganViewModel.sarungTangan;

    return ListView.builder(
      itemCount: sarungTangans.length,
      itemBuilder: (context, index) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _product = sarungTangans[index];

        // ignore: no_leading_underscores_for_local_identifiers
        final _imageUrls =
            (_product['imageUrls'] as List<dynamic>?)?.cast<String>() ?? [];

        return Column(
          children: [
            Card(
              elevation: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlayAnimationDuration: Duration(seconds: 3),
                          scrollDirection: Axis.horizontal,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          aspectRatio: 18 / 9,
                          initialPage: 0,
                        ),
                        items:
                            _imageUrls.map((url) {
                              return _buildImageItem(context, url);
                            }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _product['name'] ?? 'Nama Produk',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(_product['description'] ?? 'Deskripsi Produk'),

                          // Tambahkan informasi produk lainnya di sini
                          SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              openWhatsApp(
                                '6285814551949',
                                "Saya mau tau lebih SHIDQI TEXTILE dari website",
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.green, // Warna latar belakang
                              foregroundColor: Colors.white, // Warna teks
                            ),
                            child: Text("Order Via WA"),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              openEmail(
                                'shidqisoftglobal@gmail.com',
                                'Inquiry Product',
                                'Hi SSG, Saya pelanggan barumu.',
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.red, // Warna latar belakang
                              foregroundColor: Colors.white, // Warna teks
                            ),
                            child: Text("Email kami disini"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }

  Widget _buildImageItem(BuildContext context, String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: Text('Gagal memuat gambar'));
        },
      ),
    );
  }
}
