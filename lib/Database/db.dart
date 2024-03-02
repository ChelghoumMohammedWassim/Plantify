import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:Plantify/Models/Save.dart';
import '../Models/Users.dart';


Stream<User?> get currentUser{
  return FirebaseAuth.instance.authStateChanges();
}

Stream<QuerySnapshot?> get streamUser{
  return FirebaseFirestore.instance.collection('Users').where("id", isEqualTo:FirebaseAuth.instance.currentUser!.uid).snapshots();
}

Future setUser(String userName, String email, String password) async{
  await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).set({
    'email':email,
    'userName':userName,
    'password':password,
    'id':FirebaseAuth.instance.currentUser!.uid.toString()
});
}



CurrentUser getUserInformation(QuerySnapshot snapshot){
  var doc=snapshot.docs[0];
  return CurrentUser(
    id: doc.get('id'),
    userName: doc.get('userName'),
    email: doc.get('email'),
    password: doc.get('password'),
    );
}

Future<String> uploadImage(File imageFile) async {
  try {
    final Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    UploadTask uploadTask = storageReference.putFile(imageFile);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    String downloadURL = await taskSnapshot.ref.getDownloadURL();

    return downloadURL;
  } on FirebaseException catch (e) {
    print("Error uploading image: $e");
    return '';
  }
}

Future setPrediction(String uuid, String imageUrl, int result_id, String confidence) async{
  
  await FirebaseFirestore.instance.collection('Prediction').doc(uuid).set({
    'image_url':imageUrl,
    'result_id':result_id,
    'confidence':confidence,
    'id': uuid,
    'user_id':FirebaseAuth.instance.currentUser?.uid,
    'date':DateTime.now(),
});
}

List<Save> snapshotTOSaveList(QuerySnapshot snapshot){
  List<Save> list=[];
  for(var doc in snapshot.docs){
    list.add(
      Save(
        confidence: doc.get("confidence"),
        id: doc.get("id"),
        image_url: doc.get("image_url"),
        result_id: doc.get("result_id"),
        user_id: doc.get("user_id"),
        date: doc.get("date").toDate(),
        )
    );
  }
  return list;
}

Stream<QuerySnapshot?> get streamSaves{
  return FirebaseFirestore.instance.collection('Prediction').where('user_id',isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).snapshots();
}

void deleteSave(String save_id) async {
  try {
    await FirebaseFirestore.instance.collection('Prediction').doc(save_id).delete();
    print('Document deleted successfully');
  } catch (e) {
    print('Error deleting document: $e');
  }
}



