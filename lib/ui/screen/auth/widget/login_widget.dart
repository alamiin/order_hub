import 'package:flutter/material.dart';
import 'package:order_hub/ui/common/custom_button.dart';
import 'package:order_hub/ui/common/custom_snackbar.dart';
import 'package:order_hub/utils/extension_helper.dart';
import 'package:order_hub/utils/route_helper.dart';
import 'package:provider/provider.dart';

import '../../../../provider/auth_provider.dart';
import '../../../../utils/language.dart';
import '../../home/home_screen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  late GlobalKey<FormState> _formKeyLogin;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: username,
                hintText: enterYourName,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: password,
                hintText: enterPassword,
              ),
            ),
          ),

          const SizedBox(height: 20,),

          CustomButton(
            width: width*0.6,
            name: login,
            onPressed: (){

              String email = _emailController.text.trim();
              String password = _passwordController.text.trim();

              if (_emailController.text.isEmpty) {
                showCustomSnackBar(enterYourName, context);
                return;
              }else if(!_emailController.text.isValidEmail()){
                showCustomSnackBar(checkYourUsername, context);
                return;
              }else if(_passwordController.text.isEmpty){
                showCustomSnackBar(enterPassword, context);
                return;
              }

              Provider.of<AuthProvider>(context, listen: false).userLogin(
                  username: email,
                  password: password,
                  callback: loginFunction
              );

            },
          ),

        ],
      ),
    );
  }

  void loginFunction(bool status){
    if(status){
      Navigator.pushNamed(context, RouteHelper.homeRoute);
    }else{
      showCustomSnackBar(invalidLogin, context);
    }
  }

}
