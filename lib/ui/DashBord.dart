
import 'package:currency_converter/ui/exchange.dart';
import 'package:currency_converter/ui/home.dart';
import 'package:flutter/material.dart';

class DashBord extends StatefulWidget {
  const DashBord({super.key});

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {

    int _selectedIndex=0;

      Widget getView(){

         if(_selectedIndex==0){
            return const Homepage();
         }
          return const Exchange();
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Flutter Currency Exchange"),centerTitle: true,
        ),
       body: getView(),
       bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
            onTap: (index){
             setState(() {
               _selectedIndex=index;
             });
            },
          items:const [
             BottomNavigationBarItem(icon: Icon(Icons.home), label:"Home"),
            BottomNavigationBarItem(icon: Icon(Icons.currency_exchange), label: "Exchange"),
          ],
       ),
    );
  }
}
