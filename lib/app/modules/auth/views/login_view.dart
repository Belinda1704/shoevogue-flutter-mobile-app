import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome back,',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Discover timeless choices and unmatched convenience.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 40),
              // Email field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'E-Mail',
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 16),
              // Password field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
                    suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 16),
              // Remember me and Forgot password
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const Text('Remember Me'),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.toNamed('/forgot-password'),
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.login(
                    emailController.text,
                    passwordController.text,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Create Account button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.toNamed('/signup'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Create Account'),
                ),
              ),
              const SizedBox(height: 24),
              // Or sign in with
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Or sign in with',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
              const SizedBox(height: 24),
              // Social login buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Image.asset(
                      'assets/logos/google-icon.png',
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Image.asset(
                      'assets/logos/facebook-icon.png',
                      height: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 