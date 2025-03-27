import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 24),
              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 32),
              // First and Last Name Row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: Icon(Icons.person_outline, color: Colors.grey[600]),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          prefixIcon: Icon(Icons.person_outline, color: Colors.grey[600]),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Username field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.alternate_email, color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
              // Phone field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  keyboardType: TextInputType.phone,
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
              const SizedBox(height: 24),
              // Terms and conditions
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey[600]),
                        children: [
                          const TextSpan(text: 'I agree to '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Terms of use',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Create Account button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.signup(
                    email: emailController.text,
                    password: passwordController.text,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    username: usernameController.text,
                    phone: phoneController.text,
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
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Or sign up with
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Or sign up with',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
              const SizedBox(height: 24),
              // Social signup buttons
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