import 'package:get/get.dart';
import 'package:shoe_vogue/app/modules/auth/bindings/auth_binding.dart';
import 'package:shoe_vogue/app/modules/auth/views/onboarding_view.dart';
import 'package:shoe_vogue/app/modules/auth/views/login_view.dart';
import 'package:shoe_vogue/app/modules/auth/views/signup_view.dart';
import 'package:shoe_vogue/app/modules/auth/views/forgot_password_view.dart';
import 'package:shoe_vogue/app/modules/auth/views/email_verification_view.dart';
import 'package:shoe_vogue/app/modules/home/bindings/home_binding.dart';
import 'package:shoe_vogue/app/modules/home/views/home_view.dart';
import 'package:shoe_vogue/app/modules/profile/bindings/profile_binding.dart';
import 'package:shoe_vogue/app/modules/profile/views/profile_view.dart';
import 'package:shoe_vogue/app/modules/cart/bindings/cart_binding.dart';
import 'package:shoe_vogue/app/modules/cart/views/cart_view.dart';
import 'package:shoe_vogue/app/modules/favorites/bindings/favorites_binding.dart';
import 'package:shoe_vogue/app/modules/favorites/views/favorites_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/order_success/views/order_success_view.dart';
import '../modules/profile/views/edit_profile_view.dart';
import '../modules/profile/views/addresses_view.dart';
import '../modules/profile/views/orders_view.dart';
import '../modules/profile/views/notifications_view.dart';
import '../modules/profile/views/privacy_view.dart';
import '../modules/profile/views/help_center_view.dart';
import '../modules/profile/views/about_us_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.onboarding;

  static final routes = [
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.emailVerification,
      page: () => const EmailVerificationView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      children: [
        GetPage(
          name: '/edit',
          page: () => const EditProfileView(),
        ),
        GetPage(
          name: '/addresses',
          page: () => const AddressesView(),
        ),
        GetPage(
          name: '/orders',
          page: () => const OrdersView(),
        ),
        GetPage(
          name: '/notifications',
          page: () => const NotificationsView(),
        ),
        GetPage(
          name: '/privacy',
          page: () => const PrivacyView(),
        ),
        GetPage(
          name: '/help',
          page: () => const HelpCenterView(),
        ),
        GetPage(
          name: '/about',
          page: () => const AboutUsView(),
        ),
      ],
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.favorites,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: Routes.productDetail,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: Routes.orderSuccess,
      page: () => const OrderSuccessView(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
} 