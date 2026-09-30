// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'متجر لازا';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get createAccount => 'إنشاء حساب جديد';

  @override
  String get signUpSubtitle => 'يرجى ملء البيانات التالية للتسجيل';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get fullNameHint => 'علي محمد';

  @override
  String get fullNameEmptyError => 'يرجى إدخال الاسم الكامل';

  @override
  String get fullNameCapitalError => 'يجب أن يبدأ الاسم الكامل بحرف كبير';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailHint => 'example@domain.com';

  @override
  String get emailEmptyError => 'يرجى إدخال البريد الإلكتروني';

  @override
  String get emailInvalidError =>
      'يرجى إدخال بريد إلكتروني صالح يحتوي على \'@\'';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordHint => '6 أحرف على الأقل';

  @override
  String get passwordEmptyError => 'يرجى إدخال كلمة المرور';

  @override
  String get passwordLengthError => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get confirmPasswordHint => 'أعد إدخال كلمة المرور';

  @override
  String get confirmPasswordEmptyError => 'يرجى تأكيد كلمة المرور';

  @override
  String get confirmPasswordMatchError => 'كلمتا المرور غير متطابقتين';

  @override
  String get accountCreatedTitle => 'نجاح';

  @override
  String get accountCreatedMessage => 'تم إنشاء الحساب بنجاح';

  @override
  String get ok => 'حسناً';

  @override
  String get home => 'الرئيسية';

  @override
  String get featuredOffers => 'العروض المميزة';

  @override
  String get allProducts => 'جميع المنتجات';

  @override
  String get addToCart => 'إضافة إلى السلة';

  @override
  String get itemAddedToCart => 'تمت إضافة المنتج إلى السلة';

  @override
  String get productDetails => 'تفاصيل المنتج';

  @override
  String get category => 'الفئة';

  @override
  String get description => 'الوصف';

  @override
  String get price => 'السعر';

  @override
  String get cart => 'سلة التسوق';

  @override
  String get cartEmpty => 'السلة فارغة';

  @override
  String get cartEmptySubtitle => 'سلة التسوق الخاصة بك فارغة حالياً.';

  @override
  String get totalPrice => 'إجمالي السعر';

  @override
  String get checkout => 'إتمام الشراء';

  @override
  String get remove => 'حذف';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get errorLoadingProducts =>
      'فشل في تحميل المنتجات. يرجى التحقق من الاتصال.';

  @override
  String get themeLight => 'الوضع الفاتح';

  @override
  String get themeDark => 'الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';
}
