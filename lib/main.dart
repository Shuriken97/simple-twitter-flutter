import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/main_model.dart';
import 'package:simple_twitter/views/auth/login/login_view.dart';
import 'package:simple_twitter/views/create_tweet/create_tweet_view.dart';
import 'package:simple_twitter/views/edit_tweet/edit_tweet_view.dart';
import 'package:simple_twitter/views/home/home_view.dart';
import 'package:simple_twitter/views/landing/landing_view.dart';

Future<void> main() async {
  final GlobalModel globalModel = Get.put(GlobalModel(), permanent: true);
  await globalModel.initServices();

  runApp(const SimpleTwitter());
}

class SimpleTwitter extends StatelessWidget {
  const SimpleTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LandingView(),
      debugShowCheckedModeBanner: false,
      getPages: <GetPage<dynamic>>[
        GetPage<dynamic>(name: '/login', page: () => const LoginView()),
        GetPage<dynamic>(name: '/home', page: () => const HomeView()),
        GetPage<dynamic>(name: '/create', page: () => const CreateTweetView()),
        GetPage<dynamic>(name: '/edit', page: () => const EditTweetView()),
      ],
    );
  }
}
