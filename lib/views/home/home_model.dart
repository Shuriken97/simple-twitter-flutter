import 'package:get/get.dart';
import 'package:simple_twitter/components/simple_toast.dart';
import 'package:simple_twitter/models/tweet/tweet.dart';
import 'package:simple_twitter/repositories/tweet.dart';
import 'package:simple_twitter/services/firebase_services.dart';

class HomeModel extends GetxController {
  TweetRepository tweetRepository = Get.put(TweetRepository());
  FirebaseServices firebaseServices = Get.find<FirebaseServices>();

  @override
  Future<void> onInit() async {
    getTweets();
    super.onInit();
  }

  /// Get the tweets from the repository and return them as a stream.
  ///
  /// Returns:
  ///   A Stream of a List of Tweets.
  Stream<List<Tweet>> getTweets() {
    return tweetRepository.getTweets();
  }

  /// It deletes a tweet from the database.
  ///
  /// Args:
  ///   tweetId (String): The id of the tweet to be deleted.
  ///
  /// Returns:
  ///   Future<void>
  Future<void> deleteTweet({required String tweetId}) async {
    bool isSuccess = await tweetRepository.deleteTweet(tweetId: tweetId);

    if (isSuccess) {
      SimpleToast.toastInfo(label: 'Tweet Deleted!');
    }
  }

  /// Navigates to create tweet view
  void navigateToCreateTweetView() {
    Get.toNamed<dynamic>('/create');
  }

  /// Navigates to create tweet view
  void navigateToEditTweetView({required Tweet tweet}) {
    Get.toNamed<dynamic>('/edit', arguments: tweet);
  }

  /// It signs out the user.
  Future<void> signOut() async {
    if (Get.isRegistered<HomeModel>()) {
      Get.delete<HomeModel>();
    }
    await firebaseServices.signOut();
  }
}
