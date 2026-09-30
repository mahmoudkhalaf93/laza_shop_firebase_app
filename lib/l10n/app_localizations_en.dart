// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Laza Shop';

  @override
  String get signUp => 'Sign Up';

  @override
  String get createAccount => 'Create Account';

  @override
  String get signUpSubtitle => 'Please fill in the form below to register';

  @override
  String get fullName => 'Full Name';

  @override
  String get fullNameHint => 'John Doe';

  @override
  String get fullNameEmptyError => 'Please enter your full name';

  @override
  String get fullNameCapitalError =>
      'First letter of full name must be capital';

  @override
  String get email => 'Email Address';

  @override
  String get emailHint => 'example@domain.com';

  @override
  String get emailEmptyError => 'Please enter your email address';

  @override
  String get emailInvalidError => 'Please enter a valid email containing \'@\'';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'At least 6 characters';

  @override
  String get passwordEmptyError => 'Please enter your password';

  @override
  String get passwordLengthError => 'Password must be at least 6 characters';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Re-enter your password';

  @override
  String get confirmPasswordEmptyError => 'Please confirm your password';

  @override
  String get confirmPasswordMatchError => 'Passwords do not match';

  @override
  String get accountCreatedTitle => 'Success';

  @override
  String get accountCreatedMessage => 'Account created successfully';

  @override
  String get ok => 'OK';

  @override
  String get home => 'Home';

  @override
  String get featuredOffers => 'Featured Offers';

  @override
  String get allProducts => 'All Products';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get itemAddedToCart => 'Item added to cart';

  @override
  String get productDetails => 'Product Details';

  @override
  String get category => 'Category';

  @override
  String get description => 'Description';

  @override
  String get price => 'Price';

  @override
  String get cart => 'Shopping Cart';

  @override
  String get cartEmpty => 'Cart is empty';

  @override
  String get cartEmptySubtitle => 'Your shopping cart is currently empty.';

  @override
  String get totalPrice => 'Total Price';

  @override
  String get checkout => 'Checkout';

  @override
  String get remove => 'Remove';

  @override
  String get retry => 'Retry';

  @override
  String get errorLoadingProducts =>
      'Failed to load products. Please check your connection.';

  @override
  String get themeLight => 'Light Mode';

  @override
  String get themeDark => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';
}
