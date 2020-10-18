import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final picker = ImagePicker();

class User with ChangeNotifier {
  String name = "Roncy R Thomas";
  String pno = "9048329299";
  String image = "images/86518.png";
  String imagePath;
  String isDefaultImage = "true";
  SharedPreferences details;

  void getInstance() async {
    details = await SharedPreferences.getInstance();
  }

  ImageProvider<Object> getImage() =>
      isDefaultImage == "true" ? AssetImage(image) : FileImage(File(imagePath));
  String getName() => name;
  String getNumber() => pno;

  void updateName(String name) async {
    details = await SharedPreferences.getInstance();
    this.name = name;
    details.setString("name", name);
    print(details.get('name'));
    notifyListeners();
  }

  void updateNumber(String pno) async {
    details = await SharedPreferences.getInstance();
    this.pno = pno;
    details.setString("pno", pno);
    print(details.get('name'));
    notifyListeners();
  }

  Future<void> pickImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    details = await SharedPreferences.getInstance();
    imagePath = image.path;
    isDefaultImage = "false";
    details.setString("image", imagePath);
    details.setString("pic", "false");
    print(details.get('image'));
    notifyListeners();
  }

  void readName() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('name') ?? '';
    value == '' ? name = 'Roncy R Thomas' : name = value;
    notifyListeners();
  }

  void readNumber() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('pno') ?? '';
    value == '' ? pno = '9048329299' : pno = value;
    notifyListeners();
  }

  Future<void> readImage() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('image') ?? '';
    value == '' ? image = 'images/86518.png' : imagePath = value;
    if (value != '') {
      isDefaultImage = "false";
      prefs.setString("check", "false");
    }
    notifyListeners();
  }

  void reset() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    prefs.remove("pno");
    prefs.remove("image");
    prefs.remove("pic");
    isDefaultImage = "true";
    notifyListeners();
  }
}
