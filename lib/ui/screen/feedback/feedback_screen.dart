import 'package:flutter/material.dart';
import 'package:order_hub/ui/common/custom_widget.dart';
import 'package:order_hub/ui/common/custom_button.dart';
import 'package:order_hub/ui/screen/feedback/widget/audio_playing_widget.dart';
import 'package:order_hub/ui/screen/feedback/widget/photo_picker_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/feedback_provider.dart';
import '../../../utils/language.dart';
import 'widget/audio_recording_widget.dart';
import 'widget/feedback_text_field_widget.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.6;
    return  Scaffold(
        appBar: customAppBar(context: context, title: feedback, onPressed: (){
          Navigator.of(context).pop();
        } ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const FeedBackTextFieldWidget(),
                const PhotoPickerWidget(),
                const SizedBox(height: 20,),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: Colors.grey, width: 1)
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AudioRecordingWidget(),
                      AudioPlayerWidget(),
                    ],
                  ),
                ),

                const SizedBox(height: 200,),

                Container(
                  alignment: Alignment.center,
                  child: CustomButton(width: buttonWidth, name: submit, onPressed: (){
                    Provider.of<FeedbackProvider>(context, listen: false).submitFeedbackData();
                  }),
                ),

                const SizedBox(height: 100,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
