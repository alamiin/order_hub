import 'package:flutter/material.dart';
import 'package:order_hub/ui/screen/auth/widget/login_widget.dart';
import 'package:order_hub/utils/language.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
          child: Center(
            child: Scrollbar(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      frutter,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(height: 20,),
                    LoginWidget()
                  ],
                ),
              ),
            ),
      )),
    );
  }
}
