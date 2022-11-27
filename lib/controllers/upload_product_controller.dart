import 'dart:io';

import 'package:e_commerce_01/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class UploadProductController {
  _uploadImageToStorage(File? image) async {
    Reference reference = firebaseStorage
        .ref()
        .child('product')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = reference.putFile(image!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadedUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadedUrl;
  }

  var uuid = const Uuid();
  Future<String> uploadProduct(
      String id,
      String title,
      var price,
      String productCategoryName,
      String description,
      var quantity,
      File? imageUrl) async {
    String result = 'some error occurred';
    try {
      final productId = uuid.v4();
      if (title.isNotEmpty &&
          price.isNotEmpty &&
          productCategoryName.isNotEmpty &&
          description.isNotEmpty &&
          quantity.isNotEmpty &&
          imageUrl != null) {
        String productImageUrl = await _uploadImageToStorage(imageUrl);
        await fireStore.collection('products').doc(productId).set({
          'id': id,
          'title': title,
          'price': price,
          'productCategoryName': productCategoryName,
          'description': description,
          'quantity': quantity,
          'imageUrl': productImageUrl,
        });
      }
    } catch (e) {}
    return result;
  }
}
