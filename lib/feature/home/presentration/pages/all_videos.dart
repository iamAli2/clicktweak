import 'package:clicktwaek/constants/appcolors.dart';
import 'package:clicktwaek/constants/appscaffold.dart';
import 'package:clicktwaek/feature/home/presentration/src/home_exports.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans_details.dart';
import 'package:flutter/material.dart';

class AllVideos extends StatelessWidget {
  const AllVideos({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.white,
        body: Column(
          children: [
            const AppBarWithArrowAndIcon(),
            SizedBox(height: size.height * 0.015),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    5,
                    (index) => Padding(
                          padding: EdgeInsets.only(bottom: size.width * 0.02),
                          // child: const HomeVideo(),
                        )),
              ),
            ))
          ],
        ));
  }
}
