import 'package:currency_app/models/nbu_models.dart';
import 'package:dio/dio.dart';

class NbuService {
  static Future<List<NbuModel>> getCurrencies() async {
    Response res = await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
    return (res.data as List).map((e) => NbuModel.fromJson(e)).toList();
  }
}
