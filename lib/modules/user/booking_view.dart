import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../shared/widgets/custom_button.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  Widget chip(String text, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? AppColors.secondary : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.white, fontSize: 12),
      ),
    );
  }

  Widget tableCard(String title, String status, {bool selected = false}) {
    return Container(
      width: 78,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected ? AppColors.secondary : Colors.white10,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          const Icon(Icons.table_restaurant, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
          const SizedBox(height: 4),
          Text(
            status,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.lightText, fontSize: 10),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dates = ['Senin\n1', 'Selasa\n2', 'Rabu\n3', 'Kamis\n4', 'Jumat\n5'];
    final times = ['13:00', '14:00', '15:00', '16:00', '17:00'];

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Booking',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Pilih Tanggal / Hari :',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(dates.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: chip(dates[index], selected: index == 1),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Paket Main :',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    chip('Reguler'),
                    const SizedBox(width: 8),
                    chip('Paket 2 Jam', selected: true),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Mulai Main :',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(times.length, (index) {
                    return chip(times[index], selected: index == 1);
                  }),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Meja :',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Lantai 1',
                  style: TextStyle(color: AppColors.lightText, fontSize: 15),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    tableCard('Meja 1', 'Terbooking'),
                    tableCard('Meja 2', 'Dipilih', selected: true),
                    tableCard('Meja 3', 'Kosong'),
                    tableCard('Meja 4', 'Kosong'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lantai 2',
                  style: TextStyle(color: AppColors.lightText, fontSize: 15),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    tableCard('Meja 5', 'Terbooking'),
                    tableCard('Meja 6', 'Kosong'),
                    tableCard('Meja 7', 'Kosong'),
                  ],
                ),
                const SizedBox(height: 28),
                CustomButton(
                  text: 'Booking Cepat !',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.bookingDetail);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
