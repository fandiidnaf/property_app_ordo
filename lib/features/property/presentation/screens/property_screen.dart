import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bottom_navbar/widget/bottom_navbar_widget.dart';
import '../../../../utils/const/color.dart';
import '../widgets/custom_gap.dart';
import 'section/ads_section.dart';
import 'section/body_section.dart';
import 'section/header_section.dart';

// class PropertyScreen extends StatefulWidget {
//   const PropertyScreen({super.key});
//   @override
//   State<PropertyScreen> createState() => _PropertyState();
// }

// class _PropertyState extends State<PropertyScreen> {
//   late PropertyBloc _bloc;

//   @override
//   void initState() {
//     super.initState();
//     _bloc = getIt<PropertyBloc>();
//     _bloc.add(PropertyEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _bloc,
//       child: BlocBuilder<PropertyBloc, PropertyState>(
//         builder: (context, state) {
//           return Scaffold(
//             body: _buildBody(state),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildBody(PropertyState state) {
//     if (state is PropertyLoading) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (state is PropertyLoaded) {
//       return Placeholder(); // Replace with your actual widget
//     } else if (state is PropertyError) {
//       return Center(
//         child: Text('Error: '),
//       );
//     } else {
//       return Container();
//     }
//   }
// }

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GRAY,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40).r,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            CustomGap(),
            AdsSection(),
            CustomGap(),
            Expanded(child: BodySection())
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}
