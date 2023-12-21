import 'package:clicktwaek/constants/export.dart';
import 'package:clicktwaek/feature/minning/data/local/mining_images.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/pages/referal_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Minning extends StatelessWidget {
  const Minning({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Row(children: [
              Image.asset(MinningImage.icon),
              Padding(
                  padding: EdgeInsets.only(top: size.height * 0.015),
                  child: Image.asset(MinningImage.name)),
            ]),
            Divider(color: Appcolors.white, thickness: 2.sp),
            Expanded(
              child: Container(
                width: size.width,
                color: Appcolors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UpdateWallet(size: size),
                    SizedBox(height: size.height * 0.02),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        child: const AppText(
                            text: 'OVERVIEW',
                            size: 25,
                            fontweight: FontWeight.w600)),
                    Container(
                      width: size.width,
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      decoration: BoxDecoration(
                          color: Appcolors.blue,
                          borderRadius:
                              BorderRadius.circular(size.width * 0.03)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(MinningImage.name),
                          Row(
                            children: [
                              // Image.asset(MinningImage.plenty)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class UpdateWallet extends StatelessWidget {
  const UpdateWallet({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: Appcolors.blue,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(size.width * 0.045),
              bottomLeft: Radius.circular(size.width * 0.045))),
      child: Column(
        children: [
          const AppText(
              text: 'Enter your ROC wallet',
              size: 16,
              color: Color(0xFFBBB0B0),
              fontweight: FontWeight.w500),
          SizedBox(width: size.width * 0.5, child: AppTextField()),
          SizedBox(height: size.height * 0.02),
          AppButton(
            width: size.width * 0.65,
            buttoncolor: Appcolors.green,
            child: AppText(
                text: 'Update wallet',
                color: Appcolors.white,
                size: 16,
                fontweight: FontWeight.w500),
          ),
          SizedBox(height: size.height * 0.02),
          AppText(
              text: 'Your earnings willl be paid to this wallet ',
              size: 11,
              fontweight: FontWeight.w300,
              color: Appcolors.white),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}
