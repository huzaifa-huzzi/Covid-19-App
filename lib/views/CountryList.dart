import 'package:dart_covid_app/views/world_page.dart';
import 'package:flutter/material.dart';

import '../Services/Apis_hitting.dart';
import 'Detail_screen.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {

   final SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     final Model  = Apishitting();
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding:const EdgeInsets.only(left: 0,right: 50),
            child: Row(

              children: [
                Padding(
                  padding:const EdgeInsets.only(right: 300),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldScreen()));
                      },
                        child:const Icon(Icons.arrow_back,color: Colors.white,)),
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:const EdgeInsets.only(left: 20,right: 20),
            child: TextFormField(
              controller:SearchController ,
              onChanged: (value){
                setState(() {

                });

              },
              decoration: InputDecoration(
                hintText: 'Search with countries',
                hintStyle:const TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.normal),
                contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                   borderRadius:BorderRadius.circular(50),
                ),

              ),
            ),
          ),
          Expanded(
              child:FutureBuilder(
                  future:Model.CountriesListApi() ,
                  builder: (context , snapshot){
                    if(!snapshot.hasData){
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context,index){
                            return const Column(
                              children: [
                                // ListTile(
                                //   title: Text(snapshot.data![index]['country']),
                                //   leading: CircleAvatar(
                                //     radius: 50,
                                //     backgroundImage: NetworkImage(snapshot.data![index]['countryInfo']['flag']),
                                //   ),
                                // subtitle: Text(snapshot.data![index]['cases'].toString()),
                                //),
                              ],
                            );
                          }
                      );
                    }else if(snapshot.hasError){
                      debugPrint('Error Getting Data ${snapshot.error.toString()}');
                    } else{
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){

                            String name = snapshot.data![index]['country'];

                            if(SearchController.text.isEmpty){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailScreen(
                                   name: snapshot.data![index]['country'],
                                   image:snapshot.data![index]['countryInfo']['flag'],
                                   totalCases: snapshot.data![index]['cases'],
                                   totalRecovered:snapshot.data![index]['recovered'],
                                   totalDeaths:snapshot.data![index]['deaths'],
                                   active:snapshot.data![index]['active'],
                                   test:snapshot.data![index]['tests'] ,
                                   todayRecovered:snapshot.data![index]['todayRecovered'] ,
                                   critical:snapshot.data![index]['critical'] ,

                                  )));
                                },
                                child: Column(
                                    children: [
                                      ListTile(
                                          title: Text(snapshot.data![index]['country'],style:const TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),
                                          leading: CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(snapshot.data![index]['countryInfo']['flag'],),
                                          ),
                                          subtitle: Text(snapshot.data![index]['cases'].toString(),style:const TextStyle(fontSize: 12,color: Colors.white),),
                                        ),
                                    ]
                                ),
                              );
                            } else if(name.toLowerCase().contains(SearchController.text.toLowerCase())){
                               return InkWell(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailScreen(
                                     name: snapshot.data![index]['country'],
                                     image:snapshot.data![index]['countryInfo']['flag'],
                                     totalCases: snapshot.data![index]['cases'],
                                     totalRecovered:snapshot.data![index]['recovered'],
                                     totalDeaths:snapshot.data![index]['deaths'],
                                     active:snapshot.data![index]['active'],
                                     test:snapshot.data![index]['tests'] ,
                                     todayRecovered:snapshot.data![index]['todayRecovered'] ,
                                     critical:snapshot.data![index]['critical'] ,

                                   )));
                                 },
                                 child: Column(
                                  children: [
                                    ListTile(
                                        title: Text(snapshot.data![index]['country'],style:const TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),
                                        leading: CircleAvatar(
                                          radius: 50,
                                          backgroundImage: NetworkImage(snapshot.data![index]['countryInfo']['flag'],),
                                        ),
                                        subtitle: Text(snapshot.data![index]['cases'].toString(),style:const TextStyle(fontSize: 12,color: Colors.white),),
                                      ),
                                  ],
                                                               ),
                               );
                            }else{
                              return Container();
                            }

                          }


                      );
                    }
                    return Container();
                  }),
    ),
    ]
    ),
    );

  }
}
