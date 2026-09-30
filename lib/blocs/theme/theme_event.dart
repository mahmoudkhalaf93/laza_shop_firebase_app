import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched to toggle between Light and Dark themes.
class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent();
}

/// Event dispatched to set theme explicitly.
class SetThemeEvent extends ThemeEvent {
  final bool isDark;

  const SetThemeEvent(this.isDark);

  @override
  List<Object?> get props => [isDark];
}
