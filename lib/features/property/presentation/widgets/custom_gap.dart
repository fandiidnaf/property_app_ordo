import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../bloc/property_bloc.dart';

class CustomGap extends StatelessWidget {
  const CustomGap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(
      builder: (context, state) {
        if (state is PropertyInitial) {
          return Gap(30.h);
        }
        return Gap(25.h);
      },
    );
  }
}
