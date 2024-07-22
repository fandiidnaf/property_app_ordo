import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../utils/const/color.dart';
import '../../../../../../utils/text_widget.dart';
import '../../../bloc/property_bloc.dart';
import '../../../widgets/container_transaction_menu_widget.dart';
import '../../../widgets/slider_loaded_property.dart';

class LoadedPropertyState extends StatelessWidget {
  const LoadedPropertyState(this.state, {super.key});

  final PropertyLoaded state;

  @override
  Widget build(BuildContext context) {
    var listTahapan = <Widget>[
      ContainerTransactionMenuWidget(
          namaTahap: "Tahap Pemesanan",
          img: Assets.images.tahapPemesanan.path,
          percentage: state.property.property[state.index].transaction!
              .tahapPemesanan!.progress!,
          transaction: state.property.property[state.index].transaction!,
          backgroundColor: AppColors.DARK_OLIVE_GREEN,
          scale: 1,
          leftShadow: 56.w, // or 52.r
          bottomShadow: -37.h, // or -16.r

          index: 0),
      ContainerTransactionMenuWidget(
          namaTahap: "Tahap Administrasi",
          img: Assets.images.tahapAdministrasi.path,
          transaction: state.property.property[state.index].transaction!,
          percentage: state.property.property[state.index].transaction!
              .tahapAdministrasi!.progress!,
          scale: 0.8,
          leftShadow: -38.w,
          topShadow: 73.h,
          index: 1),
      ContainerTransactionMenuWidget(
          namaTahap: "Tahap Pembangunan",
          img: Assets.images.tahapPembangunan.path,
          transaction: state.property.property[state.index].transaction!,
          percentage: state.property.property[state.index].transaction!
              .tahapPembangunan!.progress!,
          scale: 0.8,
          leftShadow: -42.w,
          topShadow: 77.h,
          index: 2),
      ContainerTransactionMenuWidget(
          namaTahap: "Tahap Akad & Serah Terima",
          img: Assets.images.tahapAkadSerahTerima.path,
          transaction: state.property.property[state.index].transaction!,
          percentage: state.property.property[state.index].transaction!
              .tahapAkadSerahTerima!.progress!,
          scale: 0.8,
          leftShadow: -35.w,
          topShadow: 70.h,
          imgAlign: Alignment.bottomCenter,
          index: 3)
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // pesanan text dan icon arrow right
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    text: 'Pesanan Terbaru',
                    weight: FontWeight.w500,
                    size: 18,
                    lineHeight: 22.68,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    text: 'Daftar pesanan terbaru anda',
                    color: AppColors.SILVER,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                context.read<PropertyBloc>().add(RemovePropertyEvent());
              },
              child: SvgPicture.asset(
                Assets.icons.arrowRight,
                colorFilter: const ColorFilter.mode(
                    AppColors.DARK_OLIVE_GREEN, BlendMode.srcIn),
              ),
            )
          ],
        ),

        // content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(20.h),

                // slider property
                SliderLoadedProperty(state),

                Gap(10.h),

                // indicator slider
                DotsIndicator(
                  dotsCount: state.property.property.length,
                  position: state.index,
                  decorator: DotsDecorator(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          side:
                              const BorderSide(color: AppColors.LIGHT_GRAY_2)),
                      size: Size(15.w, 3.h),
                      activeSize: Size(19.w, 3.h),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          side: const BorderSide(
                              color: AppColors.DARK_OLIVE_GREEN)),
                      spacing: EdgeInsets.only(right: 4.w)),
                ),

                Gap(25.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // column text
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Menu',
                          weight: FontWeight.w500,
                          size: 18,
                          lineHeight: 22.68,
                        ),
                        CustomTextWidget(
                          text: 'Daftar menu transaksi',
                          color: AppColors.MEDIUM_GRAY,
                        )
                      ],
                    ),
                    // icon
                    SvgPicture.asset(
                      Assets.icons.twotoonCategory,
                      width: 24.r,
                      height: 24.r,
                      colorFilter: const ColorFilter.mode(
                          AppColors.DARK_OLIVE_GREEN, BlendMode.srcIn),
                    )
                  ],
                ),

                Gap(20.h),

                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 181.5 / 174),
                  itemBuilder: (context, index) {
                    return listTahapan[index];
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
