// ignore_for_file: avoid_print

import 'package:url_launcher/url_launcher.dart';

// Fungsi untuk membuka WhatsApp di Web
Future<void> openWhatsApp(String phoneNumber, String message) async {
  final Uri whatsappUrl = Uri.parse(
    "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
  );

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl);
  } else {
    print('Could not launch WhatsApp');
  }
}

// Fungsi untuk membuka email di Web
Future<void> openEmail(String email, String subject, String body) async {
  final Uri emailUrl = Uri(
    scheme: 'mailto',
    path: email,
    query:
        'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
  );

  if (await canLaunchUrl(emailUrl)) {
    await launchUrl(emailUrl);
  } else {
    print('Could not launch Email');
  }
}
