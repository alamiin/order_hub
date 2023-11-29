import 'package:flutter/material.dart';
import 'package:order_hub/ui/screen/home/widget/home_button_widget.dart';
import 'package:order_hub/utils/language.dart';
import 'package:order_hub/utils/route_helper.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeButtonWidget(
                    color: Colors.blue,
                    name: customOrder,
                    size: buttonWidth,
                    onPressed: (){
                      Navigator.pushNamed(context, RouteHelper.orderRoute);
                    },
                  ),
                  const SizedBox(height: 20,),
                  HomeButtonWidget(
                    color: Colors.green,
                    name: feedback,
                    size: buttonWidth,
                    onPressed: (){
                      Navigator.pushNamed(context, RouteHelper.feedbackRoute);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
