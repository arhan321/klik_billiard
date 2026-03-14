import '../models/booking_model.dart';
import '../models/tournament_model.dart';
import '../models/voucher_model.dart';

class DummyData {
  static List<VoucherModel> vouchers = [
    VoucherModel(
      title: 'JANUARI BAHAGIA',
      subtitle: 'Berlaku selama bulan Januari 2026',
      code: 'JANHAPPY',
    ),
    VoucherModel(
      title: 'NEW USER',
      subtitle: 'Diskon khusus pengguna baru',
      code: 'NEWKLIK',
    ),
  ];

  static List<TournamentModel> tournaments = [
    TournamentModel(
      title: 'Tiba-Tiba Fun Game',
      date: '30 Januari 2026',
      prize: 'Rp1.100.000',
      image: 'assets/images/fungame.jpg',
      description: 'Fun game mingguan untuk kategori 3B, 3A, dan 4SB.',
    ),
    TournamentModel(
      title: 'Home Tournament Klik',
      date: 'Minggu, 14 Desember 2025 | 13.00 WIB',
      prize: 'Rp6.400.000',
      image: 'assets/images/home_tournament.jpg',
      description:
          'HC 3B, 3A, dan 4SB. Biaya registrasi 120K + rokok LA, slot terbatas 64 pemain.',
    ),
  ];

  static List<BookingModel> histories = [
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
}
