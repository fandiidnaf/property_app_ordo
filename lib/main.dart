import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bottom_navbar/cubit/bottom_navbar_cubit.dart';
import 'features/property/presentation/bloc/property_bloc.dart';
import 'injection_container.dart';
import 'route/app_route.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.wait([ServiceLocator().setup()]).then((value) {
    runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(),
    ));
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PropertyBloc>(),
        ),
        BlocProvider(
          create: (context) => BottomNavbarCubit(),
        )
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: !kReleaseMode,
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          FlutterNativeSplash.remove();
          return MaterialApp(
            // ignore: deprecated_member_use
            useInheritedMediaQuery: !kReleaseMode,
            locale: !kReleaseMode ? DevicePreview.locale(context) : null,
            builder: !kReleaseMode ? DevicePreview.appBuilder : null,
            onGenerateRoute: AppRoute.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
