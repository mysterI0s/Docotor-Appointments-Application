import 'package:final_project/core/theme/app_theme.dart';
import 'package:final_project/core/theme/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final GetStorage storage;
  static const String themeKey = 'themeMode';

  ThemeCubit(this.storage)
      : super(ThemeInitial(storage.read(themeKey) == 'dark'
            ? AppThemes.darkTheme
            : AppThemes.lightTheme));

  void toggleTheme() {
    final isDarkMode = state is ThemeChanged &&
        (state as ThemeChanged).themeData == AppThemes.darkTheme;

    final newTheme = isDarkMode ? AppThemes.lightTheme : AppThemes.darkTheme;

    storage.write(themeKey, isDarkMode ? 'light' : 'dark');
    emit(ThemeChanged(newTheme));
  }
}
