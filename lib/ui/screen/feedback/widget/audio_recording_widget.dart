import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:order_hub/provider/feedback_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:flutter/material.dart';
import 'dart:io';



class AudioRecordingWidget extends StatefulWidget {
  const AudioRecordingWidget({Key? key}) : super(key: key);

  @override
  State<AudioRecordingWidget> createState() => _AudioRecordingWidgetState();
}

class _AudioRecordingWidgetState extends State<AudioRecordingWidget> with TickerProviderStateMixin {

  String fileName = "";
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() {
        if(mounted){
          Provider.of<FeedbackProvider>(context, listen: false).updateRecorderState(recordState);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _recordSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackProvider>(builder: (context, provider, child){
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Material(
            child: InkWell(
              onTap: () {
                if(provider.recordState != RecordState.stop){
                  _stop();
                }else{
                  (provider.recordState != RecordState.stop) ? _stop() : _start();
                }
              },
              child: SizedBox(
                  width: 50, height: 50,
                  child: Icon(
                      (provider.recordState != RecordState.stop) ?
                      Icons.stop : Icons.mic,
                      color: (provider.recordState != RecordState.stop) ?
                      Colors.red : Colors.black87,
                      size: 30
                  )
              ),

            ),
          ),

          (provider.recordState != RecordState.stop) ?
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.blue,
              size: 40,
            ),
          ): const SizedBox(),

        ],
      );
    });
  }


  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {

        Provider.of<FeedbackProvider>(context, listen: false).setIsRecording(true);

        String fileType = ".flac";
        if(Platform.isAndroid){
          fileType = ".wav";
        }

        final dir = await getApplicationDocumentsDirectory();
        fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}$fileType';
        String path = p.join(
          dir.path,
          fileName,
        );

        await _audioRecorder.start(
          path: path,
          encoder: Platform.isAndroid? AudioEncoder.wav: AudioEncoder.flac,
          numChannels: 1,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  Future<void> _stop() async {
    Provider.of<FeedbackProvider>(context, listen: false).setIsRecording(false);
    final path = await _audioRecorder.stop();
    if (path != null) {
      Provider.of<FeedbackProvider>(context, listen: false).updateAudioPath(path);
    }
  }

}
