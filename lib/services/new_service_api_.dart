import 'package:demo/Model/Resultrespnse.dart';
import 'package:dio/dio.dart';

class ResultsAPiservices{

  String _url = "https://opentdb.com/api.php?amount=5&difficulty=medium&type=multiple&category=11";
   Dio? _dio;

   ResultsAPiservices(){
     _dio = Dio();
   }
   Future <List<Result>?>fetchResults() async {
     try {
       Response response = await _dio!.get(_url);
       NewResponse newResponse = NewResponse.fromJson(response.data);
       return newResponse.results;
     }on DioError catch (e){
      print(e);
     }
   }

}

