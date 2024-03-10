
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:currency_converter/model/currency_model.dart';
import 'package:currency_converter/service/api_service.dart';
import 'package:flutter/material.dart';

import 'components/all_curency_listitem.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
     ApiService apiService=ApiService();
     String _selectedCurrency="USD";

     Widget _dropDownItem (Country country)=>
          Container(
            child: Row(
               children: [
                 CountryPickerUtils.getDefaultFlagImage(country),
                  SizedBox(width: 8,),
                 Text('${country.currencyName}'),
               ],
            ),
          );

  @override
  Widget build(BuildContext context) {
    return  Column(
         children: [
             SizedBox(height: 8,),
            Center(
              child: Text("Base Currency",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
              ),
            ),
           SizedBox(height: 8,),

            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),

              ),
              child: CountryPickerDropdown(
                 initialValue: 'us',
                itemBuilder:_dropDownItem ,
                onValuePicked: (Country? country){
                   setState(() {
                     _selectedCurrency=country?.currencyCode ?? "";
                   });
                }
              ),
            ),
           SizedBox(height: 8,),
           Center(
             child: Text("All Currency",
               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
             ),
           ),
           SizedBox(height: 8,),

             FutureBuilder(future: apiService.getLatest(_selectedCurrency),
                 builder: (context, snapshot){
                  if(snapshot.hasData){
                    List<Curreny_Model>currencyModelList=snapshot.data ??[];

                    return Expanded(
                        child: ListView.builder(
                            itemBuilder: (context ,index){
                              return allcurencylistitem(curreny_model:currencyModelList[index],);
                            },
                           itemCount: currencyModelList.length,
                            ),
                    );
                  }
                    if(snapshot.hasError){
                       return Center(
                          child: Text(
                             "Error occured",
                          ),

                       );
                    }
                     return Center(child: CircularProgressIndicator(),);
                 }),

         ],
    );
  }
}
