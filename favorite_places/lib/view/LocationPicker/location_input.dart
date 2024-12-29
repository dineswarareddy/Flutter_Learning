import 'dart:convert';
import 'dart:io';

import 'package:favorite_places/model/location_model.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.locationPicked});
  final void Function(LocationModel location) locationPicked;

  @override
  State<StatefulWidget> createState() {
    return LocationInputState();
  }
}

class LocationInputState extends State<LocationInput> {
  bool _isLocationLoading = false;

  final String _googlePlacesKey = 'AIzaSyDHsI2Gp5k3p3Q4DzU-kWxSuZmGqS2We8c';

  LocationModel? _pickedLocation;
  String get locationImage {
    final lat = _pickedLocation?.latitude;
    final long = _pickedLocation?.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center$lat,$long=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$long&key=$_googlePlacesKey';
  }

  getCurrentLocation() async {
    Location location = new Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isLocationLoading = true;
    });
    locationData = await location.getLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
      return;
    }

    print('got the location $locationData');
    final uri = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${locationData.latitude},${locationData.longitude}&key=$_googlePlacesKey');
    final response = await http.get(uri);
    final responsedata = json.decode(response.body);
    final address = responsedata['results'][0]['formatted_address'];
    print('got the address from URL $address');
    final locationSelected = LocationModel(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
        address: address);
    setState(() {
      _pickedLocation = locationSelected;
    });
    widget.locationPicked(locationSelected);

    setState(() {
      _isLocationLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContainer = Text(
      'Select location',
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
    if (_isLocationLoading) {
      previewContainer = CircularProgressIndicator();
    }

    if (_pickedLocation != null) {
      setState(() {
        previewContainer = Image.network(locationImage,
            fit: BoxFit.cover, height: double.infinity, width: double.infinity);
      });
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.white),
          ),
          child: previewContainer,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () {
                getCurrentLocation();
              },
              icon: Icon(Icons.location_on),
              label: Text(
                'Get Current Location',
                maxLines: 2,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text(
                'Select on Map',
                maxLines: 2,
              ),
            ),
          ],
        )
      ],
    );
  }
}
