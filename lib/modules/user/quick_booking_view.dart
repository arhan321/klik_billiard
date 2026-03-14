import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../shared/widgets/custom_button.dart';

class QuickBookingView extends StatefulWidget {
  const QuickBookingView({super.key});

  @override
  State<QuickBookingView> createState() => _QuickBookingViewState();
}

class _QuickBookingViewState extends State<QuickBookingView> {
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
  int selectedDate = 2;
  int selectedTimeIndex = 2;

  final List<String> times = [
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
  ];

  bool isTimeDisabled(int index) {
    return index == times.length - 1; // 04:00 selalu dikunci
  }

  Widget dateBox({required String label, required Widget child}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget timeChip(
    String text, {
    required bool selected,
    required bool disabled,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        width: 82,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: disabled
              ? Colors.white10
              : selected
              ? AppColors.secondary.withOpacity(0.90)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: disabled ? Colors.white12 : Colors.white24),
          boxShadow: selected && !disabled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: disabled ? Colors.white38 : AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget infoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi :',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Meja otomatis dipilih oleh sistem terbaik.',
            style: TextStyle(
              color: AppColors.lightText,
              fontSize: 14,
              height: 1.4,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Jam 04:00 tidak tersedia untuk booking cepat.',
            style: TextStyle(
              color: AppColors.lightText,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (selectedTimeIndex == times.length - 1) {
      selectedTimeIndex = times.length - 2;
    }

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
                  const SizedBox(height: 22),

                  const Text(
                    'Pilih Tanggal :',
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      dateBox(
                        label: 'Bulan',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedMonth,
                            dropdownColor: AppColors.cardDark,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            items: months.map((month) {
                              return DropdownMenuItem<String>(
                                value: month,
                                child: Text(
                                  month,
                                  style: const TextStyle(color: Colors.white),
                                ),
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
                      ),
                      const SizedBox(width: 12),
                      dateBox(
                        label: 'Tanggal',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: selectedDate,
                            dropdownColor: AppColors.cardDark,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            items: List.generate(31, (index) {
                              final date = index + 1;
                              return DropdownMenuItem<int>(
                                value: date,
                                child: Text(
                                  '$date',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedDate = value;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Mulai Main :',
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 12),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(times.length, (index) {
                        final disabled = isTimeDisabled(index);
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: timeChip(
                            times[index],
                            selected: selectedTimeIndex == index,
                            disabled: disabled,
                            onTap: () {
                              setState(() {
                                selectedTimeIndex = index;
                              });
                            },
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 20),
                  infoCard(),
                  const SizedBox(height: 18),

                  Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/meja_biliard.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.18),
                            AppColors.primaryDark.withOpacity(0.20),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  CustomButton(
                    text: 'Selanjutnya',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Booking cepat: $selectedDate $selectedMonth | ${times[selectedTimeIndex]}',
                          ),
                        ),
                      );

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
