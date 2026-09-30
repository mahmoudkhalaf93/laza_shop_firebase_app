import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';

/// Screen to fetch and display all saved profile records from Firestore
class UserDataDisplayScreen extends StatefulWidget {
  const UserDataDisplayScreen({super.key});

  @override
  State<UserDataDisplayScreen> createState() => _UserDataDisplayScreenState();
}

class _UserDataDisplayScreenState extends State<UserDataDisplayScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Saved Records'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Listen to Firestore real-time stream of all users
        stream: _firestoreService.getAllUsersStream(),
        builder: (context, snapshot) {
          // Handle loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          // Handle error state
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Handle empty state
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No records found. Go back and add some!'),
            );
          }

          // Build a list of user profiles
          final userDocs = snapshot.data!.docs;
          
          return ListView.builder(
            itemCount: userDocs.length,
            itemBuilder: (context, index) {
              final userData = userDocs[index].data() as Map<String, dynamic>;
              
              // Safely extract fields with fallbacks
              final name = userData['name'] ?? 'Unknown Name';
              final age = userData['age']?.toString() ?? 'N/A';
              final hobby = userData['hobby'] ?? 'Unknown Hobby';

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(name.isNotEmpty ? name[0].toUpperCase() : '?'),
                  ),
                  title: Text(name),
                  subtitle: Text('Age: $age • Hobby: $hobby'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
