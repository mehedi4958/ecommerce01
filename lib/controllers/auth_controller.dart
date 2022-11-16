import 'dart:typed_data';

import 'package:e_commerce_01/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  ///function to upload image to storage

  _uploadImageToStorage(Uint8List? image) async {
    Reference reference = firebaseStorage
        .ref()
        .child('profileImage')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = reference.putData(image!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadedUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadedUrl;
  }

  ///function to pick user image

  pickImage(ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: imageSource);
    if (file != null) {
      return await file.readAsBytes();
    } else {
      print('No image selected');
    }
  }

  ///function to sign up users

  Future<String> signUpUser(
    String fullName,
    String username,
    String email,
    String password,
    Uint8List? image,
  ) async {
    String result = 'some error occurred';
    try {
      if (fullName.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String profileImageUrl = await _uploadImageToStorage(image);

        await fireStore.collection('users').doc(userCredential.user!.uid).set({
          'fullName': fullName,
          'username': username,
          'email': email,
          'image': profileImageUrl,
        });
        result = 'success';
      } else {
        result = 'Fields must not be empty';
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  ///function to login users

  loginUser(String email, String password) async {
    String result = 'some error occurred';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'success';
      } else {
        result = 'Fields must not be empty';
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  ///function while forgot password

  forgotPassword(String email) async {
    String result = 'some error occurred';
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        result = 'success';
      } else {
        result = 'Email must not be empty';
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}
