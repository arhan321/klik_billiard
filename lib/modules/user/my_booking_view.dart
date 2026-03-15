import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class MyBookingView extends StatelessWidget {
  const MyBookingView({super.key});

  static final List<Map<String, String>> activeBookings = [
    {
      'bookingCode': '#BK-001',
      'date': 'Rabu, 3 Januari 2026',
      'packageName': 'Reguler',
      'duration': '1 Jam (14:00-15:00)',
      'table': 'Meja 2 Lantai 1',
      'bookingStatus': 'Aktif',
      'paymentStatus': 'Sudah Bayar',
    },
  ];

  Widget bookingCard({
    required String bookingCode,
    required String date,
    required String packageName,
    required String duration,
    required String table,
    required String paymentStatus,
    required String bookingStatus,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.16),
            Colors.white.withOpacity(0.10),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookingCode,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          infoRow('Tanggal', date),
          infoRow('Paket', packageName),
          infoRow('Durasi', duration),
          infoRow('Meja', table),
          infoRow('Status Booking', bookingStatus),
          infoRow('Status Pembayaran', paymentStatus),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.orangeAccent.withOpacity(0.25),
                    ),
                  ),
                  child: Text(
                    bookingStatus,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.greenAccent.withOpacity(0.25),
                    ),
                  ),
                  child: Text(
                    paymentStatus,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label : ',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white12),
      ),
      child: const Column(
        children: [
          Icon(Icons.event_busy_outlined, color: Colors.white70, size: 48),
          SizedBox(height: 14),
          Text(
            'Belum ada booking aktif',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Booking yang sudah selesai tidak ditampilkan di halaman ini.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.lightText,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasActiveBooking = activeBookings.isNotEmpty;

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
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Booking Saya',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Cek keterangan booking yang sedang aktif.',
                  style: TextStyle(color: AppColors.lightText, fontSize: 14),
                ),
                const SizedBox(height: 22),
                if (hasActiveBooking)
                  ...activeBookings.map(
                    (item) => bookingCard(
                      bookingCode: item['bookingCode']!,
                      date: item['date']!,
                      packageName: item['packageName']!,
                      duration: item['duration']!,
                      table: item['table']!,
                      bookingStatus: item['bookingStatus']!,
                      paymentStatus: item['paymentStatus']!,
                    ),
                  )
                else
                  emptyState(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
