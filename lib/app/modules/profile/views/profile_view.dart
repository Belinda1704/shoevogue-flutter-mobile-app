import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'edit_profile_view.dart';
import 'addresses_view.dart';
import 'orders_view.dart';
import 'notifications_view.dart';
import 'privacy_view.dart';
import 'help_center_view.dart';
import 'about_us_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(Routes.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  // Profile image
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Name
                  Obx(() => Text(
                    controller.name.value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  
                  // Email
                  Obx(() => Text(
                    controller.email.value,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  )),
                ],
              ),
            ),
            
            // Account Settings
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Account Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  
                  // Edit Profile
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: const Text('Edit Profile'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Get.to(() => const EditProfileView()),
                  ),
                  
                  // Addresses
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text('Addresses'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Get.to(() => const AddressesView()),
                  ),
                  
                  // Orders
                  ListTile(
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const Text('Orders'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Get.to(() => const OrdersView()),
                  ),
                ],
              ),
            ),
            
            // Preferences
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Preferences',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  
                  // Notifications
                  ListTile(
                    leading: const Icon(Icons.notifications_none),
                    title: const Text('Notifications'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Get.to(() => const NotificationsView()),
                  ),
                  
                  // Privacy
                  ListTile(
                    leading: const Icon(Icons.privacy_tip_outlined),
                    title: const Text('Privacy'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Get.to(() => const PrivacyView()),
                  ),
                ],
              ),
            ),
            
            // Support
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  
                  // Help Center
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text('Help Center'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Get.to(() => const HelpCenterView()),
                  ),
                  
                  // About Us
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('About Us'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Get.to(() => const AboutUsView()),
                  ),
                ],
              ),
            ),
            
            // Logout Button
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.logout(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 