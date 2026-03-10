import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class BookingDetailView extends StatelessWidget {
  const BookingDetailView({super.key});

  Widget field(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: AppColors.white)),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(value, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryDark, AppColors.primary],
              ),
              borderRadius: BorderRadius.circular(26),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Detail Booking',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Rabu 3 januari',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  field('Atas nama :', 'Aldian Alifen'),
                  field('Jenis paket di pilih :', 'Reguler'),
                  field('Detail durasi main :', '1 Jam (14:00-15:00)'),
                  field('Meja :', 'Meja 2 Lantai 1'),
                  field('Voucher diskon', 'Januari Bahagia'),
                  field('Total biaya :', 'Rp40.000'),
                  const SizedBox(height: 10),
                  const Text(
                    'Datang ke tempat sesuai jam yang di tentukan. Jika sudah bayar tunjukan bukti.',
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
