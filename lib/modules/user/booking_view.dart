import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../shared/widgets/custom_button.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  String selectedMonth = 'Januari';
  int selectedDateIndex = 1;
  int selectedPackageIndex = 0;
  int selectedTimeIndex = 1;
  int selectedTableIndex = 1;

  final List<Map<String, String>> dateItems = [
    {'day': 'Senin', 'date': '1'},
    {'day': 'Selasa', 'date': '2'},
    {'day': 'Rabu', 'date': '3'},
    {'day': 'Kamis', 'date': '4'},
    {'day': 'Jumat', 'date': '5'},
  ];

  final List<String> packageItems = ['Reguler', 'Paket 2 Jam'];
  final List<String> times = ['13:00', '14:00', '15:00', '16:00', '17:00'];

  final List<Map<String, dynamic>> floor1Tables = [
    {'title': 'Meja 1', 'status': 'Terbooking', 'available': false},
    {'title': 'Meja 2', 'status': 'Dipilih', 'available': true},
    {'title': 'Meja 3', 'status': 'Kosong', 'available': true},
    {'title': 'Meja 4', 'status': 'Kosong', 'available': true},
  ];

  final List<Map<String, dynamic>> floor2Tables = [
    {'title': 'Meja 5', 'status': 'Terbooking', 'available': false},
    {'title': 'Meja 6', 'status': 'Kosong', 'available': true},
    {'title': 'Meja 7', 'status': 'Kosong', 'available': true},
  ];

  Widget dateChip(
    String day,
    String date, {
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  Widget packageChip(
    String text, {
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  Widget timeChip(
    String text, {
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  Widget tableCard(
    String title,
    String status, {
    required bool selected,
    required bool available,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: available ? onTap : null,
      child: Container(
        width: 78,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? AppColors.secondary : Colors.white10,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: available ? Colors.white24 : Colors.white12,
          ),
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

  Widget monthDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.06),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedMonth,
          dropdownColor: AppColors.cardDark,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          style: const TextStyle(color: Colors.white, fontSize: 14),
          items: months.map((month) {
            return DropdownMenuItem<String>(
              value: month,
              child: Text(month, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedMonth = value;
              });
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allTables = [...floor1Tables, ...floor2Tables];

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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                        children: [
                          const Expanded(
                            child: Text(
                              'Pilih Tanggal / Hari :',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          monthDropdown(),
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
                                selected: selectedDateIndex == index,
                                onTap: () {
                                  setState(() {
                                    selectedDateIndex = index;
                                  });
                                },
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
                        children: List.generate(packageItems.length, (index) {
                          return packageChip(
                            packageItems[index],
                            selected: selectedPackageIndex == index,
                            onTap: () {
                              setState(() {
                                selectedPackageIndex = index;
                              });
                            },
                          );
                        }),
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
                          return timeChip(
                            times[index],
                            selected: selectedTimeIndex == index,
                            onTap: () {
                              setState(() {
                                selectedTimeIndex = index;
                              });
                            },
                          );
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
                        style: TextStyle(
                          color: AppColors.lightText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(floor1Tables.length, (index) {
                          final table = floor1Tables[index];
                          final globalIndex = index;
                          return tableCard(
                            table['title'],
                            selectedTableIndex == globalIndex
                                ? 'Dipilih'
                                : table['status'],
                            selected: selectedTableIndex == globalIndex,
                            available: table['available'],
                            onTap: () {
                              setState(() {
                                selectedTableIndex = globalIndex;
                              });
                            },
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Lantai 2',
                        style: TextStyle(
                          color: AppColors.lightText,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(floor2Tables.length, (index) {
                          final table = floor2Tables[index];
                          final globalIndex = floor1Tables.length + index;
                          return tableCard(
                            table['title'],
                            selectedTableIndex == globalIndex
                                ? 'Dipilih'
                                : table['status'],
                            selected: selectedTableIndex == globalIndex,
                            available: table['available'],
                            onTap: () {
                              setState(() {
                                selectedTableIndex = globalIndex;
                              });
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.08),
                  border: Border(
                    top: BorderSide(color: Colors.white.withOpacity(0.08)),
                  ),
                ),
                child: CustomButton(
                  text: 'Selanjutnya',
                  onPressed: () {
                    final selectedDay = dateItems[selectedDateIndex];
                    final selectedPackage = packageItems[selectedPackageIndex];
                    final selectedTime = times[selectedTimeIndex];
                    final selectedTable =
                        allTables[selectedTableIndex]['title'] as String;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Dipilih: ${selectedDay['day']} ${selectedDay['date']} $selectedMonth | $selectedPackage | $selectedTime | $selectedTable',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
