import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'device_info_screen.dart';
import 'multi_image_screen.dart';
import 'google_map_screen.dart';
import 'audio_feature_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // Profile specific assignment data
  final String _fallbackName = "mahmoud khalaf";
  final String _fallbackEmail = "mody@gmail.com";

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickProfileImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayName = currentUser?.displayName?.isNotEmpty == true
        ? currentUser!.displayName!
        : _fallbackName;

    final email = currentUser?.email?.isNotEmpty == true
        ? currentUser!.email!
        : _fallbackEmail;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image Section
            GestureDetector(
              onTap: _pickProfileImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? const Icon(Icons.camera_alt, size: 30, color: Colors.grey)
                    : null,
              ),
            ),
            const SizedBox(height: 16),

            // User Data Section
            Text(
              displayName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 32),
            const Divider(),

            // Device Features Navigation
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Device Information'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DeviceInfoScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Image Gallery'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MultiImageScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Google Map'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const GoogleMapScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.mic),
              title: const Text('Audio Recorder'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const AudioFeatureScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
