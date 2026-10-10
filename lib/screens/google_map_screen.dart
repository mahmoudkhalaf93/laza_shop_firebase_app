import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  // Coordinates for Cairo, Egypt
  final LatLng _cairoLocation = const LatLng(30.0444, 31.2357);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _cairoLocation,
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('cairo_marker'),
            position: _cairoLocation,
            infoWindow: const InfoWindow(title: 'Cairo, Egypt'),
          ),
        },
      ),
    );
  }
}
