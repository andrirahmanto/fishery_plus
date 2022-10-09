import 'dart:async';

import 'package:fish/pages/component/death_card.dart';
import 'package:fish/pages/fish/fish_recap_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/fish/fish_death_entry_page.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class FishRecapPage extends StatelessWidget {
  const FishRecapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FishRecapController controller = Get.put(FishRecapController());

    Widget fishDataRecap() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kolam Alpha",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: heavy,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget entryDeathButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FishDeathEntryPage()));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Entry Kematian Ikan',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget detail() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumlah Ikan Hidup",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Nila Merah : 100 Ekor",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Lele : 100 Ekor",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumah Ikan Mati",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Nila Merah : 100 Ekor",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Lele : 100 Ekor",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget recapTitle() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 2, right: defaultMargin, left: defaultMargin),
        child: Text(
          "Rekapitulasi Kematian",
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    // Widget chartRecap() {
    //   return Container(
    //     width: double.infinity,
    //     margin: EdgeInsets.only(
    //         top: defaultSpace * 2, right: defaultMargin, left: defaultMargin),
    //     // decoration: BoxDecoration(
    //     //     image: DecorationImage(image: AssetImage('assets/feedChart.png'))),
    //   );
    // }

    Widget listDeath() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: [
              DeathCard(
                date: "10-07-2022",
                type: "Lele",
                amount: 3,
              ),
              DeathCard(
                date: "09-08-2022",
                type: "Lele",
                amount: 3,
              ),
              DeathCard(
                date: "12-09-2022",
                type: "Lele",
                amount: 3,
              ),
              DeathCard(
                date: "03-10-2022",
                type: "Lele",
                amount: 3,
              ),
            ],
          ));
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Rekapitulasi Jumlah Kematian"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              fishDataRecap(),
              detail(),
              // sizingSec(),
              entryDeathButton(),
              recapTitle(),
              // chartRecap(),
              listDeath(),
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
