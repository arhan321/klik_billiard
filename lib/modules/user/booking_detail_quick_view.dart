import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class BookingDetailQuickView extends StatelessWidget {
  const BookingDetailQuickView({super.key});

  Widget detailField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 185,
        height: 52,
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Button Payment masih dummy')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.softWhite,
            foregroundColor: AppColors.primary,
            elevation: 8,
            shadowColor: Colors.black45,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: const Text(
            'Payment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget separatorLine() {
    return Container(
      width: 210,
      height: 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryDark, AppColors.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const Spacer(),
                      const Text(
                        'Rabu 3 Januari',
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Detail Booking',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  detailField('Atas nama :', 'Aldian Alifen'),
                  detailField('Pilih Paket Main :', 'Reguler'),
                  detailField('Detail durasi main :', '1 Jam (14:00-15:00)'),
                  detailField('Meja :', 'Meja 2 Lantai 1'),
                  detailField('Voucher diskon :', 'Januari Bahagia'),
                  detailField('Total biaya :', 'Rp40.000'),
                  const SizedBox(height: 8),
                  const Text(
                    'Datang ke tempat sesuai jam yang di tentukan !\n'
                    'jangan sampai telat jika telat dari jadwal di atas\n'
                    'maka status booking akan hangus !',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  separatorLine(),
                  const SizedBox(height: 14),
                  const Text(
                    'Jika sudah bayar tunjukan bukti\n'
                    'pada halaman histori ke kasir ya!',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 28),
                  paymentButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
