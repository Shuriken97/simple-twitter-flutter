import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/components/simple_toast.dart';
import 'package:simple_twitter/main_model.dart';
import 'package:simple_twitter/models/tweet/tweet.dart';
import 'package:simple_twitter/repositories/tweet.dart';

class EditTweetModel extends GetxController {
  TweetRepository tweetRepository = Get.find<TweetRepository>();
  GlobalModel globalModel = Get.find<GlobalModel>();

  TextEditingController editTweetController = TextEditingController();

  Rx<Tweet> selectedTweet = Tweet().obs;

  RxInt characterCount = 0.obs;

  @override
  void onInit() {
    selectedTweet.value = Get.arguments as Tweet;
    editTweetController.text = selectedTweet.value.content ?? '';
    characterCount.value = editTweetController.text.length;
    super.onInit();
  }

  /// It Edits a new tweet and saves it to the firestore.
  Future<void> updateTweet() async {
    selectedTweet.value.content = editTweetController.text;

    bool isSuccess = await tweetRepository.updateTweet(tweet: selectedTweet.value);

    if (isSuccess) {
      SimpleToast.toastInfo(label: 'Tweet Edited!');
      Get.back<dynamic>();
    }
  }
}
