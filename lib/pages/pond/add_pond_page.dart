import 'dart:async';

import 'package:fish/pages/component/pond_card.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/pages/pond/shape_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'material_controller.dart';

class AddPondPage extends StatelessWidget {
  const AddPondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PondController controller = Get.put(PondController());
    TextEditingController aliasController = TextEditingController(text: '');
    TextEditingController locationController = TextEditingController(text: '');
    MaterialController materialController = MaterialController();
    ShapeController shapeController = ShapeController();
    TextEditingController diameterController = TextEditingController(text: '');
    TextEditingController lengthController = TextEditingController(text: '');
    TextEditingController widthController = TextEditingController(text: '');
    TextEditingController heightController = TextEditingController(text: '');

    Widget aliasInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alias',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Expanded(
                  child: TextFormField(
                    style: primaryTextStyle,
                    controller: aliasController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'ex: Alpha',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget locationInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Expanded(
                  child: TextFormField(
                    style: primaryTextStyle,
                    controller: locationController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'ex: Blok A',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget materialInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Material',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Expanded(
                  child: Obx(() => DropdownButtonFormField<String>(
                        onChanged: (newValue) =>
                            materialController.setSelected(newValue!),
                        value: materialController.selected.value,
                        items: materialController.listMaterial.map((material) {
                          return DropdownMenuItem<String>(
                            value: material,
                            child: Text(
                              material,
                              style: primaryTextStyle,
                            ),
                          );
                        }).toList(),
                        dropdownColor: backgroundColor5,
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget shapelInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bentuk',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Expanded(
                  child: Obx(() => DropdownButtonFormField<String>(
                        onChanged: (newValue) =>
                            shapeController.setSelected(newValue!),
                        value: shapeController.selected.value,
                        items: shapeController.listMaterial.map((shape) {
                          return DropdownMenuItem<String>(
                            value: shape,
                            child: Text(
                              shape,
                              style: primaryTextStyle,
                            ),
                          );
                        }).toList(),
                        dropdownColor: backgroundColor5,
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget heightInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tinggi (meter)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Expanded(
                  child: TextFormField(
                    style: primaryTextStyle,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'ex: 2',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget lengthInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panjang (meter)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Expanded(
                  child: TextFormField(
                    style: primaryTextStyle,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    controller: lengthController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'ex: 2',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget widthInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lebar (meter)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Expanded(
                  child: TextFormField(
                    style: primaryTextStyle,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    controller: widthController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'ex: 2',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget diameterInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diameter (meter)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Expanded(
                  child: TextFormField(
                    style: primaryTextStyle,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    controller: diameterController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'ex: 2',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget registerButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Registrasi',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget persegiInput() {
      return ListView(
        children: [
          lengthInput(),
          widthInput(),
        ],
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Registrasi Kolam"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              aliasInput(),
              locationInput(),
              materialInput(),
              shapelInput(),
              // Obx(() {
              //   return shapeController.selected.value == 'bundar'
              //       ? diameterInput()
              //       : persegiInput();
              // }),
              heightInput(),
              registerButton(),
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
