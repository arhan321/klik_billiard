import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../shared/widgets/custom_button.dart';

class QuickBookingView extends StatelessWidget {
  const QuickBookingView({super.key});

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

  @override
  Widget build(BuildContext context) {
    final dates = ['Senin\n1', 'Selasa\n2', 'Rabu\n3', 'Kamis\n4', 'Jumat\n5'];
    final times = ['13:00', '15:00', '16:00', '17:00'];

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
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Booking Cepat !',
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
                    'Informasi : Meja otomatis dipilih oleh sistem terbaik',
                    style: TextStyle(color: AppColors.lightText, fontSize: 15),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, color: Colors.white54, size: 44),
                    ),
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    text: 'Selanjutnya',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.bookingDetailQuick,
                      );
                    },
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
