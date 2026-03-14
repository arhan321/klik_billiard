import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../models/tournament_model.dart';

class TournamentView extends StatelessWidget {
  const TournamentView({super.key});

  static final List<TournamentModel> tournaments = [
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
      image: 'assets/images/turnament.jpg',
      description:
          'HC 3B, 3A, & 4SB\n\n'
          'HARI MINGGU 14 DESEMBER 2025 Start 13.00 WIB\n\n'
          '🔥 Prize Pool: 6.400.000\n'
          '🏆 Champion: 3000k + Trophy\n'
          '🥈 Runner Up: 1300k + Trophy\n'
          '🥉 Semifinalis: 650k + Trophy\n'
          '8 besar : 200k\n\n'
          '🎟️ Biaya Registrasi: 120k + Rokok LA\n'
          '🧑‍🤝‍🧑 Slot terbatas hanya 64 pemain!\n\n'
          '📌 Rules 9 Ball | No Break Box | Break bergantian | HC sesuai Klik Billiard\n\n'
          'Fur\n'
          '4SB vs 3A : 1 frame\n'
          '4SB vs 3B : 8 seri\n'
          '3A vs 3B : 1 frame\n\n'
          '📲 Daftar sekarang!\n'
          'CP: 081556513415 (EPPO)\n'
          '089652775973 (ALDIAN)\n\n'
          '📍 Lokasi: Klik Billiard & Café\n'
          '📺 Live on TikTok: @klik.billiard.academy\n\n'
          'Ayo buruan daftar dan rasakan keseruannya! 🔥🎱',
    ),
  ];

  Widget tournamentCard({
    required String title,
    required String date,
    required String prize,
    required String image,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Jadwal : $date',
            style: const TextStyle(color: AppColors.lightText, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(
            'Prize Pool : $prize',
            style: const TextStyle(color: AppColors.lightText, fontSize: 15),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              height: 1.4,
            ),
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Tournament',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ...tournaments.map(
                    (item) => tournamentCard(
                      title: item.title,
                      date: item.date,
                      prize: item.prize,
                      image: item.image,
                      description: item.description,
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
