import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../shared/widgets/custom_button.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  Widget dateChip(String day, String date, {bool selected = false}) {
    return Container(
      width: 56,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: selected ? AppColors.secondary : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          Text(
            day,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.white, fontSize: 11),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget packageChip(String text, {bool selected = false}) {
    return Container(
      constraints: const BoxConstraints(minWidth: 74),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? AppColors.secondary : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget timeChip(String text, {bool selected = false}) {
    return Container(
      width: 56,
      padding: const EdgeInsets.symmetric(vertical: 10),
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

  Widget smallTopButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.quickBooking);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white70),
        ),
        child: const Text(
          'Booking Cepat!',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget statusLegend({required String label, required bool selected}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: selected ? AppColors.secondary : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.white38),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(color: AppColors.lightText, fontSize: 11),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateItems = [
      {'day': 'Senin', 'date': '1'},
      {'day': 'Selasa', 'date': '2'},
      {'day': 'Rabu', 'date': '3'},
      {'day': 'Kamis', 'date': '4'},
      {'day': 'Jumat', 'date': '5'},
    ];

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Text(
                          'Booking',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      smallTopButton(context),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Pilih Tanggal / Hari :',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        'January',
                        style: TextStyle(color: AppColors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(dateItems.length, (index) {
                        final item = dateItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: dateChip(
                            item['day']!,
                            item['date']!,
                            selected: index == 1,
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      statusLegend(label: 'Unavailable', selected: false),
                      const SizedBox(width: 20),
                      statusLegend(label: 'Dipilih', selected: true),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Pilih Paket Main :',
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      packageChip('Reguler', selected: true),
                      packageChip('Paket 2 Jam'),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Mulai Main :',
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(times.length, (index) {
                      return timeChip(times[index], selected: index == 1);
                    }),
                  ),
                  const SizedBox(height: 22),
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
                    text: 'Selanjutnya',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Tombol Selanjutnya masih dummy'),
                        ),
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
