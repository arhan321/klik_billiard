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

  bool get isTwoHoursPackage => selectedPackageIndex == 1;
  bool get isRegularPackage => selectedPackageIndex == 0;
  bool get showQuickBookingButton => isRegularPackage;

  String get selectedStartTime => times[selectedTimeIndex];

  String get selectedEndTime {
    if (isTwoHoursPackage) {
      final endIndex = (selectedTimeIndex + 2) % times.length;
      return times[endIndex];
    } else {
      final endIndex = (selectedTimeIndex + 1) % times.length;
      return times[endIndex];
    }
  }

  String get selectedDurationText {
    if (isTwoHoursPackage) {
      return '2 Jam ($selectedStartTime-$selectedEndTime)';
    }
    return '1 Jam ($selectedStartTime-$selectedEndTime)';
  }

  // bool isTimeDisabled(int index) {
  //   if (!isTwoHoursPackage) return false;
  //   return index == times.length - 1;
  // }

  // bool isTimeDisabled(int index) {
  //   return index == times.length - 1;
  // }

  bool isTimeDisabled(int index) {
    final lastIndex = times.length - 1; // 04:00
    final secondLastIndex = times.length - 2; // 03:00

    if (index == lastIndex) {
      return true;
    }

    if (isTwoHoursPackage && index == secondLastIndex) {
      return true;
    }

    return false;
  }

  Widget dateChip(
    String day,
    String date, {
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.secondary.withOpacity(0.85)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Text(
              day,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
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
        constraints: const BoxConstraints(minWidth: 110),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.secondary.withOpacity(0.85)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24),
          boxShadow: selected
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
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
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
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: disabled
              ? Colors.white10
              : selected
              ? AppColors.secondary.withOpacity(0.85)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: disabled ? Colors.white12 : Colors.white24),
          boxShadow: selected
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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.secondary.withOpacity(0.85)
              : Colors.white10,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: available ? Colors.white24 : Colors.white12,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.table_restaurant, color: Colors.white, size: 22),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              status,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(22),
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
          style: const TextStyle(color: AppColors.white, fontSize: 12),
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

  Widget lockedDurationInfo() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.90),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.06))),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: CustomButton(
            text: 'Selanjutnya',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.bookingDetail);
            },
          ),
        ),
      ),
    );
  }

  Widget floorSection({
    required String title,
    required List<Map<String, dynamic>> tables,
    required int startIndex,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              itemCount: tables.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (context, index) {
                final table = tables[index];
                final globalIndex = startIndex + index;
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
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allTables = [...floor1Tables, ...floor2Tables];

    if (isTwoHoursPackage && selectedTimeIndex == times.length - 1) {
      selectedTimeIndex = times.length - 2;
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/foto_biliard.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(color: AppColors.primaryDark.withOpacity(0.74)),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 110),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark.withOpacity(0.90),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(34),
                              topRight: Radius.circular(34),
                            ),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.08),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 22, 18, 120),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                    if (showQuickBookingButton)
                                      smallTopButton(context),
                                  ],
                                ),
                                const SizedBox(height: 22),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Pilih Tanggal/Hari :',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    monthDropdown(),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(dateItems.length, (
                                      index,
                                    ) {
                                      final item = dateItems[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
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
                                    statusLegend(
                                      label: 'Unavailable',
                                      selected: false,
                                    ),
                                    const SizedBox(width: 24),
                                    statusLegend(
                                      label: 'Dipilih',
                                      selected: true,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Pilih Paket Main :',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: List.generate(packageItems.length, (
                                    index,
                                  ) {
                                    return packageChip(
                                      packageItems[index],
                                      selected: selectedPackageIndex == index,
                                      onTap: () {
                                        setState(() {
                                          selectedPackageIndex = index;
                                          if (isTwoHoursPackage &&
                                              selectedTimeIndex ==
                                                  times.length - 1) {
                                            selectedTimeIndex =
                                                times.length - 2;
                                          }
                                        });
                                      },
                                    );
                                  }),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Mulai Main :',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(times.length, (
                                      index,
                                    ) {
                                      final disabled = isTimeDisabled(index);
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
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
                                lockedDurationInfo(),
                                const SizedBox(height: 24),
                                const Text(
                                  'Pilih Meja :',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    floorSection(
                                      title: 'Lantai 1',
                                      tables: floor1Tables,
                                      startIndex: 0,
                                    ),
                                    const SizedBox(width: 12),
                                    floorSection(
                                      title: 'Lantai 2',
                                      tables: floor2Tables,
                                      startIndex: floor1Tables.length,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withOpacity(0.90),
                    border: Border(
                      top: BorderSide(color: Colors.white.withOpacity(0.06)),
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                      child: CustomButton(
                        text: 'Selanjutnya',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.bookingDetail);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
