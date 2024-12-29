import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key, required this.pickedImage});

  final void Function(File image) pickedImage;

  @override
  State<ImagePickerView> createState() {
    return ImagePickerViewState();
  }
}

class ImagePickerViewState extends State<ImagePickerView> {
  File? selectedImageFile;

  pickImage() async {
    final imagePickerObj = ImagePicker();
    final pickedImage = await imagePickerObj.pickImage(
        source: ImageSource.camera, maxWidth: 600);
    if (pickedImage != null) {
      setState(() {
        selectedImageFile = File(pickedImage.path);
      });
      widget.pickedImage(selectedImageFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ElevatedButton.icon(
        onPressed: pickImage,
        icon: Icon(Icons.camera),
        label: Text('Take Picture'));

    if (selectedImageFile != null) {
      content = GestureDetector(
        onTap: pickImage,
        child: Image.file(selectedImageFile!,
            fit: BoxFit.cover, width: double.infinity, height: double.infinity),
      );
    }

    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 0.5, color: Colors.white)),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
