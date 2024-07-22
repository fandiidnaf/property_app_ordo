import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/bottom_navbar/cubit/bottom_navbar_cubit.dart';
import 'package:property_app/features/property/presentation/bloc/property_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/route/app_route.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([ServiceLocator().setup()]).then((value) {
    runApp(const MainApp());
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
      child: const ScreenUtilInit(
        designSize: Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          onGenerateRoute: AppRoute.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
