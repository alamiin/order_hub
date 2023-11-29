import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:record/record.dart';

class FeedbackProvider with ChangeNotifier {

  // this variable used for getting message from text field
  String _feedbackMessage = "";
  String get feedbackMessage {
    return _feedbackMessage;
  }
  void updateFeedbackMessage({required String message}){
    _feedbackMessage = message;
  }

  // this variable is used for image file handling
  File? imageFile;
  void updateFile(File file){
    imageFile = file;
    notifyListeners();
  }


  //audio managing audio path for audio recording
  String? audioPath;
  String? fileName;
  bool isRecording = false;
  RecordState recordState = RecordState.stop;
  void setIsRecording(bool value){
    setStopPlaying(true);
    isRecording = value;
    notifyListeners();
  }
  void updateAudioPath(String path){
    audioPath = path;
    fileName = path.split('/').last;
    notifyListeners();
  }
  void updateRecorderState(RecordState state){
    recordState = state;
    notifyListeners();
  }

  // managing audio playing
  PlayerState playState = PlayerState.stopped;
  bool stopPlaying = false;
  void updatePlayerState(PlayerState state){
    playState = state;
    notifyListeners();
  }
  setStopPlaying(bool value){
    stopPlaying = value;
    notifyListeners();
  }

  void submitFeedbackData(){

  }

}