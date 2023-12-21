import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/page route/page_route.dart';
import '../../../../../constants/export.dart';
import '../../../data/home_images.dart';

class HomePlan extends StatelessWidget {
  const HomePlan({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          AppText(
              text: 'Plan \$ 0.56 ',
              size: 20,
              fontweight: FontWeight.w600,
              color: Appcolors.blackColor),
          const Icon(Icons.currency_bitcoin_rounded),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteName.allVideos),
            child: AppText(
                text: 'See all',
                size: 16,
                fontweight: FontWeight.w500,
                color: Appcolors.blue),
          )
        ],
      ),
    );
  }
}

class HomeProgressIndicator extends StatelessWidget {
  const HomeProgressIndicator({super.key, this.bgColor});
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          minHeight: size.height * 0.02,
          value: 0.5,
          valueColor: AlwaysStoppedAnimation(Appcolors.green),
          backgroundColor: bgColor ?? Appcolors.redColor),
    );
  }
}

class HomeVideo extends StatelessWidget {
  const HomeVideo({super.key, this.ontap});
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: ontap,
      child: AppshadowContainer(
          radius: 0,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          width: size.width,
          height: size.height * 0.2,
          color: Appcolors.blue),
    );
  }
}

class HomeBalance extends StatelessWidget {
  const HomeBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.03),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage(HomeImages.balbg))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.015),
          Image.asset(HomeImages.wlogo),
          SizedBox(height: size.height * 0.015),
          AppText(
              size: 24,
              text: ' Total Balance',
              fontweight: FontWeight.w600,
              color: Appcolors.white),
          SizedBox(height: size.height * 0.01),
          AppText(
              size: 32,
              text: '\$670',
              fontweight: FontWeight.w800,
              color: Appcolors.white),
          SizedBox(height: size.height * 0.01),
          AppText(
              size: 20, text: 'Total Earned \$1000', color: Appcolors.white),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, this.ontap});

  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AppshadowContainer(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.03),
      radius: 0,
      shadowcolour: Appcolors.white,
      color: Appcolors.redColor,
      child: Row(
        children: [
          GestureDetector(onTap: ontap, child: Image.asset(HomeImages.wlogo)),
          SizedBox(width: size.width * 0.025),
          AppText(
              size: 20,
              text: 'ClickTweak',
              fontweight: FontWeight.w900,
              color: Appcolors.white),
        ],
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Appcolors.redColor),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 30.sp),
                    SizedBox(height: size.height * 0.015),
                    AppText(
                        text: 'Suh Desmond',
                        size: 15,
                        fontweight: FontWeight.w900,
                        color: Appcolors.white),
                    AppText(
                        text: 'desmon454@gmail.com',
                        size: 13,
                        color: Appcolors.yellow)
                  ])),
          const SideBarInfo(icon: Icons.ac_unit, title: 'Deposit'),
          const SideBarInfo(icon: Icons.ac_unit, title: 'Plans'),
          const SideBarInfo(icon: Icons.ac_unit, title: 'Mining'),
          SideBarInfo(
              icon: Icons.support_agent,
              title: 'Support',
              ontap: () => Navigator.pushNamed(context, RouteName.support)),
          Divider(color: Appcolors.blackColor),
          const AppText(
              text: 'Settings', size: 14, fontweight: FontWeight.w500),
          const SideBarInfo(
              icon: Icons.switch_access_shortcut, title: 'Language '),
          Divider(color: Appcolors.blackColor),
          const AppText(
              text: 'Communicate ', size: 14, fontweight: FontWeight.w500),
          SideBarInfo(
              icon: Icons.no_accounts,
              title: 'Invite friends',
              ontap: () => Navigator.pushNamed(context, RouteName.refer)),
          const SideBarInfo(icon: Icons.ac_unit, title: 'Community '),
          const SideBarInfo(icon: Icons.star, title: 'Rate us '),
          Divider(color: Appcolors.blackColor),
          const AppText(text: 'Account', size: 14, fontweight: FontWeight.w500),
          const SideBarInfo(icon: Icons.headset_off, title: 'Log Out'),
          const SideBarInfo(icon: Icons.star, title: 'privacy Policy'),
        ],
      ),
    );
  }
}

class SideBarInfo extends StatelessWidget {
  const SideBarInfo(
      {super.key, required this.title, required this.icon, this.ontap});
  final String title;
  final IconData icon;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 25.sp),
      title: AppText(text: title, size: 14, fontweight: FontWeight.w500),
      onTap: ontap,
    );
  }
}
