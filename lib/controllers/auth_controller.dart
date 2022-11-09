import 'package:e_commerce_01/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
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
      String fullName, String username, String email, String password) async {
    String result = 'some error occurred';
    try {
      if (fullName.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        fireStore.collection('users').doc(userCredential.user!.uid).set({
          'fullName': fullName,
          'username': username,
          'email': email,
        });
        print(userCredential.user!.email);
        result = 'success';
      } else {
        result = 'Fields must not be empty';
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}
