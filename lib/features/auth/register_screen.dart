import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Create Your Account',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.deepNavy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Join the world\'s most sophisticated music community.',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 40),

              // Full Name Field
              _buildLabel('Full Name'),
              TextField(
                controller: _nameController,
                decoration: _buildInputDecoration(
                    'Enter your name', Icons.person_outline),
              ),
              const SizedBox(height: 24),

              // Email Field
              _buildLabel('Email Address'),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _buildInputDecoration(
                    'you@example.com', Icons.email_outlined),
              ),
              const SizedBox(height: 24),

              // Password Field
              _buildLabel('Password'),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: _buildInputDecoration(
                        'Create a strong password', Icons.lock_outline)
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
              const SizedBox(height: 24),

              // Terms and Conditions Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _agreedToTerms,
                    activeColor: AppColors.oceanBlue,
                    onChanged: (value) =>
                        setState(() => _agreedToTerms = value ?? false),
                  ),
                  Expanded(
                    child: Text(
                      'I agree to the Terms of Service and Privacy Policy',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.oceanBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed:
                      _agreedToTerms ? () => print("Register logic") : null,
                  child: const Text('Create Account',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 24),
              _buildDivider(),
              const SizedBox(height: 24),

              // Google Sign Up
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata,
                      color: Colors.red, size: 30),
                  label: const Text('Sign up with Google',
                      style: TextStyle(color: AppColors.deepNavy)),
                ),
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Sign In',
                        style: TextStyle(
                            color: AppColors.oceanBlue,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reuse the helpers from Login for consistency
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: AppColors.deepNavy)),
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.oceanBlue, width: 2),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('OR',
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
