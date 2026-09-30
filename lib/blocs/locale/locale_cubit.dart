import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/cache_helper.dart';

/// Cubit responsible for managing runtime application locale switching (EN/AR).
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(_getInitialLocale());

  static Locale _getInitialLocale() {
    final String? code = CacheHelper.getLocale();
    if (code != null && (code == 'en' || code == 'ar')) {
      return Locale(code);
    }
    return const Locale('en');
  }

  /// Toggles between English ('en') and Arabic ('ar').
  void toggleLanguage() {
    final newLocale =
        state.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    CacheHelper.saveLocale(newLocale.languageCode);
    emit(newLocale);
  }

  /// Sets specific language locale code ('en' or 'ar').
  void setLocale(String languageCode) {
    if (languageCode == 'en' || languageCode == 'ar') {
      CacheHelper.saveLocale(languageCode);
      emit(Locale(languageCode));
    }
  }
}
