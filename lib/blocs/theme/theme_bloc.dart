import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/cache_helper.dart';
import 'theme_event.dart';
import 'theme_state.dart';

/// BLoC responsible for managing app-wide light/dark theme state.
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: const Color(0xFF9775FA),
    scaffoldBackgroundColor: const Color(0xFFFEFEFE),
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Color(0xFF1D1E20)),
      titleTextStyle: TextStyle(
        color: Color(0xFF1D1E20),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color(0xFF9775FA),
    scaffoldBackgroundColor: const Color(0xFF1B262C),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  ThemeBloc() : super(_getInitialState()) {
    on<ToggleThemeEvent>(_onToggleTheme);
    on<SetThemeEvent>(_onSetTheme);
  }

  static ThemeState _getInitialState() {
    final bool isDark = CacheHelper.getThemeMode() ?? false;
    return ThemeState(
      isDark: isDark,
      themeData: isDark ? _darkTheme : _lightTheme,
    );
  }

  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    final bool newIsDark = !state.isDark;
    CacheHelper.saveThemeMode(newIsDark);
    emit(ThemeState(
      isDark: newIsDark,
      themeData: newIsDark ? _darkTheme : _lightTheme,
    ));
  }

  void _onSetTheme(SetThemeEvent event, Emitter<ThemeState> emit) {
    CacheHelper.saveThemeMode(event.isDark);
    emit(ThemeState(
      isDark: event.isDark,
      themeData: event.isDark ? _darkTheme : _lightTheme,
    ));
  }
}
