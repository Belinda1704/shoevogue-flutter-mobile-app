import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/checkout_controller.dart';
import '../../../services/payment_service.dart';

class CheckoutView extends GetView {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Obx(() => controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shipping Address
                const Text(
                  'Shipping Address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.nameController,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: controller.addressController,
                          decoration: const InputDecoration(
                            labelText: 'Street Address',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.cityController,
                                decoration: const InputDecoration(
                                  labelText: 'City',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: controller.zipController,
                                decoration: const InputDecoration(
                                  labelText: 'ZIP Code',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: controller.phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Payment Method
                const Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Credit/Debit Card
                        ListTile(
                          title: const Text('Credit/Debit Card'),
                          subtitle: const Text('Pay with Visa, Mastercard'),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/icons/payment_methods/visa.png',
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/icons/payment_methods/master-card.png',
                                width: 32,
                                height: 32,
                              ),
                            ],
                          ),
                          trailing: Radio<String>(
                            value: 'card',
                            groupValue: controller.paymentMethod.value,
                            onChanged: (value) => controller.paymentMethod.value = value!,
                          ),
                          onTap: () => controller.paymentMethod.value = 'card',
                        ),
                        const Divider(),
                        // Google Pay
                        ListTile(
                          title: const Text('Google Pay'),
                          subtitle: const Text('Fast and secure payment'),
                          leading: Image.asset(
                            'assets/icons/payment_methods/google-pay.png',
                            width: 32,
                            height: 32,
                          ),
                          trailing: Radio<String>(
                            value: 'google_pay',
                            groupValue: controller.paymentMethod.value,
                            onChanged: (value) => controller.paymentMethod.value = value!,
                          ),
                          onTap: () => controller.paymentMethod.value = 'google_pay',
                        ),
                        const Divider(),
                        // Apple Pay
                        ListTile(
                          title: const Text('Apple Pay'),
                          subtitle: const Text('Quick and secure checkout'),
                          leading: Image.asset(
                            'assets/icons/payment_methods/apple-pay.png',
                            width: 32,
                            height: 32,
                          ),
                          trailing: Radio<String>(
                            value: 'apple_pay',
                            groupValue: controller.paymentMethod.value,
                            onChanged: (value) => controller.paymentMethod.value = value!,
                          ),
                          onTap: () => controller.paymentMethod.value = 'apple_pay',
                        ),
                        const Divider(),
                        // PayPal
                        ListTile(
                          title: const Text('PayPal'),
                          subtitle: const Text('Pay with PayPal account'),
                          leading: Image.asset(
                            'assets/icons/payment_methods/paypal.png',
                            width: 32,
                            height: 32,
                          ),
                          trailing: Radio<String>(
                            value: 'paypal',
                            groupValue: controller.paymentMethod.value,
                            onChanged: (value) => controller.paymentMethod.value = value!,
                          ),
                          onTap: () => controller.paymentMethod.value = 'paypal',
                        ),
                        const Divider(),
                        // Cash on Delivery
                        ListTile(
                          title: const Text('Cash on Delivery'),
                          subtitle: const Text('Pay when you receive'),
                          leading: Image.asset(
                            'assets/icons/payment_methods/credit-card.png',
                            width: 32,
                            height: 32,
                            color: Colors.green,
                          ),
                          trailing: Radio<String>(
                            value: 'cash',
                            groupValue: controller.paymentMethod.value,
                            onChanged: (value) => controller.paymentMethod.value = value!,
                          ),
                          onTap: () => controller.paymentMethod.value = 'cash',
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Order Summary
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal'),
                            Obx(() => Text('\$${controller.subtotal.value.toStringAsFixed(2)}')),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Shipping'),
                            Obx(() => Text('\$${controller.shipping.value.toStringAsFixed(2)}')),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tax'),
                            Obx(() => Text('\$${controller.tax.value.toStringAsFixed(2)}')),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Obx(() => Text(
                              '\$${controller.total.value.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => controller.handlePayment(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class CheckoutController extends GetxController {
  final paymentService = Get.find<PaymentService>();
  
  // Form controllers
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final phoneController = TextEditingController();
  
  // Loading state
  final isLoading = false.obs;
  
  // Selected payment method
  final paymentMethod = 'card'.obs;  // Default to card payment
  
  // Mock values - replace with actual cart values
  final subtotal = 99.99.obs;
  final shipping = 10.00.obs;
  final tax = 8.00.obs;
  final total = 0.0.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Calculate total
    total.value = subtotal.value + shipping.value + tax.value;
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

  bool _validateForm() {
    if (nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        cityController.text.isEmpty ||
        zipController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
  
  void handlePayment() async {
    if (!_validateForm()) return;

    final orderDetails = {
      'name': nameController.text,
      'address': addressController.text,
      'city': cityController.text,
      'zipCode': zipController.text,
      'phone': phoneController.text,
      'items': [], // Replace with actual cart items
      'subtotal': subtotal.value,
      'shipping': shipping.value,
      'tax': tax.value,
      'total': total.value,
    };

    await paymentService.processPayment(
      paymentMethod: paymentMethod.value,
      amount: total.value,
      currency: 'USD',
      orderDetails: orderDetails,
      onSuccess: () {
        // Clear form
        nameController.clear();
        addressController.clear();
        cityController.clear();
        zipController.clear();
        phoneController.clear();
        
        // Navigate to order confirmation
        Get.offAllNamed('/order-confirmation');
      },
      onError: (error) {
        print('Payment error: $error');
      },
    );
  }
} 