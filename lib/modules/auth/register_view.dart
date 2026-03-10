import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/page_container.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageContainer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text(
                'Registrasi Akun',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const Text(
                'Gunakan email dan sandi yang valid dan aktif',
                style: TextStyle(color: AppColors.lightText),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.card.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CustomTextField(
                      label: 'Username :',
                      hint: 'Aldian Alifen',
                    ),
                    const SizedBox(height: 16),
                    const CustomTextField(
                      label: 'Email :',
                      hint: 'example@co.com',
                    ),
                    const SizedBox(height: 16),
                    const CustomTextField(
                      label: 'Password :',
                      hint: '********',
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    const CustomTextField(
                      label: 'Konfirmasi Password :',
                      hint: '********',
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Daftar Akun',
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sudah Pasti Punya? Login di sini',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
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
