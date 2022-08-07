import 'package:firebase_auth/firebase_auth.dart' as firebase_user;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/main_model.dart';
import 'package:simple_twitter/services/firebase_services.dart';
import 'package:simple_twitter/views/auth/login/login_view.dart';
import 'package:simple_twitter/views/home/home_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseServices firebaseServices = Get.put(FirebaseServices());
    GlobalModel globalModel = Get.find<GlobalModel>();

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<firebase_user.User?>(
            stream: firebaseServices.notifyAuthStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                globalModel.getCurrentUserInfo(userId: snapshot.data!.uid);

                return const HomeView();
              } else {
                globalModel.currentUser.value = null;

                return const LoginView();
              }
            }),
      ),
    );
  }
}
