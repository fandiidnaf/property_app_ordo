// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:property_app/gen/assets.gen.dart';
import 'package:property_app/gen/fonts.gen.dart';
import 'package:property_app/utils/const/color.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../../utils/text_widget.dart';
import '../../domain/entities/property.dart';

class BuildBottomSheetWidget {
  Widget getTahapPemesanan(TahapPemesananMenu menu) {
    return ContentBottomSheetWidget(
      title: 'Tahap Pemesanan',
      descriptionTitle: 'Daftar menu tahap pemesanan',
      builder: {
        "Booking\nFee": {
          if (menu.bookingFee != null)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: Center(
                child: CustomTextWidget(
                  text: menu.bookingFee!.toString(),
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.bookingFee),
        },
        "Pesanan\nBelum Bayar": {
          if (menu.pesananBelumBayar!) "badge": const SizedBox.shrink(),
          "icon": CustomContainerIconWidget(Assets.icons.pesananBelumBayar)
        },
        "Riwayat\nPesanan": {
          if (menu.riwayatPemesanan!) "badge": const SizedBox.shrink(),
          "icon": CustomContainerIconWidget(Assets.icons.riwayatPesanan)
        }
      },
    );
  }

  Widget getTahapAdministrasi(TahapAdministrasiMenu menu) {
    return ContentBottomSheetWidget(
      builder: {
        "Tahap\nSPS": {
          if (menu.tahapSps!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.tahapSps),
        },
        "Tahap\nSPR": {
          if (menu.tahapSpr!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.tahapSpr),
        },
        "Tahap\nPPJB": {
          if (menu.tahapPpjb!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.tahapPpjb),
        },
        "Daftar\nDokumen": {
          if (menu.daftarDokumen!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.daftarDokumen),
        },
        "Tahap\nSP3K": {
          if (menu.tahapSp3K!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.tahapSp3k),
        },
        "Bayar\nAngsuran": {
          if (menu.bayarAngsuran!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.bayarAngsuran),
        },
      },
      title: 'Tahap Administrasi',
      descriptionTitle: 'Daftar menu tahap administrasi',
    );
  }

  Widget getTahapPembangunan(TahapPembangunanMenu menu) {
    return ContentBottomSheetWidget(
      builder: {
        "Tahap\nPersiapan": {
          "icon": CircularProgressPembangunan(menu.tahapPersiapan!),
          "badge": const SizedBox.shrink(),
        },
        "Tahap\nPondasi & Struktur": {
          "icon": CircularProgressPembangunan(menu.tahapPondasiStruktur!),
          "badge": const SizedBox.shrink(),
        },
        "Tahap\nRumah Unfinished": {
          "icon": CircularProgressPembangunan(menu.tahapRumahUnfinished!),
          "badge": const SizedBox.shrink(),
        },
        "Tahap\nFinishing & Interior": {
          "icon": CircularProgressPembangunan(menu.daftarFinishingInterior!),
          "badge": const SizedBox.shrink(),
        },
        "Tahap\nPembersihan": {
          "icon": CircularProgressPembangunan(menu.tahapPembersihan!),
          "badge": const SizedBox.shrink(),
        },
      },
      title: 'Tahap Pembangunan',
      descriptionTitle: 'Daftar menu tahap pembangunan rumah',
    );
  }

  Widget getTahapAkadSerahTerima(TahapAkadSerahTerimaMenu menu) {
    return ContentBottomSheetWidget(
      builder: {
        "Tahap\nAkad": {
          if (menu.tahapAkad!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.tahapAkad)
        },
        "Tahap\nSerah Terima Bangunan": {
          if (menu.tahapSerahTerimaBangunan!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon":
              CustomContainerIconWidget(Assets.icons.tahapSerahTerimaBangunan)
        },
        "Tahap\nSerah Terima Legalitas": {
          if (menu.tahapSerahTerimaLegalitas!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon":
              CustomContainerIconWidget(Assets.icons.tahapSerahTerimaLegalitas),
        },
        "Daftar\nKomplain": {
          if (menu.daftarKomplain!)
            "badge": Container(
              width: 24.r,
              height: 24.r,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.SALMON_PINK,
              ),
              child: const Center(
                child: CustomTextWidget(
                  text: "!",
                  weight: FontWeight.w500,
                  size: 10.67,
                  lineHeight: 13.44,
                  color: AppColors.WHITE,
                ),
              ),
            ),
          "icon": CustomContainerIconWidget(Assets.icons.daftarKomplain)
        },
      },
      title: 'Tahap Akad Serah & Terima',
      descriptionTitle: 'Daftar menu tahap akad & serah terima',
    );
  }
}

class CustomContainerIconWidget extends StatelessWidget {
  const CustomContainerIconWidget(
    this.imgName, {
    super.key,
  });

  final String imgName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.r,
      height: 35.r,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.DARK_OLIVE_GREEN,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6.25.h),
                blurRadius: 4.58.r,
                color: AppColors.SEMI_TRANSPARENT_LIGHT_GRAY),
          ]),
      child: Center(
        child: SvgPicture.asset(imgName, width: 20.r, height: 20.r),
      ),
    );
  }
}

class CircularProgressPembangunan extends StatelessWidget {
  const CircularProgressPembangunan(this.progress, {super.key});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 35.r,
        height: 35.r,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.DARK_OLIVE_GREEN,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2.5,
                  spreadRadius: 0,
                  color: AppColors.SEMI_TRANSPARENT_DARK_GREEN,
                  offset: Offset(0, 5))
            ]),
        child: SimpleCircularProgressBar(
          valueNotifier: ValueNotifier(progress),
          backStrokeWidth: 3,
          progressStrokeWidth: 3,
          progressColors: const [AppColors.SALMON_PINK],
          backColor: AppColors.WHITE,
          mergeMode: true,
          onGetText: (double value) {
            return Text.rich(TextSpan(
                text: value.toInt().toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamily.rubik,
                    height: 14.22 / 12,
                    fontSize: 12.sp,
                    color: AppColors.WHITE),
                children: [
                  TextSpan(
                    text: '%',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.rubik,
                        height: 5.93 / 5,
                        fontSize: 5.sp,
                        color: AppColors.WHITE),
                  ),
                ]));
          },
        ));
  }
}

/// ```dart
/// {
///   "icon": Container() // required
///   "badge": Container() // optional
/// }
/// ```
typedef WidgetMap = Map<String, Widget>;

class ContentBottomSheetWidget extends StatelessWidget {
  const ContentBottomSheetWidget(
      {super.key,
      required this.title,
      required this.descriptionTitle,
      required this.builder});

  final String title;
  final String descriptionTitle;

  final Map<String, WidgetMap> builder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextWidget(
            text: title, weight: FontWeight.w500, size: 18, lineHeight: 22.68),
        CustomTextWidget(text: descriptionTitle, color: AppColors.MEDIUM_GRAY),
        Gap(20.h),
        Divider(
          color: AppColors.LIGHT_GRAY_2,
          thickness: 3.h,
        ),
        // Gap(20.h),
        Flexible(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: builder.length,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 15.w,
                childAspectRatio: 116 / 108),
            itemBuilder: (context, index) {
              List<String> words = builder.keys.toList()[index].split('\n');
              return Opacity(
                  opacity:
                      builder.values.toList()[index]["badge"] != null ? 1 : 0.5,
                  child: Stack(
                    children: [
                      // background shadow
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(13).r,
                          bottomLeft: const Radius.circular(13).r,
                          bottomRight: const Radius.circular(13).r,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: -120.w,
                              top: -20.h,
                              child: ClipOval(
                                child: Container(
                                    width: 198,
                                    height: 219,
                                    color: AppColors.VERY_LIGHT_GRAY),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // content
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, bottom: 15)
                                .r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // badges
                            Flexible(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: builder.values.toList()[index]
                                              ["icon"] ??
                                          const Placeholder(
                                            color: AppColors.SALMON_PINK,
                                          )),
                                  Visibility(
                                    visible: builder.values.toList()[index]
                                            ["badge"] !=
                                        null,
                                    child: Positioned(
                                        left: 23.w,
                                        top: -10.h,
                                        child: builder.values.toList()[index]
                                                ["badge"] ??
                                            const SizedBox.shrink()),
                                  )
                                ],
                              ),
                            ),

                            // text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  text: words[0],
                                  fontFamily: FontFamily.lexend,
                                  weight: FontWeight.w300,
                                  size: 10,
                                  lineHeight: 12.5,
                                ),
                                CustomTextWidget(
                                  text: words[1],
                                  fontFamily: FontFamily.lexend,
                                  weight: FontWeight.w500,
                                  size: 10,
                                  lineHeight: 12.5,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            },
          ),
        )
      ],
    );
  }
}
