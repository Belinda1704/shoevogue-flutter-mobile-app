import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final _storage = GetStorage();
  final RxBool isDarkMode = false.obs;
  final RxString currentLanguage = 'English'.obs;
  final RxString currentCurrency = 'USD'.obs;

  // Available languages
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en'},
    {'name': 'Spanish', 'code': 'es'},
    {'name': 'French', 'code': 'fr'},
    {'name': 'German', 'code': 'de'},
    {'name': 'Italian', 'code': 'it'},
    {'name': 'Portuguese', 'code': 'pt'},
  ];

  // Available currencies
  final List<Map<String, String>> currencies = [
    {'name': 'US Dollar', 'code': 'USD', 'symbol': '\$'},
    {'name': 'Euro', 'code': 'EUR', 'symbol': '€'},
    {'name': 'British Pound', 'code': 'GBP', 'symbol': '£'},
    {'name': 'Japanese Yen', 'code': 'JPY', 'symbol': '¥'},
    {'name': 'Canadian Dollar', 'code': 'CAD', 'symbol': 'CA\$'},
    {'name': 'Australian Dollar', 'code': 'AUD', 'symbol': 'AU\$'},
  ];

  @override
  void onInit() {
    super.onInit();
    loadThemeMode();
    loadLanguage();
    loadCurrency();
  }

  void loadThemeMode() {
    isDarkMode.value = _storage.read('isDarkMode') ?? false;
  }

  void loadLanguage() {
    currentLanguage.value = _storage.read('language') ?? 'English';
  }

  void loadCurrency() {
    currentCurrency.value = _storage.read('currency') ?? 'USD';
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _storage.write('isDarkMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeLanguage(String language) {
    currentLanguage.value = language;
    _storage.write('language', language);
    // Here you would typically change the app's locale
    // Get.updateLocale(Locale(languageCode));
    Get.back();
  }

  void changeCurrency(String currency) {
    currentCurrency.value = currency;
    _storage.write('currency', currency);
    Get.back();
  }

  String getCurrencySymbol(String currencyCode) {
    final currency = currencies.firstWhere(
      (c) => c['code'] == currencyCode,
      orElse: () => {'symbol': '\$'},
    );
    return currency['symbol'] ?? '\$';
  }
} 