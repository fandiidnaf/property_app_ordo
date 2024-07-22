import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:property_app/gen/assets.gen.dart';
import 'package:property_app/route/route_name.dart';
import 'package:property_app/utils/const/color.dart';

import '../cubit/bottom_navbar_cubit.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.WHITE,
      width: 428.w,
      height: 85.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBottomNavBarWidget(index: 0, icon: 'home.svg'),
          CustomBottomNavBarWidget(index: 1, icon: 'building.svg'),
          CustomBottomNavBarWidget(index: 2, icon: 'document.svg'),
          CustomBottomNavBarWidget(index: 3, icon: 'cart.svg'),
          CustomBottomNavBarWidget(index: 4, icon: 'account.svg'),
        ],
      ),
    );
  }
}

class CustomBottomNavBarWidget extends StatelessWidget {
  const CustomBottomNavBarWidget({
    super.key,
    required this.index,
    required this.icon,
  });

  final int index;
  final String icon;

  final Map<int, String> mappingRoute = const {
    0: RouteName.HOME,
    1: RouteName.BUILDING,
    2: RouteName.DOCUMENT,
    3: RouteName.CART,
    4: RouteName.USER,
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // todo with index
        if (index != context.read<BottomNavbarCubit>().state) {
          context.read<BottomNavbarCubit>().changeIndex(index);
          Navigator.of(context).pushReplacementNamed(mappingRoute[index]!);
        }
      },
      child: BlocBuilder<BottomNavbarCubit, int>(
        builder: (context, state) {
          return SizedBox(
              width: 61.w,
              height: 55.h,
              child: index == state
                  ? Column(
                      children: [
                        // icon
                        SvgPicture.asset(
                          'assets/icons/navbar/active/$icon',
                          width: 24.r,
                          height: 24.r,
                          colorFilter: const ColorFilter.mode(
                              AppColors.DARK_OLIVE_GREEN, BlendMode.srcIn),
                        ),
                        // gap
                        Gap(20.h),

                        // indicator
                        SvgPicture.asset(
                          Assets.icons.navbar.indicator,
                          width: 61.w,
                          height: 11.h,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        // icon
                        SvgPicture.asset('assets/icons/navbar/nonactive/$icon',
                            width: 24.r,
                            height: 24.r,
                            colorFilter: const ColorFilter.mode(
                                AppColors.MEDIUM_GRAY, BlendMode.srcIn)),
                        // gap
                        Gap(20.h),

                        // indicator
                        SvgPicture.asset(
                          Assets.icons.navbar.indicator,
                          width: 61.w,
                          height: 11.h,
                          colorFilter: const ColorFilter.mode(
                              Colors.transparent, BlendMode.srcIn),
                        ),
                      ],
                    ));
        },
      ),
    );
  }
}
