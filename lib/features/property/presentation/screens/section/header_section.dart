import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../../utils/const/color.dart';
import '../../../../../utils/text_widget.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // img with title
          Row(
            children: [
              // img
              Container(
                width: 60.r,
                height: 60.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.CADET_BLUE,
                    image: DecorationImage(
                        image: Assets.images.profileAvatar.provider())),
                // child: Assets.images.profileAvatar.image(),
              ),
              Gap(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Temukan",
                          style: TextStyle(
                              fontFamily: FontFamily.outfit,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: AppColors.DARK_OLIVE_GREEN,
                              height: 20 / 18),
                          children: const [TextSpan(text: '\nHunian Impian')])),
                  Gap(4.h),
                  const CustomTextWidget(
                    text: 'Agen Properti Terbaik',
                    color: AppColors.MEDIUM_GRAY_2,
                  ),
                ],
              )
            ],
          ),

          // icon notification
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 35.r,
                height: 35.r,
                padding: EdgeInsets.all(4.17.r),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.WHITE,
                ),
                child: SvgPicture.asset(Assets.icons.notification,
                    width: 20.r, height: 20.r),
              ),
              Positioned(
                top: -10.h,
                right: -12.w,
                child: Container(
                    width: 24.r,
                    height: 24.r,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.SALMON_PINK),
                    child: const Center(
                        child: CustomTextWidget(
                            text: "3",
                            size: 10.67,
                            weight: FontWeight.w500,
                            lineHeight: 13.44,
                            color: AppColors.WHITE))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
