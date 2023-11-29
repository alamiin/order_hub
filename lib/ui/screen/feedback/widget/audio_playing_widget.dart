import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/feedback_provider.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({Key? key}) : super(key: key);
  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {

  final player = AudioPlayer();

  @override
  void initState() {
    player.onPlayerStateChanged.listen((PlayerState state) {
      if(mounted){
        Provider.of<FeedbackProvider>(context, listen: false).updatePlayerState(state);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  void resetPlayer() async{
    await  player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackProvider>(builder: (context, provider, child){

      if(provider.stopPlaying && provider.playState ==  PlayerState.playing){
        resetPlayer();
      }

      return (provider.audioPath != null) ?  Container(
        alignment: Alignment.center,
        height: 50,
        child: Row(
          children: [

            Material(
              child: InkWell(
                onTap: provider.isRecording? null:  ()  async{
                  if(provider.playState ==  PlayerState.playing){
                    await player.pause();
                  }else if(provider.playState ==  PlayerState.paused){
                    await player.resume();
                  }
                  else{
                    provider.setStopPlaying(false);
                    String audioPath = Provider.of<FeedbackProvider>(context, listen: false).audioPath!;
                    await player.play(DeviceFileSource(audioPath));
                  }
                },
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                      (provider.playState ==  PlayerState.playing ) ? Icons.stop : Icons.play_arrow,
                      size: 30,
                    color: provider.isRecording ? Colors.grey : Colors.black87,
                  ),
                ),
              ),

            ),

            Text(
                provider.fileName!
            )
          ],
        ),
      ) : const SizedBox();
    },);
  }
}
