import 'package:dart_covid_app/Models/WorldCasesModel.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Services/Apis_hitting.dart';
import 'CountryList.dart';

class WorldScreen extends StatefulWidget {
  const WorldScreen({super.key});

  @override
  State<WorldScreen> createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> with TickerProviderStateMixin {

  late final AnimationController _controller =AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,)..repeat();

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  final brown = [
     const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];


  @override
  Widget build(BuildContext context) {
    StateServices  myModel = StateServices();
    return  Scaffold(
        backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(15),
          child: Column(
            children: [
              FutureBuilder(
              future: myModel.getWorldApi(),
          builder: (context, AsyncSnapshot<WorldCasesModel> snapshot) {
                 if(snapshot.hasData){
                    return const PieChart(dataMap: {
                      "Total": 20,
                      "Recovered": 10,
                      "Deaths": 5,
                    },
                      chartValuesOptions:  ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                      animationDuration:  Duration(milliseconds: 1200),
                      chartType: ChartType.ring,
                      colorList:  [
                        Color(0xff4285F4),
                        Color(0xff1aa260),
                        Color(0xffde5246),
                      ],
                      legendOptions: LegendOptions(
                        legendPosition: LegendPosition.left,
                      ),

                    );
                 } else {
                   return const  Text('Loading');

                     }


          },

        ),
              const SizedBox(
                height: 20,
              ),
              Card(
                color: const Color(0xff454545),
                child: Column(
                  children: [
                    ReusbaleRow(title: 'Total', value: '20'),
                    ReusbaleRow(title: 'Recovered', value: '10'),
                    ReusbaleRow(title: 'Deaths', value: '30'),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const CountryList() ));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color:const Color(0xff1aa260),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:const Center(child: Text('Track Countries',style: TextStyle(color: Colors.white,fontSize: 18),),),
                ),
              ),
            ],
          ),

        ),
      ),

    );
  }

}


class ReusbaleRow extends StatelessWidget {
  String title,value;
   ReusbaleRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(top: 15,left: 10,right: 15,bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style:const TextStyle(color: Colors.white),),
              Text(value,style:const TextStyle(color: Colors.white)),
            ],

          ),
         const SizedBox(height: 10,),
         const Divider(),
        ],

      ),

    );
  }
}

