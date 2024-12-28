import 'package:favorite_places/model/places_model.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddNewPlace extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  String _enteredPlaceName = '';

  validateInputsFields(
      {required BuildContext context, required WidgetRef ref}) {
    _formKey.currentState!.save();
    final modelToAdd =
        PlacesModel(id: Uuid().toString(), placeName: _enteredPlaceName);
    ref.read(placesProvider.notifier).addPlaceToList(place: modelToAdd);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 30,
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Title')),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                maxLength: 30,
                onSaved: (input) {
                  _enteredPlaceName = input ?? '';
                },
                validator: (value) {
                  if (value != null && value.length > 1) {
                    return 'Enter Place Name';
                  }
                },
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      validateInputsFields(context: context, ref: ref);
                    },
                    child: Row(
                      spacing: 20,
                      children: [Icon(Icons.add), Text('Add Place')],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
