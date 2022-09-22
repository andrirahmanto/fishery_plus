import 'package:flutter/material.dart';

import 'package:fish/theme.dart';
import 'package:get/get.dart';

import '../pond/detail_pond_page.dart';

class PondCard extends StatelessWidget {
  final String? pond;
  final String? activation_date;
  final num? activation_count;
  final num? fish;
  final String? status;
  final Color? color;

  const PondCard(
      {Key? key,
      this.pond,
      this.activation_date,
      this.activation_count,
      this.fish,
      this.status,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPondPage());
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        padding: EdgeInsets.all(defaultSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.pond!,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: this.color!,
                  ),
                  child: Center(
                    child: Text(
                      this.status!,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: heavy,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
            Divider(color: Colors.black),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Image.asset('assets/calendar_plus.png',
                      width: 25, color: blackColor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    this.activation_date!,
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Image.asset('assets/timesheet.png',
                      width: 25, color: blackColor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    this.activation_count!.toString() + " Hari",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Image.asset('assets/fish_transparent.png',
                      width: 25, color: blackColor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    this.fish!.toString() + " Ekor",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
