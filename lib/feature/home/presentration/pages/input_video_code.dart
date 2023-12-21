import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:clicktwaek/feature/splash_onboarding/data/local/onboarding_images.dart';
import 'package:flutter/material.dart';

import '../../../splash_onboarding/presentation/pages/referal_code.dart';

class VideoCode extends StatelessWidget {
  const VideoCode({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWithArrowAndIcon(),
            SizedBox(height: size.height * 0.13),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: const AppText(text: 'Enter Video code', size: 16)),
            SizedBox(height: size.height * 0.015),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: const AppTextField()),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: AppButton(
                  child: AppText(
                      text: 'Continue ',
                      color: Appcolors.yellow,
                      size: 14,
                      fontweight: FontWeight.w500),
                  ontap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SuccessDialog();
                        });
                    // return context.read<OnboardingCubit>().addUserInfo();
                  }),
            ),
            SizedBox(height: size.height * 0.025),
          ],
        ));
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          color: Appcolors.white,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size.height * 0.015),
              Image.asset(OnboardingImages.splash),
              SizedBox(height: size.height * 0.015),
              AppText(
                  text: 'Congratulations!',
                  fontweight: FontWeight.w800,
                  size: 20,
                  color: Appcolors.blue),
              SizedBox(height: size.height * 0.015),
              AppText(text: 'You watched the video', size: 20),
              SizedBox(height: size.height * 0.015),
              const AppText(
                  textalign: TextAlign.center,
                  text: 'Click OK to see changes in your\n balance',
                  size: 14),
              SizedBox(height: size.height * 0.03),
              AppButton(
                  width: size.width * 0.45,
                  child: AppText(
                      text: 'Ok',
                      fontweight: FontWeight.w500,
                      size: 16,
                      color: Appcolors.yellow)),
              SizedBox(height: size.height * 0.025),
            ],
          ),
        ));
  }
}

class FialedDialog extends StatelessWidget {
  const FialedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          color: Appcolors.white,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size.height * 0.015),
              Image.asset(OnboardingImages.splash),
              SizedBox(height: size.height * 0.015),
              AppText(
                  text: 'Failed',
                  fontweight: FontWeight.w800,
                  size: 20,
                  color: Appcolors.blue),
              SizedBox(height: size.height * 0.015),
              AppText(text: 'You didn\'t watch the video', size: 20),
              SizedBox(height: size.height * 0.015),
              const AppText(
                  textalign: TextAlign.center,
                  text:
                      'Go to youtube and watch the video in full to rereceive the code',
                  size: 14),
              SizedBox(height: size.height * 0.03),
              AppButton(
                  width: size.width * 0.45,
                  child: AppText(
                      text: 'Ok',
                      fontweight: FontWeight.w500,
                      size: 16,
                      color: Appcolors.yellow)),
              SizedBox(height: size.height * 0.025),
            ],
          ),
        ));
  }
}
