import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Untuk tautan eksternal

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Kami',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey[800], // Warna AppBar yang elegan
        elevation: 1,
      ),
      backgroundColor: Colors.grey[100], // Latar belakang lembut
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Bagian Judul dan Pengantar
            Text(
              'Selamat Datang di [Nama Perusahaan Anda]',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
                height: 1.2,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Kami adalah tim yang bersemangat dan berdedikasi untuk [sebutkan misi atau tujuan utama perusahaan Anda]. Dengan pengalaman bertahun-tahun di industri [sebutkan industri Anda], kami berkomitmen untuk memberikan [sebutkan nilai atau produk/layanan unggulan Anda] yang berkualitas tinggi dan inovatif.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.0),

            // Bagian Visi dan Misi
            _buildSectionTitle('Visi Kami'),
            Text(
              '[Sebutkan visi perusahaan Anda secara ringkas dan inspiratif]. Kami bercita-cita untuk [jelaskan lebih lanjut dampak atau tujuan jangka panjang visi Anda].',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 24.0),
            _buildSectionTitle('Misi Kami'),
            Text(
              'Untuk mencapai visi kami, kami berdedikasi untuk:',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildMissionPoint('[Poin misi pertama Anda]'),
                _buildMissionPoint('[Poin misi kedua Anda]'),
                _buildMissionPoint('[Poin misi ketiga Anda]'),
                // Tambahkan poin misi lainnya sesuai kebutuhan
              ],
            ),
            SizedBox(height: 32.0),

            // Bagian Nilai-Nilai Perusahaan
            _buildSectionTitle('Nilai-Nilai Kami'),
            Text(
              'Kami percaya pada prinsip-prinsip yang membimbing setiap tindakan dan keputusan kami:',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 16.0,
              runSpacing: 8.0,
              children: <Widget>[
                _buildValueChip('Integritas'),
                _buildValueChip('Inovasi'),
                _buildValueChip('Kualitas'),
                _buildValueChip('Kerja Sama'),
                _buildValueChip('Kepuasan Pelanggan'),
                // Tambahkan nilai-nilai perusahaan lainnya
              ],
            ),
            SizedBox(height: 32.0),

            // Bagian Tim Kami (Opsional)
            _buildSectionTitle('Tim Kami'),
            Text(
              'Di balik [Nama Perusahaan Anda], ada tim individu berbakat dan berdedikasi yang bekerja sama untuk mewujudkan visi kami.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (MediaQuery.of(context).size.width > 600) ? 3 : 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8,
              ),
              itemCount: 3, // Ganti dengan jumlah anggota tim Anda
              itemBuilder: (context, index) {
                return _buildTeamMemberCard(
                  name: 'Nama Anggota ${index + 1}',
                  position: 'Jabatan',
                  imageUrl:
                      'URL_FOTO_ANGGOTA_${index + 1}', // Ganti dengan URL foto sebenarnya
                );
              },
            ),
            SizedBox(height: 32.0),

            // Area Widget
            _buildSectionTitle('Lebih Lanjut'),
            Text(
              'Anda mungkin tertarik dengan informasi berikut:',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.0),
            // Contoh Widget: Tautan ke Media Sosial
            _buildWidgetArea(
              title: 'Ikuti Kami',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue[700]),
                    onPressed:
                        () => _launchURL('https://facebook.com/[halaman_anda]'),
                  ),
                  IconButton(
                    icon: Icon(Icons.abc, color: Colors.blue[400]),
                    onPressed:
                        () => _launchURL('https://twitter.com/[akun_anda]'),
                  ),
                  IconButton(
                    icon: Icon(Icons.safety_check, color: Colors.blue[800]),
                    onPressed:
                        () => _launchURL(
                          'https://linkedin.com/company/[perusahaan_anda]',
                        ),
                  ),
                  // Tambahkan ikon media sosial lainnya
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Contoh Widget Lain: Kontak
            _buildWidgetArea(
              title: 'Hubungi Kami',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Email: info@[perusahaan_anda].com',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Telepon: +62 [nomor_telepon_anda]',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8.0),
                  InkWell(
                    child: Text(
                      'Kunjungi Website Kami',
                      style: TextStyle(fontSize: 16.0, color: Colors.blue[500]),
                    ),
                    onTap: () => _launchURL('[URL_WEBSITE_ANDA]'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),

            // Bagian Footer
            Center(
              child: Text(
                '© ${DateTime.now().year} [Nama Perusahaan Anda]. Hak Cipta Dilindungi.',
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
    return Text(
      title,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[800],
      ),
    );
  }

  // Widget pembantu untuk poin misi
  Widget _buildMissionPoint(String point) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_circle_outline,
            color: Colors.blueGrey[600],
            size: 20.0,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              point,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget pembantu untuk nilai-nilai perusahaan (chips)
  Widget _buildValueChip(String value) {
    return Chip(
      label: Text(value, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blueGrey[600],
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    );
  }

  // Widget pembantu untuk kartu anggota tim
  Widget _buildTeamMemberCard({
    required String name,
    required String position,
    required String imageUrl,
  }) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 40.0,
              backgroundImage:
                  // ignore: unnecessary_null_comparison
                  imageUrl != null && imageUrl.isNotEmpty
                      ? NetworkImage(imageUrl)
                      : AssetImage('assets/placeholder_profile.png')
                          as ImageProvider<
                            Object
                          >, // Ganti dengan asset placeholder Anda
            ),
            SizedBox(height: 12.0),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blueGrey[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.0),
            Text(
              position,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Widget area untuk widget-widget lain
  Widget _buildWidgetArea({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[700],
            ),
          ),
          child,
        ],
      ),
    );
  }

  // Fungsi untuk meluncurkan URL eksternal
  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Tidak dapat membuka URL $url';
    }
  }
}
