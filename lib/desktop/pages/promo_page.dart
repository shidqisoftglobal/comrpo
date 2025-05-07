import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  final String promoImage =
      'https://via.placeholder.com/600x300'; // Ganti dengan URL gambar promo Anda
  final String promoTitle = 'Penawaran Spesial Akhir Tahun!';
  final String promoDescription =
      'Jangan lewatkan diskon hingga 50% untuk semua produk pilihan kami. Berlaku hingga 31 Desember 2023.';
  final String promoPeriod = 'Berlaku: 15 November - 31 Desember 2023';
  final String callToAction = 'Belanja Sekarang!';

  // Daftar produk promo (opsional)
  final List<Map<String, String>> promoProducts = [
    {'name': 'Produk A', 'discount': '30%'},
    {'name': 'Produk B', 'discount': '40%'},
    {'name': 'Produk C', 'discount': '50%'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Promo Menarik')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Gambar Promo
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  promoImage,
                  height: 200.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 200.0,
                      child: Center(child: Text('Gambar tidak dapat dimuat')),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Judul Promo
            Text(
              promoTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),

            // Deskripsi Promo
            Text(
              promoDescription,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15.0),

            // Periode Promo
            Text(
              promoPeriod,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25.0),

            // Tombol Aksi
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika aksi tombol di sini (misalnya, navigasi ke halaman produk)
                print('Tombol Belanja Sekarang ditekan!');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                textStyle: const TextStyle(fontSize: 18.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(callToAction),
            ),

            // Daftar Produk Promo (opsional)
            if (promoProducts.isNotEmpty) ...[
              const SizedBox(height: 30.0),
              Text(
                'Produk yang Sedang Promo',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: promoProducts.length,
                itemBuilder: (context, index) {
                  final product = promoProducts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            product['name']!,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Diskon ${product['discount']!}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
            const SizedBox(height: 20.0),
            const Text(
              'Syarat dan Ketentuan Berlaku. Lihat detail lebih lanjut.',
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
