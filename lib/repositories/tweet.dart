import 'package:get/get.dart';
import 'package:simple_twitter/models/tweet/tweet.dart';
import 'package:simple_twitter/services/firebase_services.dart';

/// Tweet repository handles communication between view model and firestore
class TweetRepository {
  String collectionName = 'tweets';
  FirebaseServices firebaseServices = Get.find<FirebaseServices>();

  /// It returns a stream of a list of tweets, which is obtained by reading all the documents from the
  /// collection named 'tweets' in the Firestore database, and mapping each document to a Tweet object
  ///
  /// Returns:
  ///   A stream of a list of tweets.
  Stream<List<Tweet>> getTweets() {
    return firebaseServices
        .readAllDataFromFirestore(
          collectionName: collectionName,
          orderBy: 'createdAt',
          isDescending: true,
        )
        .map((snapshot) => snapshot.docs.map((document) {
              return Tweet(
                id: document.id,
                content: document.data()['content'],
                authorId: document.data()['authorId'],
                authorName: document.data()['authorName'],
                createdAt: DateTime.parse(document.data()['createdAt']).toLocal(),
              );
            }).toList());
  }

  /// > It takes a tweet object, converts it to a map, and then sends it to Firestore
  ///
  /// Args:
  ///   tweet (Tweet): The tweet object that you want to create.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> createTweet({required Tweet tweet}) async {
    final bool isSuccess = await firebaseServices.postDataToFirestore(
      collectionName: collectionName,
      data: tweet.toJson(),
    );

    return isSuccess;
  }

  /// It updates the tweet in the firestore database.
  ///
  /// Args:
  ///   tweet (Tweet): The tweet object that you want to update.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> updateTweet({required Tweet tweet}) async {
    final bool isSuccess = await firebaseServices.updateDataToFirestore(collectionName: collectionName, documentId: tweet.id!, data: tweet.toJson());

    return isSuccess;
  }

  /// It deletes a tweet from the database.
  ///
  /// Args:
  ///   tweet (Tweet): The tweet object to be deleted.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> deleteTweet({required String tweetId}) async {
    final bool isSuccess = await firebaseServices.deleteDataToFirestore(collectionName: collectionName, documentId: tweetId);

    return isSuccess;
  }
}
