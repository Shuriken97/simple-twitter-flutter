import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/components/simple_toast.dart';
import 'package:simple_twitter/main_model.dart';
import 'package:simple_twitter/models/tweet/tweet.dart';
import 'package:simple_twitter/repositories/tweet.dart';

class CreateTweetModel extends GetxController {
  TweetRepository tweetRepository = Get.find<TweetRepository>();
  GlobalModel globalModel = Get.find<GlobalModel>();

  TextEditingController createTweetController = TextEditingController();

  RxInt characterCount = 0.obs;

  /// It creates a new tweet and saves it to the firestore.
  Future<void> createTweet() async {
    final createdTweet = Tweet(
      authorId: globalModel.currentUser.value!.id,
      authorName: globalModel.currentUser.value!.name,
      content: createTweetController.text,
      createdAt: DateTime.now().toLocal(),
    );

    bool isSuccess = await tweetRepository.createTweet(tweet: createdTweet);

    if (isSuccess) {
      SimpleToast.toastInfo(label: 'Tweet Posted!');
      Get.back<dynamic>();
    }
  }
}
