import 'dart:convert';
import 'package:dart_covid_app/Models/WorldCasesModel.dart';
import 'package:dart_covid_app/Services/appUrl.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;

class StateServices{
  Future<WorldCasesModel> getWorldApi() async{
     final response = await http.get(Uri.parse(Appurl.WorldStatesApi));

     if(response.statusCode == 200){
       var data =jsonDecode(response.body);
      return  WorldCasesModel.fromJson(data);

     }else{
      throw Exception('Error');
     }
  }
}


class Apishitting{
  Future<List<dynamic>> CountriesListApi() async{
    var data;

    debugPrint('URL : ${Appurl.countriesList}');

    final response = await http.get(Uri.parse(Appurl.countriesList));


    debugPrint('Response Received From API: ${response.body.toString()}'
        'Status Code=: ${response.statusCode.toString()}');

    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      return data;
    }
    else if(response.statusCode!=200){
      return Future.error(response.statusCode);
    }
    return jsonDecode(response.body);




  }

}