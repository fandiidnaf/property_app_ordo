import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/gen/assets.gen.dart';

import '../../../../../utils/const/color.dart';
import '../../widgets/slider_ads_widget.dart';

class AdsSection extends StatelessWidget {
  const AdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 2,
        itemBuilder: (context, index, realIndex) {
          return SliderAdsWidget(
            img: Assets.images.americanHouse.path,
            index: index,
            backgroundColor:
                index.isOdd ? AppColors.LIME_GREEN : AppColors.DARK_OLIVE_GREEN,
          );
        },
        options: CarouselOptions(
            autoPlay: true,
            height: 155.h,
            enlargeCenterPage: false,
            viewportFraction: 1.14.r,
            enableInfiniteScroll: false));
  }
}
