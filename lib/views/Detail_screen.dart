import 'package:dart_covid_app/views/CountryList.dart';
import 'package:dart_covid_app/views/world_page.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name,image;

  int totalCases,totalDeaths,totalRecovered,active,critical,todayRecovered,test;

   DetailScreen({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,

});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
  appBar:  AppBar(
    backgroundColor: const Color(0xff454545),
    title: Text(widget.name,style:const TextStyle(color: Colors.white),),
    centerTitle: true,
    automaticallyImplyLeading: true,
    elevation: 0,
  ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
          children: [
            Padding(
              padding:const EdgeInsets.only(top: 55),
              child: Card(
                       color: const Color(0xff454545),
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    ReusbaleRow(title: 'Cases', value:widget.totalCases.toString() ),
                    ReusbaleRow(title: 'Recovered', value:widget.totalRecovered.toString() ),
                    ReusbaleRow(title: 'Death', value:widget.totalDeaths.toString() ),
                    ReusbaleRow(title: 'Critical', value:widget.critical.toString() ),
                    ReusbaleRow(title: 'Today Recovered', value:widget.todayRecovered.toString() ),

                  ],
                ),
              ),
            ),
            CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),

        ],
      ),
        ],
      ),
    );
  }
}
