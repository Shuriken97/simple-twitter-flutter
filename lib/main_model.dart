import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/firebase_options.dart';
import 'package:simple_twitter/models/user/user.dart';
import 'package:simple_twitter/repositories/user.dart';

class GlobalModel extends GetxController {
  UserRepository userRepository = Get.put(UserRepository());
  //// Start Global state
  Rxn<User> currentUser = Rxn<User>();
  //// End Global state

  /// Initialize initial app required services
  Future<void> initServices() async {
    // Initialize firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  /// It gets the current user info from the user repository and sets the currentUser value to the user
  /// info.
  ///
  /// Args:
  ///   userId: The userId of the user you want to get the info of.
  Future<void> getCurrentUserInfo({required userId}) async {
    currentUser.value = await userRepository.getCurrentUser(userId: userId);
  }
}
