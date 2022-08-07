import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_twitter/components/simple_toast.dart';

class FirebaseServices {
  //// Start Firebase Auth ////

  /// It returns a stream of user objects that will emit whenever the user's authentication state changes
  ///
  /// Returns:
  ///   A stream of User objects.
  Stream<User?> notifyAuthStateChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }

  /// It signs in the user with the email and password provided.
  ///
  /// Args:
  ///   email (String): The email address of the user.
  ///   password (String): The password of the user.
  Future<void> emailPasswordSignIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      SimpleToast.toastCritical(label: 'Login Failed');
    }
  }

  /// It signs out the user from the app.
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      SimpleToast.toastCritical(label: 'Sign out Failed');
    }
  }

  //// End Firebase Auth ////

  //// Start Firestore ////

  /// It takes in a collection name and a map of data and adds it to the collection
  ///
  /// Args:
  ///   collectionName (String): The name of the collection you want to add the data to.
  ///   data (Map<String, dynamic>): The data you want to post to the database.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> postDataToFirestore({required String collectionName, required Map<String, dynamic> data}) async {
    try {
      final CollectionReference<Map<String, dynamic>> documents = FirebaseFirestore.instance.collection(collectionName);

      final DocumentReference<Map<String, dynamic>> updatedDocument = await documents.add(data);

      if (data.containsKey('id')) {
        data['id'] = updatedDocument.id;
        updatedDocument.set(data);
      }

      return true;
    } catch (error) {
      SimpleToast.toastCritical(label: 'Something went wrong');
      return false;
    }
  }

  /// It updates the data in the document with the given documentId in the collection with the given
  /// collectionName
  ///
  /// Args:
  ///   collectionName (String): The name of the collection you want to update the data in.
  ///   documentId (String): The document id of the document you want to update.
  ///   data (Map<String, dynamic>): The data you want to update.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> updateDataToFirestore({required String collectionName, required String documentId, required Map<String, dynamic> data}) async {
    try {
      final DocumentReference<Map<String, dynamic>> document = FirebaseFirestore.instance.collection(collectionName).doc(documentId);
      await document.update(data);

      return true;
    } catch (error) {
      SimpleToast.toastCritical(label: 'Something went wrong');
      return false;
    }
  }

  /// Delete a document from a collection in Firestore
  ///
  /// Args:
  ///   collectionName (String): The name of the collection you want to delete the document from.
  ///   documentId (String): The document id of the document you want to delete.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> deleteDataToFirestore({required String collectionName, required String documentId}) async {
    try {
      final DocumentReference<Map<String, dynamic>> document = FirebaseFirestore.instance.collection(collectionName).doc(documentId);
      await document.delete();

      return true;
    } catch (error) {
      SimpleToast.toastCritical(label: 'Something went wrong');
      return false;
    }
  }

  /// It reads data from the firestore database.
  ///
  /// Args:
  ///   collectionName (String): The name of the collection you want to read from.
  ///   orderBy (String): The field to order the documents by.
  ///   isDescending (bool): If you want to sort the data in descending order, set this to true. Defaults
  /// to false
  ///
  /// Returns:
  ///   A stream of QuerySnapshot<Map<String, dynamic>>
  Stream<QuerySnapshot<Map<String, dynamic>>> readAllDataFromFirestore({
    required String collectionName,
    String? orderBy,
    bool isDescending = false,
  }) {
    if (orderBy != null) {
      return FirebaseFirestore.instance.collection(collectionName).orderBy(orderBy, descending: isDescending).snapshots();
    } else {
      return FirebaseFirestore.instance.collection(collectionName).snapshots();
    }
  }

  /// Read a single document from a collection in Firestore.
  ///
  /// Args:
  ///   collectionName (String): The name of the collection you want to read from.
  ///   documentId (String): The id of the document you want to read.
  ///
  /// Returns:
  ///   A map of dynamic values.
  Future<Map<String, dynamic>?> readSingleDataFromFirestore({required String collectionName, required String documentId}) async {
    try {
      final DocumentReference<Map<String, dynamic>> document = FirebaseFirestore.instance.collection(collectionName).doc(documentId);

      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await document.get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data()!;
      } else {
        return null;
      }
    } catch (error) {
      SimpleToast.toastCritical(label: 'Something went wrong');
      return null;
    }
  }

  //// End Firestore ////
}
