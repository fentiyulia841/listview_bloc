import 'package:area_api/models/wilayah_model.dart';
import 'wilayah_provider.dart';

class WilayahRepository {
  final _provider = WilayahProvider();

  
  Future<WilayahModel> fetchWilayahList() {
    return _provider.fetchWilayahList();
  }
}

class NetworkError extends Error {
  
}
