import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/foto_biliard.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryDark.withOpacity(0.72),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          'Registrasi Akun',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Center(
                        child: Text(
                          'Gunakan email dan sandi yang valid\n dan aktif',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.lightText,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 330),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 26,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.38),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.55),
                              width: 1.2,
                            ),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 22),
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
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Sudah Buat Akun? Login di Sini !',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: 'Daftar Akun',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.login,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
