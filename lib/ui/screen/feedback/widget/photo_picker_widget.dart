import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:order_hub/provider/feedback_provider.dart';
import 'package:order_hub/ui/common/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../utils/language.dart';


class PhotoPickerWidget extends StatefulWidget {
  const PhotoPickerWidget({Key? key}) : super(key: key);
  @override
  State<PhotoPickerWidget> createState() => _PhotoPickerWidgetState();
}

class _PhotoPickerWidgetState extends State<PhotoPickerWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Colors.grey, width: 1)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.black87,
              ),
              onPressed: () {
                photoPickerDialog(context);
              },
            ),
          ),

          Consumer<FeedbackProvider>(builder: (context, provider, child){
            return (provider.imageFile != null) ?  Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  image: DecorationImage(
                      image: FileImage(provider.imageFile!),
                    fit: BoxFit.cover
                  )),
            ) : const SizedBox();
          },),


        ],
      ),
    );
  }

  /// Get from gallery
  _getImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if(image == null) return;
      File imageFile = File(image.path);
      Provider.of<FeedbackProvider>(context, listen: false).updateFile(imageFile);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> photoPickerDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: const Color(0xFF4F4F4F),
            content: Container(
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: Colors.white, width: 1.5,)
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(chooseImageSource, style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87
                    ),),
                  ),

                  const Divider(),

                  const SizedBox(height: 20,),

                  CustomButton(width: 200, name: "Camera", onPressed: (){
                    _getImage(ImageSource.camera);
                    Navigator.pop(context);
                  }),

                  const SizedBox(height: 10,),

                  CustomButton(width: 200, name: "Gallery", onPressed: (){
                    _getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }),

                  const SizedBox(height: 20,),

                ],
              ),
            )

        );
      },
    );
  }

}
