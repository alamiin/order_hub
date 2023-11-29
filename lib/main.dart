import 'package:flutter/material.dart';
import 'package:order_hub/provider/order_provider.dart';
import 'package:order_hub/utils/route_helper.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/feedback_provider.dart';
import 'utils/di_container.dart' as di;


Future<void> main() async {
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FeedbackProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OrderProvider>()),
    ],
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: RouteHelper.defaultRoute,
      routes: RouteHelper.init(),
    );
  }
}


