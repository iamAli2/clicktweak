import 'package:clicktwaek/config/page%20route/detail/route_name.dart';
import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../src/home_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<OnboardingCubit>().getvideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Appcolors.redColor)),
        key: scaffolKey,
        drawer: const NavDrawer(),
        backgroundColor: Appcolors.white.withOpacity(0.1),
        body: Column(
          children: [
            HomeAppbar(ontap: () => scaffolKey.currentState?.openDrawer()),
            SizedBox(height: size.height * 0.025),
            const HomeBalance(),
            SizedBox(height: size.height * 0.025),
            HomeVideo(
              ontap: () => lauchyoutube(
                  youtube: context.read<OnboardingCubit>().videos.last.url!),
            ),
            SizedBox(height: size.height * 0.025),
            const HomeProgressIndicator(),
            SizedBox(height: size.height * 0.023),
            const HomePlan(),
            SizedBox(height: size.height * 0.06),
            AppButton(
              width: size.width * 0.86,
              child: AppText(
                  text: 'Claim reward ',
                  size: 20,
                  fontweight: FontWeight.w700,
                  color: Appcolors.yellow),
              ontap: () {
                Navigator.pushNamed(context, RouteName.videoInputCode);
              },
            )
          ],
        ));
  }

  lauchyoutube({required String youtube}) async {
    final video = Uri.parse(youtube);
    if (await canLaunchUrl(video)) {
      launchUrl(video);
    } else {
      throw 'Could not launch $video';
    }
  }
}
