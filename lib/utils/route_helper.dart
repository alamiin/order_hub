import 'package:flutter/material.dart';
import 'package:order_hub/ui/screen/auth/login_screen.dart';
import 'package:order_hub/ui/screen/feedback/feedback_screen.dart';
import 'package:order_hub/ui/screen/home/home_screen.dart';
import 'package:order_hub/ui/screen/invoice/invoice_screen.dart';
import 'package:order_hub/ui/screen/order/order_screen.dart';

class RouteHelper{
  static const String defaultRoute = "/";
  static const String homeRoute = "/home";
  static const String feedbackRoute = "/feedback";
  static const String orderRoute = "/order";
  static const String invoiceRoute = "/invoice";
  static Map<String, WidgetBuilder> init(){
    return {
      defaultRoute: (context) => const LoginScreen(),
      homeRoute: (context) => const HomeScreen(),
      feedbackRoute: (context) => const FeedbackScreen(),
      orderRoute: (context) => const OrderScreen(),
      invoiceRoute: (context) => const InvoiceScreen(),
    };
  }
}