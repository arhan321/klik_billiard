import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../models/booking_model.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  static final List<BookingModel> histories = [
    BookingModel(
      code: '#001',
      date: 'Hari/Tanggal : 3 Januari',
      packageName: 'Reguler',
      duration: '1 jam (14:00-15:00)',
      table: 'Meja 2 Lantai 1',
      voucher: 'Januari bahagia',
      total: 'Rp40.000',
      status: 'Sudah Bayar',
    ),
    BookingModel(
      code: '#022',
      date: 'Hari/Tanggal : 3 Januari',
      packageName: 'Paket 2 jam',
      duration: '2 jam (15:00-17:00)',
      table: 'Meja 2 Lantai 1',
      voucher: 'Januari bahagia',
      total: 'Rp70.000',
      status: 'Sudah Bayar',
    ),
  ];

  Widget historyCard({
    required String code,
    required String date,
    required String packageName,
    required String duration,
    required String table,
    required String voucher,
    required String total,
    required String status,
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
            code,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          _historyRow('Hari/Tanggal', date),
          _historyRow('Jenis paket', packageName),
          _historyRow('Durasi main', duration),
          _historyRow('Meja', table),
          _historyRow('Voucher', voucher),
          _historyRow('Total biaya', total),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.14),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.greenAccent.withOpacity(0.25)),
            ),
            child: Text(
              'Status : $status',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _historyRow(String label, String value) {
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
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    44,
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
                        radius: 19,
                        backgroundColor: Colors.white12,
                        child: Icon(Icons.person_outline, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Aldian Alifen !',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'History Booking',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 22),
                  ...histories.map(
                    (item) => historyCard(
                      code: item.code,
                      date: item.date,
                      packageName: item.packageName,
                      duration: item.duration,
                      table: item.table,
                      voucher: item.voucher,
                      total: item.total,
                      status: item.status,
                    ),
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
