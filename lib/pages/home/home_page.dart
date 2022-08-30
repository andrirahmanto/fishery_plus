import 'dart:async';

import 'package:fish/pages/component/fish_card.dart';
import 'package:fish/pages/component/statistic_card.dart';
import 'package:fish/pages/component/water_card.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    Widget statistic() {
      return Container(
          margin: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Kolam',
                        value: 20,
                      )),
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Kolam Aktif',
                        value: 10,
                      )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Ikan Hidup',
                        value: 182,
                        unit: 'Ekor',
                      )),
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Ikan Mati',
                        value: 89,
                        unit: 'Ekor',
                      )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Panen 2022',
                        value: 109,
                        unit: 'Kg',
                      )),
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Total Pakan',
                        value: 223,
                        unit: 'Kg',
                      )),
                ],
              ),
            ],
          ));
    }

    Widget fishTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultSpace,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Berat Ikan',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget fish() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(children: [
                FishCard(
                  title: "Lele",
                  value: 200,
                  image: "assets/lele.png",
                ),
                FishCard(
                  title: "Nila Merah",
                  value: 200,
                  image: "assets/nilamerah.png",
                ),
                FishCard(
                  title: "Nila Hitam",
                  value: 200,
                  image: "assets/nilahitam.png",
                ),
                FishCard(
                  title: "Mas",
                  value: 200,
                  image: "assets/mas.png",
                ),
              ]),
            ],
          ),
        ),
      );
    }

    Widget waterTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultSpace,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kualitas Air',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget water() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(children: [
                WaterCard(
                  title: "pH",
                  normal: 6,
                  abnormal: 6,
                ),
                WaterCard(
                  title: "DO",
                  normal: 6,
                  abnormal: 6,
                ),
                WaterCard(
                  title: "Flok",
                  normal: 6,
                  abnormal: 6,
                ),
              ]),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        title(),
        statistic(),
        fishTitle(),
        fish(),
        waterTitle(),
        water()
      ],
    );
  }
}
