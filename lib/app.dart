import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/modules/search/bindings/search_binding.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/cart/bindings/cart_binding.dart';
import 'app/modules/favorites/bindings/favorites_binding.dart';
import 'app/modules/profile/bindings/profile_binding.dart';
import 'app/modules/settings/bindings/settings_binding.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ShoeVogue',
      debugShowCheckedModeBanner: false,
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
      themeMode: ThemeMode.system, // This will be controlled by the SettingsController
      initialRoute: Routes.onboarding,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
    );
  }
}
