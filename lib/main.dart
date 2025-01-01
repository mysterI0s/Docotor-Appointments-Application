import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:final_project/core/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';
import 'package:final_project/core/theme/app_theme.dart';
import 'package:final_project/core/theme/cubit/theme_cubit.dart';
import 'package:final_project/core/theme/cubit/theme_state.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return TextFormFieldCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return BottomNavigationCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return AuthCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return ThemeCubit(GetStorage());
            },
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, ThemeState state) {
            return MaterialApp(
              theme: (state is ThemeInitial || state is ThemeChanged)
                  ? state.themeData
                  : AppThemes.lightTheme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              home: const MyHomePage(),
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
