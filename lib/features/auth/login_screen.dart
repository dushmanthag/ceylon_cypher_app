import 'package:ceylon_cypher_app/features/auth/register_screen.dart';
import 'package:ceylon_cypher_app/features/dashboard/home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              // Brand Logo Placeholder
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.accentYellow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child:
                    const Icon(Icons.music_note, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 32),
              Text('Welcome Back',
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Your personal symphony awaits',
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              const SizedBox(height: 48),

              // Email Field
              _buildLabel('Email Address'),
              TextField(
                controller: _emailController,
                decoration: _buildInputDecoration(
                    'name@example.com', Icons.email_outlined),
              ),
              const SizedBox(height: 24),

              // Password Field
              _buildLabel('Password'),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: _buildInputDecoration(
                        'Enter your password', Icons.lock_outline)
                    .copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () => setState(
                        () => _isPasswordVisible = !_isPasswordVisible),
                  ),
                ),
              ),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?',
                      style: TextStyle(color: theme.colorScheme.primary)),
                ),
              ),
              const SizedBox(height: 24),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.skyBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text('Sign In',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 32),
              _buildDivider(),
              const SizedBox(height: 32),

              // Social Logins
              Row(
                children: [
                  Expanded(child: _buildSocialButton('Apple', Icons.apple)),
                  const SizedBox(width: 16),
                  Expanded(
                      child: _buildSocialButton('Google', Icons.g_mobiledata,
                          isGoogle: true)),
                ],
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: Text('Create Account',
                          style: TextStyle(color: theme.colorScheme.primary))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- UI Helpers to keep code clean ---

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300)),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('or continue with',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12))),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialButton(String label, IconData icon,
      {bool isGoogle = false}) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      onPressed: () {},
      icon: Icon(icon, color: isGoogle ? Colors.red : Colors.black),
      label: Text(label, style: const TextStyle(color: Colors.black)),
    );
  }
}
