import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:property_app/gen/assets.gen.dart';
import 'package:property_app/gen/fonts.gen.dart';
import 'package:property_app/utils/const/color.dart';

import '../../../../utils/text_widget.dart';

class SliderAdsWidget extends StatelessWidget {
  const SliderAdsWidget({
    super.key,
    required this.index,
    this.backgroundColor = AppColors.DARK_OLIVE_GREEN,
    this.textColor = AppColors.WHITE,
    this.content = const {
      "diskon": 20.0,
      "nameProperty": "American House",
      "periode": "Periode 19 Nov 2023 s/d 15 Des 2023"
    },
    required this.img,
  });

  final int index;
  final Color backgroundColor;
  final Color textColor;

  /// [content]
  ///
  /// `content[diskon] : double`
  ///
  /// `content[nameProperty] : String`
  ///
  /// `content[periode] : String`
  final Map<String, dynamic> content;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
        transformAlignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(right: 20).r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r), color: backgroundColor),
        child: Row(
          children: [
            // text
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, bottom: 30).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    style: TextStyle(color: textColor),
                    TextSpan(
                        text: '${(content["diskon"] as double).round()}%',
                        style: TextStyle(
                            fontFamily: FontFamily.rubik,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            height: 21.33 / 18),
                        children: [
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                                fontFamily: FontFamily.outfit,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp,
                                height: 18.9 / 15),
                          ),
                          TextSpan(
                              text: 'Diskon',
                              style: TextStyle(
                                fontFamily: FontFamily.outfit,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                height: 18.9 / 15,
                              ))
                        ]),
                  ),
                  Gap(7.h),
                  CustomTextWidget(
                    text: content["nameProperty"],
                    weight: FontWeight.w500,
                    size: 20,
                    lineHeight: 25.2,
                    color: textColor,
                  ),
                  Gap(4.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.calendar,
                        // width: 12.r,
                        // height: 12.r,
                      ),
                      Gap(5.w),
                      CustomTextWidget(
                        text: content["periode"],
                        weight: FontWeight.w300,
                        size: 10,
                        lineHeight: 12.6,
                        color: textColor,
                      )
                    ],
                  )
                ],
              ),
            ),

            // img
            Expanded(
                child: Transform.translate(
              offset: Offset(0, 10.h),
              child: Image.asset(img),
            ))
          ],
        ));
  }
}
