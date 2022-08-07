import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/helpers/formatters.dart';
import 'package:simple_twitter/main_model.dart';
import 'package:simple_twitter/models/tweet/tweet.dart';
import 'package:simple_twitter/views/home/home_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeModel homeModel = Get.put(HomeModel());
    GlobalModel globalModel = Get.find<GlobalModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: homeModel.signOut,
              child: const Icon(
                Icons.logout,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: StreamBuilder<List<Tweet>>(
            stream: homeModel.getTweets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Obx(
                  () => globalModel.currentUser.value != null
                      ? ListView(children: snapshot.data!.map((Tweet tweet) => tweetCard(tweet: tweet)).toList())
                      : const Center(child: CircularProgressIndicator()),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: homeModel.navigateToCreateTweetView,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  /// Returns tweet card widget used only in home view
  Widget tweetCard({required Tweet tweet}) {
    HomeModel homeModel = Get.find<HomeModel>();
    GlobalModel globalModel = Get.find<GlobalModel>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      tweet.authorName ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(Formatters.date(tweet.createdAt!)),
                    ),
                  ],
                ),
                if (tweet.authorId == globalModel.currentUser.value!.id)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => homeModel.navigateToEditTweetView(tweet: tweet),
                          child: const Icon(
                            Icons.edit,
                            size: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () => homeModel.deleteTweet(tweetId: tweet.id!),
                            child: const Icon(
                              Icons.delete,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const SizedBox(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(tweet.content ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
