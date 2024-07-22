import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../utils/const/color.dart';
import '../../../../../../utils/text_widget.dart';
import '../../../bloc/property_bloc.dart';

class EmptyPropertyState extends StatelessWidget {
  const EmptyPropertyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: CustomTextWidget(
            text: 'Pesanan Terbaru',
            weight: FontWeight.w500,
            size: 18,
            lineHeight: 22.68,
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: CustomTextWidget(
            text: 'Daftar pesanan terbaru anda',
            color: AppColors.SILVER,
          ),
        ),
        Gap(60.h),
        Flexible(
          child: Assets.images.backgroundEmpty.image(scale: 3.r),
        ),
        Gap(20.h),
        const CustomTextWidget(
          text: 'Pesanan Kosong',
          weight: FontWeight.w600,
          size: 16,
          lineHeight: 20.16,
        ),
        Gap(4.h),
        const CustomTextWidget(
          text: 'Ayo tambahkan pesanan baru',
          color: AppColors.MEDIUM_GRAY,
        ),
        Gap(10.h),
        // ElevatedButton.icon(
        //   onPressed: () {},
        //   label: const CustomTextWidget(
        //     text: 'Eksplor Properti',
        //     weight: FontWeight.w500,
        //     size: 16,
        //     lineHeight: 20.16,
        //     color: AppColors.WHITE,
        //   ),
        //   icon: SvgPicture.asset(
        //     Assets.icons.search,
        //     width: 20.r,
        //     height: 20.r,
        //   ),
        //   style: ButtonStyle(
        //     backgroundColor:
        //         const WidgetStatePropertyAll(AppColors.DARK_OLIVE_GREEN),
        //     padding: WidgetStatePropertyAll(
        //         const EdgeInsets.symmetric(horizontal: 25, vertical: 15).r),
        //   ),
        // ),
        GestureDetector(
          onTap: () {
            context.read<PropertyBloc>().add(LoadPropertyEvent());
          },
          child: Container(
              width: 196.w,
              // height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39).r,
                  color: AppColors.DARK_OLIVE_GREEN),
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15).r,
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.search,
                    width: 20.r,
                    height: 20.r,
                  ),
                  Gap(10.w),
                  const CustomTextWidget(
                    text: 'Eksplor Properti',
                    weight: FontWeight.w500,
                    size: 16,
                    lineHeight: 20.16,
                    color: AppColors.WHITE,
                  )
                ],
              )),
        )
      ],
    );
  }
}
