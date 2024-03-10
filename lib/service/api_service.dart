
import 'dart:convert';

import 'package:currency_converter/constants/conostant.dart';
import 'package:currency_converter/model/currency_model.dart';
import 'package:http/http.dart' as http;


class ApiService{

    Future<List<Curreny_Model>>getLatest(String baseCurrency)async{

       List<Curreny_Model>currencyModelist=[];

       String url="${base_url}apikey=$apiKey&baseCurrency=$baseCurrency";
           try{
               final response=await http.get(Uri.parse(url));
                if(response.statusCode==200){
                   Map<String,dynamic>json=jsonDecode(response.body);
                   Map<String, dynamic>body=json['data'];
                   body.forEach((key, value) {
                      Curreny_Model curreny_model=Curreny_Model.fromJson(value);
                        currencyModelist.add(curreny_model);
                   });
                return  currencyModelist;
                }else{
                   return [];
                }
           }catch(e){

               throw e.toString();
           }
    }



Future<List<Curreny_Model>>getExchange(String baseCurrency, String targetCurrency)async{

  List<Curreny_Model>currencyModelist=[];

  String url="${base_url}apikey=$apiKey&baseCurrency=$baseCurrency&currencies=$targetCurrency";
  try{
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      Map<String,dynamic>json=jsonDecode(response.body);
      Map<String, dynamic>body=json['data'];
      body.forEach((key, value) {
        Curreny_Model curreny_model=Curreny_Model.fromJson(value);
        currencyModelist.add(curreny_model);
      });
      return  currencyModelist;
    }else{
      return [];
    }
  }catch(e){

    throw e.toString();
  }
}

}