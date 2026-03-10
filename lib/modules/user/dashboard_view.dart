import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  Widget menuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.secondary,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(String title, String subtitle) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.cardDark, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.image, color: Colors.white54, size: 40),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: AppColors.lightText),
          ),
        ],
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person_outline, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Hallo, Aldian Alifen !',
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menuItem(
                      context,
                      icon: Icons.table_restaurant,
                      label: 'Booking\nMeja',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.booking);
                      },
                    ),
                    menuItem(
                      context,
                      icon: Icons.flash_on,
                      label: 'Voucher',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.voucher);
                      },
                    ),
                    menuItem(
                      context,
                      icon: Icons.emoji_events,
                      label: 'Info tournament',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.tournament);
                      },
                    ),
                    menuItem(
                      context,
                      icon: Icons.history,
                      label: 'History Booking',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.history);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                const Text(
                  'Informasi Terkini :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 14),

                SizedBox(
                  height: 185,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      infoCard('Voucher diskon spesial bulan Januari', 'Promo'),
                      infoCard('Home Tournament', 'Event Mingguan'),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Booking Cepat',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Cari meja kosong otomatis\nsesuai jadwal',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.background,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.quickBooking,
                            );
                          },
                          child: const Text('Cek Detail'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
