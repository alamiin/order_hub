import 'package:flutter/material.dart';
import 'package:order_hub/provider/feedback_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/language.dart';

class FeedBackTextFieldWidget extends StatefulWidget {
  const FeedBackTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<FeedBackTextFieldWidget> createState() => _FeedBackTextFieldWidgetState();
}

class _FeedBackTextFieldWidgetState extends State<FeedBackTextFieldWidget> {

  late TextEditingController _feedbackController;

  @override
  void initState() {
    // TODO: implement initState
    _feedbackController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: _feedbackController,
        minLines: 5,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          hintText: enterMessageHere,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(20.0),
        ),
        onChanged: (value){
          Provider.of<FeedbackProvider>(context, listen: false).updateFeedbackMessage(
              message: value
          );
        },
      ),
    );
  }
}
