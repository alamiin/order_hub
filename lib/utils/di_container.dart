

import 'package:get_it/get_it.dart';
import 'package:order_hub/data/local/csv_loader.dart';
import 'package:order_hub/data/repository/order_repo.dart';
import 'package:order_hub/provider/order_provider.dart';

import '../data/remote/api_client.dart';
import '../provider/auth_provider.dart';
import '../provider/feedback_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //base
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton(() => CsvLoader());

  //Repository
  sl.registerLazySingleton(() => OrderRepo(apiClient: sl(), csvLoader: sl()));

  // Provider
  sl.registerFactory(() => AuthProvider());
  sl.registerFactory(() => FeedbackProvider());
  sl.registerFactory(() => OrderProvider(orderRepo: sl()));


}
