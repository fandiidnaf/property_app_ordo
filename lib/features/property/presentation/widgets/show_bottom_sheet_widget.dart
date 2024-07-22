import 'package:flutter/material.dart';
import '../../../../utils/const/color.dart';

import '../../domain/entities/property.dart';
import 'build_bottom_sheet_widget.dart';

void showBottomSheetWidget(BuildContext context, int index,
    {TahapPemesanan? tahapPemesanan,
    TahapAdministrasi? tahapAdministrasi,
    TahapPembangunan? tahapPembangunan,
    TahapAkadSerahTerima? tahapAkadSerahTerima}) {
  BuildBottomSheetWidget bottomSheet = BuildBottomSheetWidget();
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    backgroundColor: AppColors.WHITE,
    builder: (context) {
      switch (index) {
        case 0:
          return bottomSheet.getTahapPemesanan(tahapPemesanan!.menu!);
        case 1:
          return bottomSheet.getTahapAdministrasi(tahapAdministrasi!.menu!);
        case 2:
          return bottomSheet.getTahapPembangunan(tahapPembangunan!.menu!);
        case 3:
          return bottomSheet
              .getTahapAkadSerahTerima(tahapAkadSerahTerima!.menu!);
        default:
          return const SizedBox.shrink();
      }
    },
  );
}
