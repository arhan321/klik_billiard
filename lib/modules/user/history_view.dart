import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../data/dummy_data.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

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
                    const CircleAvatar(
                      backgroundColor: Colors.white12,
                      child: Icon(Icons.person_outline, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Aldian Alifen !',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'History Booking',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: DummyData.histories.length,
                    itemBuilder: (context, index) {
                      final item = DummyData.histories[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.code,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.date,
                              style: const TextStyle(color: AppColors.white),
                            ),
                            Text(
                              'Jenis paket : ${item.packageName}',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            Text(
                              'Durasi main : ${item.duration}',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            Text(
                              'Meja : ${item.table}',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            Text(
                              'Voucher : ${item.voucher}',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            Text(
                              'Total biaya : ${item.total}',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            Text(
                              'Status : ${item.status}',
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
