import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/modules/search/bindings/search_binding.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/cart/bindings/cart_binding.dart';
import 'app/modules/favorites/bindings/favorites_binding.dart';
import 'app/modules/profile/bindings/profile_binding.dart';
import 'app/modules/settings/bindings/settings_binding.dart';
import 'app/translations/app_translations.dart';
import 'package:get_storage/get_storage.dart';
// Import other bindings you need

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
    CartBinding().dependencies();
    FavoritesBinding().dependencies();
    SearchBinding().dependencies();
    ProfileBinding().dependencies();
    SettingsBinding().dependencies();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  String _getLanguageCode(String savedLanguage) {
    switch (savedLanguage) {
      case 'English':
        return 'en';
      case 'Spanish':
        return 'es';
      case 'French':
        return 'fr';
      case 'German':
        return 'de';
      case 'Italian':
        return 'it';
      case 'Portuguese':
        return 'pt';
      default:
        return 'en';
    }
  }

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final savedLanguage = storage.read('language') ?? 'English';
    final languageCode = _getLanguageCode(savedLanguage);
    final isDarkMode = storage.read('isDarkMode') ?? false;

    return GetMaterialApp(
      title: 'ShoeVogue'.tr,
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Locale(languageCode),
      fallbackLocale: const Locale('en'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        cardColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          elevation: 0,
        ),
        cardColor: Colors.grey[850],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: Routes.onboarding,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
    );
  }
}
