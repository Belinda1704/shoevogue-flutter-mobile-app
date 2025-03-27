import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed('/settings'),
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
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: isDark ? Colors.grey[900] : Colors.white,
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
                      color: isDark ? Colors.grey[300] : Colors.grey[600],
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
                color: isDark ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black26 : Colors.grey.shade200,
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
                        color: isDark ? Colors.grey[300] : Colors.grey[800],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outline,
                        color: isDark ? Colors.grey[300] : null),
                    title: const Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: isDark ? Colors.grey[300] : null),
                    onTap: () => Get.to(() => const EditProfileView()),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on_outlined,
                        color: isDark ? Colors.grey[300] : null),
                    title: const Text('Addresses'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: isDark ? Colors.grey[300] : null),
                    onTap: () => Get.to(() => const AddressesView()),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag_outlined,
                        color: isDark ? Colors.grey[300] : null),
                    title: const Text('Orders'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: isDark ? Colors.grey[300] : null),
                    onTap: () => Get.to(() => const OrdersView()),
                  ),
                ],
              ),
            ),
            
            // Preferences
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black26 : Colors.grey.shade200,
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
                        color: isDark ? Colors.grey[300] : Colors.grey[800],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_none,
                        color: isDark ? Colors.grey[300] : null),
                    title: const Text('Notifications'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: isDark ? Colors.grey[300] : null),
                    onTap: () => Get.to(() => const NotificationsView()),
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip_outlined,
                        color: isDark ? Colors.grey[300] : null),
                    title: const Text('Privacy'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: isDark ? Colors.grey[300] : null),
                    onTap: () => Get.to(() => const PrivacyView()),
                  ),
                ],
              ),
            ),
            
            // Support
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black26 : Colors.grey.shade200,
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
                        color: isDark ? Colors.grey[300] : Colors.grey[800],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline,
                        color: isDark ? Colors.grey[300] : null),
                    title: const Text('Help Center'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: isDark ? Colors.grey[300] : null),
                    onTap: () => Get.to(() => const HelpCenterView()),
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline,
                        color: isDark ? Colors.grey[300] : null),
                    title: const Text('About Us'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: isDark ? Colors.grey[300] : null),
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
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: isDark ? 1 : 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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