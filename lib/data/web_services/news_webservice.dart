import 'package:daily_news/constants/strings.dart';
import 'package:dio/dio.dart';


class NewsWebService {
  late Dio dio;

  NewsWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 100, //60 seconds
      receiveTimeout: 20 * 100,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllNews() async {
    try {
      Response response = await dio.get('');
      print(response.data['results']);
      return response.data['results'];
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}
