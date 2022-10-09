import 'dart:async';

import 'package:fish/pages/component/death_card.dart';
import 'package:fish/pages/fish/fish_recap_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/fish/fish_death_entry_page.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class FishRecapPage extends StatelessWidget {
  const FishRecapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FishRecapController controller = Get.put(FishRecapController());

    Widget chartDeath() {
      return Container(
        child: SfCartesianChart(
          enableAxisAnimation: true,
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          title: ChartTitle(
              text: 'Jumlah Ikan Hidup',
              textStyle: TextStyle(color: Colors.white)),
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(color: Colors.white)),
          primaryXAxis: CategoryAxis(
              labelStyle: TextStyle(color: Colors.white),
              maximumLabels: 20,
              autoScrollingDelta: 4),
          primaryYAxis: NumericAxis(
              // maximum: 100,
              // minimum: 0,
              labelStyle: TextStyle(color: Colors.white)),
          series: <ChartSeries>[
            LineSeries<FishLiveData, dynamic>(
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
                color: Colors.amber,
                dataSource: controller.charData,
                xValueMapper: (FishLiveData fish, _) => fish.date,
                yValueMapper: (FishLiveData fish, _) => fish.amount,
                name: 'Ikan Hidup')
          ],
        ),
      );
    }
    // Widget chartDeath() {
    //   return Container(
    //       padding: EdgeInsets.only(top: 10, bottom: 10),
    //       width: double.infinity,
    //       height: 200,
    //       margin: EdgeInsets.only(
    //           top: defaultSpace, right: defaultMargin, left: defaultMargin),
    //       child: LineChart(
    //         LineChartData(minX: 0, maxX: 11, minY: 0, maxY: 6,
    //          borderData: FlBorderData(show: true,
    //          border: ),
    //          lineBarsData: [
    //           LineChartBarData(spots: [
    //             FlSpot(0, 3),
    //             FlSpot(1, 2),
    //             FlSpot(2, 6),
    //           ], color: Colors.amber),
    //           LineChartBarData(spots: [
    //             FlSpot(0, 1),
    //             FlSpot(1, 4),
    //             FlSpot(2, 3),
    //           ], color: Colors.red)
    //         ]),
    //       ));
    // };

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
      List<FishLiveData> _chartData;
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Rekapitulasi Jumlah Kematian"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              chartDeath(),
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
