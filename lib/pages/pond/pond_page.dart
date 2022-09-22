import 'dart:async';

import 'package:fish/pages/component/pond_card.dart';
import 'package:fish/pages/pond/add_pond_page.dart';
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
          'Kolam',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget pondList() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              PondCard(
                pond: "Alpha",
                activation_date: "01-09-2022",
                activation_count: 90,
                fish: 200,
                status: "Aktif",
                color: Colors.green,
              ),
              PondCard(
                pond: "Beta",
                activation_date: "-",
                activation_count: 0,
                fish: 0,
                status: "Tidak Aktif",
                color: alertColor,
              ),
              PondCard(
                pond: "Charlie",
                activation_date: "-",
                activation_count: 0,
                fish: 0,
                status: "Panen",
                color: Colors.amber,
              ),
              PondCard(
                pond: "Delta",
                activation_date: "-",
                activation_count: 0,
                fish: 0,
                status: "Panen",
                color: Colors.amber,
              ),
            ],
          ),
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          backgroundColor: backgroundColor1,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddPondPage());
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
          ),
          body: ListView(
            children: [
              title(),
              pondList(),
              SizedBox(
                height: 10,
              )
            ],
          ),
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
