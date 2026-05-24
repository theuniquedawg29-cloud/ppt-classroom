import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Uploads a PPTX file to Firebase Storage and saves the metadata to Firestore.
  static Future<String?> uploadPPTX(Uint8List bytes, String fileName, {String? title, String? description}) async {
    try {
      final Reference ref = _storage.ref().child('presentations/$fileName');
      
      final SettableMetadata metadata = SettableMetadata(
        contentType: 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
      );

      final UploadTask uploadTask = ref.putData(bytes, metadata);
      
      final TaskSnapshot snapshot = await uploadTask;
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      
      // Save to Firestore so "others can access" a list of generated presentations
      await _firestore.collection('presentations').add({
        'fileName': fileName,
        'title': title ?? fileName,
        'description': description ?? '',
        'url': downloadUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });
      
      return downloadUrl;
    } catch (e) {
      debugPrint("Firebase Upload/Firestore Error: $e");
      return null;
    }
  }

  /// Retrieves a stream of all generated presentations.
  static Stream<QuerySnapshot> getPresentations() {
    return _firestore.collection('presentations').orderBy('createdAt', descending: true).snapshots();
  }
}
