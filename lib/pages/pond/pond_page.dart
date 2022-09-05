import 'dart:async';

import 'package:fish/pages/pond/pond_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class PondPage extends StatelessWidget {
  const PondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PondController controller = Get.put(PondController());

    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Home',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return ListView(
          children: [
            title(),
            SizedBox(
              height: 10,
            )
          ],
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        );
      }
    });
  }
}
