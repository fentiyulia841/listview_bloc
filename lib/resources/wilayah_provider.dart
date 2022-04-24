import 'package:dio/dio.dart';
import 'package:area_api/models/wilayah_model.dart';

class WilayahProvider {
  final Dio _dio = Dio();
  final String url =
      "https://api.binderbyte.com/wilayah/provinsi?api_key=9c7601e6836a0e5473a2e0f9d895e54f5e25272ea32bd196d180b211c9ebdac6";
  
  // future<wilayahmodel> is empty
  Future<WilayahModel> fetchWilayahList() async {
    try {
      //setelah await selesai wilayah model terisi
      Response response = await _dio.get(url);
      return WilayahModel.fromJson(response.data);

      
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return WilayahModel.withError("Data not found / Connection issue");
    }   
  }
}
