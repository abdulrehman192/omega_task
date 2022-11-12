import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/common.dart';

class FirebaseUtility {

  static void signInWithPhoneAuthCredential(
      {required PhoneAuthCredential phoneAuthCredential,
        required FirebaseAuth auth,
        required BuildContext context,
        required Function() goTo}) async {
    try {
      final authCredential =
      await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        goTo();
      }
    } on FirebaseAuthException catch (e) {
      Common.showSnackBar(e.message ?? '', context);
    }
  }

  static verifyPhoneNumber(
      {required Function(String) verifyId,
        required String phoneNo,
        required FirebaseAuth auth,
        required BuildContext context}) {
    auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) async {
          Common.showSnackBar(verificationFailed.message ?? '', context);
        },
        codeSent: (verificationId, resendingToken) async {
          verifyId(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  static Future<bool> add(
      {required Map<String, dynamic> doc,
      required String collectionPath,
      required BuildContext context}) async {
      bool done = false;
      try {
        await FirebaseFirestore.instance.collection(collectionPath).add(doc);
       done = true;
      }
      on FirebaseException catch(ex)
    {
      Common.showSnackBar(ex.message!, context);
      done = false;
    }
    return done;
  }

  static Future<bool>  update(
      {required Map<String, dynamic> doc,
      required String collectionPath,
      required String docId, required BuildContext context}) async {
    bool done = false;
    try {
      await FirebaseFirestore.instance.collection(collectionPath).doc(docId).update(doc);
      done = true;
    }
    on FirebaseException catch(ex)
    {
      Common.showSnackBar(ex.message!, context);
      done = false;
    }
    return done;


  }

  static Future<bool>  delete({required String collectionPath, required String docId,required BuildContext context}) async {
    bool done = false;
    try {
      await FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(docId)
          .delete();
     done = true;
    }
    on FirebaseException catch(ex)
    {
      Common.showSnackBar(ex.message!, context);
      done = false;
    }
    return done;

  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getSnapshots(
      {required String collectionPath,
      String? query,
      String? field,
      bool shouldExclude = false}) {
    if (query != null && field != null) {
      return shouldExclude
          ? FirebaseFirestore.instance
              .collection(collectionPath)
              .where(field, isNotEqualTo: query)
              .snapshots()
          : FirebaseFirestore.instance
              .collection(collectionPath)
              .where(field, isEqualTo: query)
              .snapshots();
    }
    return FirebaseFirestore.instance.collection(collectionPath).snapshots();
  }


  static Future<QueryDocumentSnapshot<Map<String, dynamic>>?> getOneDoc({required String collection,required String where, required whereValue, String where2 = "", String where2Value = "", String where3 = "", String where3Value = ""}) async
  {
    final data = await FirebaseFirestore.instance.collection(collection).where(where, isEqualTo: whereValue).get();
    if(data.docs.isNotEmpty)
      {
        return data.docs.first;
      }
    else
      {
        return null;
      }
  }

  static Future<double> getRate({required String collection, required String type, required String color, required String thickness, required String section}) async
  {
    final doc = await FirebaseFirestore.instance.collection(collection).where("type", isEqualTo: type).where("color", isEqualTo: color).where("thickness", isEqualTo: thickness).where("section", isEqualTo: section).get();
    var x = doc.docs.isEmpty ? 0 : doc.docs.first.get("rate");
    double y = double.parse(x.toString());
    return y;
  }


  static Future<DocumentSnapshot<Map<String, dynamic>>> getOneDocById({required collection,required String docId,}) async
  {
    final data = await FirebaseFirestore.instance.collection(collection).doc(docId).get();
    return data;
  }

  static Future<int> exists({required String collection ,required String where1, required String where1Value, String? where2, String? where2Value, String? where3, String? where3Value}) async
  {
    final data = await FirebaseFirestore.instance.collection(collection).where(where1, isEqualTo: where1Value).get();
    return data.docs.length;
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> getDocuments({required String collection, String? field, String? fieldValue}) async
  {
    final dynamic querySnapshot;

    if(field!= null && fieldValue != null) {
      querySnapshot =
      await FirebaseFirestore.instance.collection(collection).where(
          field, isEqualTo: fieldValue).get();
    }
    else
      {
        querySnapshot =
        await FirebaseFirestore.instance.collection(collection).get();
      }

    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    return docs;
  }
}
