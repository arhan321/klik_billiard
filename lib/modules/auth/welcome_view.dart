import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/page_container.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  Widget featureCard(IconData icon, String text) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.softWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 30),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageContainer(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.sports_bar, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'WELCOME TO\nKLIK BILLIARD APPS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  featureCard(Icons.info_outline, 'Informasi\nTournament'),
                  featureCard(Icons.table_restaurant, 'Booking\nTable'),
                  featureCard(Icons.discount, 'Voucher\nDiskon'),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
