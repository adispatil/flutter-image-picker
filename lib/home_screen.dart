import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _mController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return _mController.selectedImagePath.value.isEmpty
                      ? const Text('Select image from camera or gallery')
                      : Image.file(File(_mController.selectedImagePath.value));
                }),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => _mController.selectedImageSize.value.isEmpty
                      ? const Text('')
                      : Text('Size : ${_mController.selectedImageSize.value}'),
                ),
                Obx(
                      () => _mController.selectedImageSize.value.isEmpty
                      ? const Text('')
                      : Text('path : ${_mController.selectedImagePath.value}'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _mController.getImage(ImageSource.camera);
                  },
                  child: const Text('Camera'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _mController.getImage(ImageSource.gallery);
                  },
                  child: const Text('Gallery'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
