import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/property_bloc.dart';
import 'state/empty.dart';
import 'state/loaded.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25).r,
      child: BlocBuilder<PropertyBloc, PropertyState>(
        builder: (context, state) {
          if (state is PropertyLoaded) {
            return LoadedPropertyState(state);
          } else if (state is PropertyInitial) {
            return const EmptyPropertyState();
          }
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
