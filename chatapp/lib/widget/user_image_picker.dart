import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});
  @override
  State<UserImagePicker> createState() {
    return UserImagePickerState();
  }
}

class UserImagePickerState extends State<UserImagePicker> {
File? _pickedImage;

pickImage()  async {
   final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);

  if(pickedImage != null) {
   setState(() {
     _pickedImage = File(pickedImage.path);
   });
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40, 
          backgroundColor: Colors.black54,
          foregroundImage: _pickedImage == null ? null : FileImage(_pickedImage!),
          ),
        TextButton.icon(
            onPressed: () {
              
            },
            label: Text('Add Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
            icon: Icon(Icons.image)),
      ],
    );
  }
}
