import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/export.dart';
import '../bloc/cubit/onboarding_cubit.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final watchOnboarding = context.watch<OnboardingCubit>();
    final readOnboarding = context.read<OnboardingCubit>();

    return Scaffold(
        body: watchOnboarding.screens
            .elementAt(watchOnboarding.bottonnavSelectedIndex),
        bottomNavigationBar: Container(
          height: size.height * 0.12,
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: size.width * 0.03, vertical: size.width * 0.042),
          decoration: BoxDecoration(
              color: Appcolors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x07000000),
                  blurRadius: 10,
                  offset: Offset(0, -10),
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(size.width * 0.05),
                  topLeft: Radius.circular(size.width * 0.1))),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.width * 0.02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.03),
                color: Appcolors.lightgrey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomnavIcon(
                    isActive: watchOnboarding.bottonnavSelectedIndex == 0,
                    icon: Icons.home,
                    title: 'Home',
                    onTap: () {
                      readOnboarding.changebottomnavindex(index: 0);
                    }),
                BottomnavIcon(
                    isActive: watchOnboarding.bottonnavSelectedIndex == 1,
                    icon: Icons.home,
                    title: 'Plans',
                    onTap: () {
                      readOnboarding.changebottomnavindex(index: 1);
                    }),
                BottomnavIcon(
                    isActive: watchOnboarding.bottonnavSelectedIndex == 2,
                    icon: Icons.home,
                    title: 'Channels',
                    onTap: () {
                      readOnboarding.changebottomnavindex(index: 2);
                    }),
                BottomnavIcon(
                    isActive: watchOnboarding.bottonnavSelectedIndex == 3,
                    icon: Icons.home,
                    title: 'Withdraw',
                    onTap: () {
                      readOnboarding.changebottomnavindex(index: 3);
                    }),
              ],
            ),
          ),
        ));
  }
}

class BottomnavIcon extends StatelessWidget {
  const BottomnavIcon(
      {super.key,
      this.isActive = false,
      required this.title,
      required this.icon,
      this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon,
              size: 25.sp,
              color: isActive
                  ? Appcolors.redColor
                  : Appcolors.blackColor.withOpacity(0.5)),
          AppText(
              text: title,
              size: 12,
              color: isActive
                  ? Appcolors.redColor
                  : Appcolors.blackColor.withOpacity(0.5))
        ],
      ),
    );
  }
}





// BottomNavigationBar(
//         unselectedItemColor: Appcolors.lightgrey,
//         selectedItemColor: Appcolors.orange,
//         backgroundColor: Appcolors.blue,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.shifting,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home_repair_service, size: 35.sp),
//               label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.message, size: 35.sp), label: 'Messages'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.assignment, size: 35.sp), label: 'Booking'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle, size: 35.sp), label: 'Profile')
//         ],
//         currentIndex: watchOnboarding.bottonnavSelectedIndex,
//         onTap: (value) {
//           readOnboarding.changebottomnavindex(index: value);
//         },
//       ),