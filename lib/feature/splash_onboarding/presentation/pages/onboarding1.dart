import 'package:clicktwaek/config/page%20route/detail/route_name.dart';
import 'package:clicktwaek/feature/splash_onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/export.dart';
import '../../data/local/onboarding_images.dart';

class FirstOnboard extends StatefulWidget {
  const FirstOnboard({super.key});

  @override
  State<FirstOnboard> createState() => _FirstOnboardState();
}

class _FirstOnboardState extends State<FirstOnboard> {
  @override
  void initState() {
    context.read<OnboardingCubit>().auth.authStateChanges().listen((event) {
      context.read<OnboardingCubit>().user = event;
    });
    context.read<OnboardingCubit>().checkUserSigin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingSigin) {
          Navigator.pushNamed(context, RouteName.referCodeInput);
        }
      },
      child: AppScaffold(
        color: Appcolors.white,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.15),
            Image.asset(OnboardingImages.splash,
                height: size.height * 0.1, fit: BoxFit.cover),
            SizedBox(height: size.height * 0.02),
            const Center(
                child: AppText(
                    textalign: TextAlign.center,
                    text: 'CLICKTWAEK',
                    size: 16,
                    fontweight: FontWeight.w900)),
            SizedBox(height: size.height * 0.2),
            const AppText(
                textalign: TextAlign.center,
                size: 16,
                text: 'Sign in with your google\naccount'),
            SizedBox(height: size.height * 0.035),
            AppButton(
                width: size.width * 0.4,
                child: AppText(
                    text: 'G+ LOGIN',
                    size: 20,
                    fontweight: FontWeight.w700,
                    color: Appcolors.yellow),
                ontap: () async {
                  // Navigator.pushNamed(context, RouteName.referCodeInput);
                  await context.read<OnboardingCubit>().googleSignIn();
                })
          ],
        ),
      ),
    );
  }
}
//  