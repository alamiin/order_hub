
import 'package:order_hub/data/local/csv_loader.dart';
import '../model/ApiResponse.dart';
import '../remote/api_client.dart';

class OrderRepo {
  final ApiClient apiClient;
  final CsvLoader csvLoader;
  OrderRepo( {required this.apiClient, required this.csvLoader});

  Future<ApiResponse> getOrderForm() async {
    return await apiClient.getData('/form');
  }

  Future<List<List<dynamic>>> getCsvData() async{
    return await csvLoader.loadCsvFile("assets/fruit_prices.csv");
  }

}