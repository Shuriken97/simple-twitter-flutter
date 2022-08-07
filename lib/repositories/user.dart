import 'package:get/get.dart';
import 'package:simple_twitter/models/user/user.dart';
import 'package:simple_twitter/services/firebase_services.dart';

class UserRepository {
  String collectionName = 'users';
  FirebaseServices firebaseServices = Get.put(FirebaseServices());

  /// It gets the current user from the database.
  ///
  /// Args:
  ///   userId (String): The user's id.
  ///
  /// Returns:
  ///   A Future<User?> is being returned.
  Future<User?> getCurrentUser({required String userId}) async {
    Map<String, dynamic>? currentUser = await firebaseServices.readSingleDataFromFirestore(collectionName: collectionName, documentId: userId);

    if (currentUser != null) {
      return User.fromJson(currentUser);
    } else {
      return null;
    }
  }
}
