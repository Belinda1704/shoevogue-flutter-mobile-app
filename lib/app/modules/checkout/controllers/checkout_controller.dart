import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../cart/controllers/cart_controller.dart';

class CheckoutController extends GetxController {
  final cartController = Get.find<CartController>();
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  
  final RxString paymentMethod = 'card'.obs;
  final RxBool isLoading = false.obs;
  
  double get subtotal => cartController.total.value;
  double get shipping => 10.0;
  double get tax => subtotal * 0.08;
  double get total => subtotal + shipping + tax;
  
  void placeOrder() {
    if (_validateForm()) {
      isLoading.value = true;
      
      // Simulate order processing
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        
        // Clear cart and show success
        cartController.clearCart();
        
        Get.offAllNamed('/order-success');
      });
    }
  }
  
  bool _validateForm() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return false;
    }
    if (addressController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your address');
      return false;
    }
    if (cityController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your city');
      return false;
    }
    if (zipController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your ZIP code');
      return false;
    }
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your phone number');
      return false;
    }
    return true;
  }
  
  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipController.dispose();
    phoneController.dispose();
    super.onClose();
  }
} 