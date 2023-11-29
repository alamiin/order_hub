import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:order_hub/provider/order_provider.dart';
import 'package:order_hub/ui/common/custom_button.dart';
import 'package:order_hub/ui/common/custom_image.dart';
import 'package:order_hub/utils/language.dart';
import 'package:provider/provider.dart';

class ImageWidget extends StatefulWidget {
  final String defaultValue;
  final String label;
  final Function(String) callbackAction;
  ImageWidget({Key? key, required this.defaultValue, required this.label, required this.callbackAction}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  late BuildContext buildContext;

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Container(
      margin: const EdgeInsets.all( 10),
      padding: const EdgeInsets.all( 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(width: 1, color: Colors.black87)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              Text(
                widget.label,
                style: const TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w500),
              ),
            ],
          ),

          (imageFile != null)? Container(
            height: 70, width: 100,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                    image: FileImage(imageFile!),
                    fit: BoxFit.cover
                )),
          ):CustomImage(
            image: widget.defaultValue,
            height: 70, width: 100, fit: BoxFit.cover,
          ),

          // Consumer<OrderProvider>(builder: (context, provider, child){
          //   return (provider.imageFile != null) ? Container(
          //     height: 70, width: 100,
          //     margin: const EdgeInsets.all(4),
          //     decoration: BoxDecoration(
          //         color: Colors.black12,
          //         borderRadius: const BorderRadius.all(Radius.circular(4)),
          //         image: DecorationImage(
          //             image: FileImage(provider.imageFile!),
          //             fit: BoxFit.cover
          //         )),
          //   ):CustomImage(
          //     image: defaultValue,
          //     height: 70, width: 100, fit: BoxFit.cover,
          //   );
          // },),


        ],
      ),
    );
  }

  _getImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if(image == null) return;
      setState(() {
        imageFile = File(image.path);
        widget.callbackAction(image.path);
      });
      //Provider.of<OrderProvider>(buildContext, listen: false).updateFile(imageFile);
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
