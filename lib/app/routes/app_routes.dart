part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgot-password';
  static const emailVerification = '/email-verification';
  static const home = '/home';
  static const cart = '/cart';
  static const favorites = '/favorites';
  static const profile = '/profile';
  static const productDetail = '/product-detail';
  static const search = '/search';
  static const checkout = '/checkout';
  static const orderSuccess = '/order-success';
  static const settings = '/settings';
  static const PROFILE_EDIT = '/profile/edit';
  static const PROFILE_ADDRESSES = '/profile/addresses';
  static const PROFILE_ORDERS = '/profile/orders';
  static const PROFILE_NOTIFICATIONS = '/profile/notifications';
  static const PROFILE_PRIVACY = '/profile/privacy';
  static const PROFILE_HELP = '/profile/help';
  static const PROFILE_ABOUT = '/profile/about';
} 