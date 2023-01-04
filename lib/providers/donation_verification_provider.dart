import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DonationVerificationProvider extends ChangeNotifier {
  File? image;
  String? nameImage;

  //gallery
  Future activateGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final imageTemp = File(image.path);

    //
    nameImage = image.name;
    this.image = imageTemp;

    notifyListeners();
  }

  //clean image
  Future cleanImage() async {
    image = null;
    notifyListeners();
  }
}
