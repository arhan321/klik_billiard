import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
// import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/page_container.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  Widget featureCard({
    required IconData icon,
    required String text,
    double angle = 0,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: 96,
        height: 110,
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.softWhite,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 32),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cueDecoration() {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 8,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
          Positioned(
            top: 38,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.9),
                  width: 2,
                ),
              ),
            ),
          ),
          Positioned(
            left: 28,
            bottom: 8,
            child: Transform.rotate(
              angle: -0.78,
              child: Container(
                width: 200,
                height: 26,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customBottomButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 170,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.softWhite,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.login);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              const SizedBox(height: 42),

              const Center(
                child: Text(
                  'WELCOME TO\nKLIK BILLIARD APPS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                    height: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 34),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  featureCard(
                    icon: Icons.emoji_events_outlined,
                    text: 'Informasi\nTournament',
                    angle: -0.12,
                    margin: const EdgeInsets.only(top: 14),
                  ),
                  const SizedBox(width: 8),
                  featureCard(
                    icon: Icons.table_restaurant,
                    text: 'Booking\nTable',
                    angle: 0,
                  ),
                  const SizedBox(width: 8),
                  featureCard(
                    icon: Icons.discount_outlined,
                    text: 'Voucher\nDiskon',
                    angle: 0.12,
                    margin: const EdgeInsets.only(top: 14),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Expanded(
                child: Column(
                  children: [
                    cueDecoration(),
                    const Spacer(),
                    customBottomButton(context),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
