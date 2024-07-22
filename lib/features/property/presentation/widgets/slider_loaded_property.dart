import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/const/color.dart';
import '../../../../utils/functions/indonesia.dart';
import '../../../../utils/text_widget.dart';
import '../bloc/property_bloc.dart';
import 'row_info_property.dart';

class SliderLoadedProperty extends StatelessWidget {
  const SliderLoadedProperty(this.state, {super.key});

  final PropertyLoaded state;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: state.property.property.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              color: AppColors.WHITE),
          padding: const EdgeInsets.all(15).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "#${state.property.property[index].id}",
                  ),
                  Container(
                    // width: 63.w,
                    // height: 19.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25).r,
                        color: AppColors.LIME_GREEN),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8)
                            .r,
                    child: const Center(
                      child: CustomTextWidget(
                        text: 'Komersil',
                        color: AppColors.WHITE,
                      ),
                    ),
                  )
                ],
              ),
              Gap(10.h),
              Row(
                children: [
                  // img,
                  ClipRRect(
                      borderRadius: BorderRadius.circular(11.33).r,
                      child: Image.asset(
                        state.property.property[index].img!,
                        fit: BoxFit.cover,
                        width: 100.w,
                        // height: (85 / 1140 * 926).h,
                        height: 85.h,
                      )),

                  Gap(15.w),
                  // column text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RowInfoProperty(
                        icon: Assets.icons.home,
                        text: state.property.property[index].name!,
                      ),
                      Gap(7.h),
                      RowInfoProperty(
                        icon: Assets.icons.location,
                        text: state.property.property[index].location!,
                      ),
                      Gap(7.h),
                      RowInfoProperty(
                          icon: Assets.icons.calendar,
                          text: formatDateTime(
                              state.property.property[index].deadlines!)),
                      Gap(7.h),
                      RowInfoProperty(
                          // price: state.property.property[index].price,
                          price: formatRupiah(
                              state.property.property[index].price!)),
                    ],
                  )
                ],
              ),
              // if denda is not null
              if (state.property.property[index].fine != null)
                Column(
                  children: [
                    Gap(10.h),
                    const DottedLine(
                      dashColor: AppColors.SILVER_2,
                    ),
                    Gap(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // rupiah denda
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.dollar,
                                width: 14.r,
                                height: 14.r,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.DARK_OLIVE_GREEN,
                                    BlendMode.srcIn)),
                            Gap(5.w),
                            const CustomTextWidget(text: 'Denda Rp '),
                            CustomTextWidget(
                              text: formatRupiah(
                                  state.property.property[index].fine!),
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                        // terlambat : ... hari
                        Container(
                          // width: 104.w,
                          // height: 21.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25).r,
                              color: AppColors.DARK_OLIVE_GREEN),
                          padding: const EdgeInsets.only(
                                  top: 4, right: 9, bottom: 4, left: 7)
                              .r,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icons.warning,
                                width: 10.r,
                                height: 10.r,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.WHITE, BlendMode.srcIn),
                              ),
                              Gap(3.w),
                              CustomTextWidget(
                                text:
                                    'Terlambat ${state.property.property[index].currentDate!.difference(state.property.property[index].deadlines!).inDays} hari',
                                size: 10,
                                lineHeight: 12.6,
                                color: AppColors.WHITE,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ],
          ),
        );
      },
      options: CarouselOptions(
        // height: (144 / 1140 * 926).h,
        // aspectRatio:  378.r / 144.r, // denda tidak null
        // aspectRatio: 378.r / 185.r, // denda is null
        aspectRatio: state.property.property[state.index].fine != null
            ? (378.r / 185.r)
            : (378.r / 144.r), // denda is null
        // aspectRatio: 16 / 6.5,
        // padEnds: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 1,
        onScrolled: (value) {
          context.read<PropertyBloc>().add(ScrolledSliderPropertyEvent(
              property: state.property,
              // index: value!.toInt()
              index: value!.round()));
          // print("value : $value");
        },
        initialPage: state.index,
      ),
    );
  }
}
