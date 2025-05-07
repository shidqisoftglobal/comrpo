// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class BenefitsPage extends StatelessWidget {
  const BenefitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Judul Utama
            Text(
              'Rasakan Manfaat Terbaik dengan [Nama Produk/Layanan/Perusahaan Anda]',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            Text(
              'Kami berkomitmen untuk memberikan nilai lebih kepada Anda. Berikut adalah berbagai keuntungan yang dapat Anda nikmati:',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),

            // Daftar Keuntungan Utama
            _buildSectionTitle('Keuntungan Utama'),
            _buildBenefitItem(
              icon: Icons.check_circle_outline,
              title: '[Keuntungan 1: Deskriptif dan Menarik]',
              description:
                  '[Penjelasan singkat mengenai keuntungan pertama. Jelaskan bagaimana ini memecahkan masalah atau memberikan nilai bagi pengguna.]',
            ),
            _buildBenefitItem(
              icon: Icons.bolt,
              title: '[Keuntungan 2: Sorot Keunggulan]',
              description:
                  '[Penjelasan singkat mengenai keuntungan kedua. Fokus pada apa yang membuat produk/layanan Anda unggul.]',
            ),
            _buildBenefitItem(
              icon: Icons.savings,
              title: '[Keuntungan 3: Manfaat Finansial/Efisiensi]',
              description:
                  '[Penjelasan singkat mengenai keuntungan ketiga. Tekankan aspek penghematan biaya atau peningkatan efisiensi.]',
            ),
            // Tambahkan lebih banyak keuntungan utama di sini
            SizedBox(height: 32.0),

            // Keuntungan Tambahan (Opsional - bisa dalam bentuk grid atau list)
            _buildSectionTitle('Keuntungan Tambahan'),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: (MediaQuery.of(context).size.width > 600) ? 3 : 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.2,
              children: <Widget>[
                _buildAdditionalBenefitCard(
                  icon: Icons.star_border,
                  title: '[Fitur/Keuntungan A]',
                  description: '[Deskripsi singkat]',
                ),
                _buildAdditionalBenefitCard(
                  icon: Icons.settings,
                  title: '[Fitur/Keuntungan B]',
                  description: '[Deskripsi singkat]',
                ),
                _buildAdditionalBenefitCard(
                  icon: Icons.support_agent,
                  title: '[Dukungan Terbaik]',
                  description: '[Deskripsi singkat]',
                ),
                _buildAdditionalBenefitCard(
                  icon: Icons.update,
                  title: '[Pembaruan Berkala]',
                  description: '[Deskripsi singkat]',
                ),
                // Tambahkan kartu keuntungan tambahan lainnya
              ],
            ),
            SizedBox(height: 32.0),

            // Testimoni Pengguna (Opsional)
            _buildSectionTitle('Apa Kata Pengguna Kami'),
            _buildTestimonialCard(
              name: '[Nama Pengguna 1]',
              quote:
                  '"[Kutipan testimoni yang positif dan relevan dengan keuntungan yang ditawarkan.]"',
              image: 'URL_FOTO_PENGGUNA_1', // Ganti dengan URL foto
            ),
            SizedBox(height: 16.0),
            _buildTestimonialCard(
              name: '[Nama Pengguna 2]',
              quote:
                  '"[Kutipan testimoni positif lainnya yang menyoroti keuntungan yang berbeda.]"',
              image: 'URL_FOTO_PENGGUNA_2', // Ganti dengan URL foto
            ),
            SizedBox(height: 32.0),

            // Call to Action (CTA)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Siap Merasakan Keuntungannya?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol ditekan (misalnya, navigasi ke halaman pendaftaran/kontak)
                      print('Tombol CTA Ditekan');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[700],
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 16.0,
                      ),
                      textStyle: TextStyle(fontSize: 18.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Mulai Sekarang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),

            // Footer
            Center(
              child: Text(
                '© ${DateTime.now().year} [Nama Perusahaan Anda]. Semua Hak Dilindungi.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk judul bagian
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.teal[800],
        ),
      ),
    );
  }

  // Widget pembantu untuk item keuntungan utama
  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: Colors.teal[600], size: 32.0),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget pembantu untuk kartu keuntungan tambahan
  Widget _buildAdditionalBenefitCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.teal[600], size: 40.0),
            SizedBox(height: 12.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],

                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk kartu testimoni
  Widget _buildTestimonialCard({
    required String name,
    required String quote,
    String? image,
  }) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 24.0,
                  backgroundImage:
                      image != null && image.isNotEmpty
                          ? NetworkImage(image)
                          : AssetImage('assets/placeholder_user.png')
                              as ImageProvider<
                                Object
                              >?, // Ganti dengan asset placeholder Anda
                ),
                SizedBox(width: 12.0),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
              quote,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[800],
                fontStyle: FontStyle.italic,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
