import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_twitter/components/simple_form_field.dart';
import 'package:simple_twitter/views/Edit_tweet/edit_tweet_view_model.dart';

class EditTweetView extends StatelessWidget {
  const EditTweetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditTweetModel editTweetModel = Get.put(EditTweetModel());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Edit Tweet')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Obx(
            () => Column(
              children: <Widget>[
                SimpleTextField(
                  controller: editTweetModel.editTweetController,
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(280),
                  ],
                  onChanged: (String value) {
                    editTweetModel.characterCount.value = value.length;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('${editTweetModel.characterCount.value.toString()}/280'),
                  ),
                ),
                ElevatedButton(onPressed: editTweetModel.updateTweet, child: const Text('Tweet It'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
