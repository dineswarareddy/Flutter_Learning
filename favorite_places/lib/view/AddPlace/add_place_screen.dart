import 'package:favorite_places/model/location_model.dart';
import 'package:favorite_places/model/places_model.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/view/ImagePicker/image_picker_view.dart';
import 'package:favorite_places/view/LocationPicker/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});

  @override
  ConsumerState<AddNewPlace> createState() {
    return AddNewPlaceState();
  }
}

class AddNewPlaceState extends ConsumerState<AddNewPlace> {
  final _formKey = GlobalKey<FormState>();
  String _enteredPlaceName = '';
  File? imageSelected;
  LocationModel? locationSelected;

  imagePicked(File selectedImage) {
    imageSelected = selectedImage;
  }

  locationPicked(LocationModel location) {
    locationSelected = location;
  }

  validateInputsFields(
      {required BuildContext context, required WidgetRef ref}) {
    if (imageSelected == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Upload image'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }
    if (_formKey.currentState!.validate() && imageSelected != null) {
      _formKey.currentState!.save();
      final modelToAdd = PlacesModel(
          placeName: _enteredPlaceName,
          imageFile: imageSelected!,
          location: locationSelected!);
      ref.read(placesProvider.notifier).addPlaceToList(place: modelToAdd);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 30,
              children: [
                TextFormField(
                  decoration: InputDecoration(label: Text('Title')),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                  maxLength: 30,
                  onSaved: (input) {
                    _enteredPlaceName = input ?? '';
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter Place Name';
                    }
                  },
                ),
                ImagePickerView(pickedImage: imagePicked),
                LocationInput(locationPicked: locationPicked),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: 150,
                    //   child:
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          validateInputsFields(context: context, ref: ref);
                        },
                        child: Row(
                          spacing: 20,
                          children: [Icon(Icons.add), Text('Add Place')],
                        ),
                      ),
                    ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
