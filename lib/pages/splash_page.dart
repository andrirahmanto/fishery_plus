import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fish/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logo.png',
                ),
              ),
            ),
          ),
          Text(
            "FISHERY+",
            style: blueTextStyle.copyWith(
              fontSize: 26,
              fontWeight: bold,
            ),
          ),
          Text(
            "by JFT",
            style: secondaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ]),
      ),
    );
  }
}
