import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/components/simple_form_field.dart';
import 'package:simple_twitter/views/create_tweet/create_tweet_view_model.dart';

class CreateTweetView extends StatelessWidget {
  const CreateTweetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateTweetModel createTweetModel = Get.put(CreateTweetModel());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Create Tweet')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Obx(
            () => Column(
              children: <Widget>[
                SimpleTextField(
                  controller: createTweetModel.createTweetController,
                  onChanged: (String value) {
                    createTweetModel.characterCount.value = value.length;
                  },
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(280),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('${createTweetModel.characterCount.value.toString()}/280'),
                  ),
                ),
                ElevatedButton(onPressed: createTweetModel.createTweet, child: const Text('Tweet It'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
