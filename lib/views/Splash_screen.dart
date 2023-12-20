import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:dart_covid_app/views/world_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {


  late final AnimationController _controller =AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,)..repeat();

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldScreen()));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              AnimatedBuilder(
                  animation: _controller,
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child:const Center(
                        child: Image(image: AssetImage('images/virus.png')),
                      ),
                    ),
                  ),
                  builder: (context,Widget ? child){
                    return Transform.rotate(
                        angle:_controller.value *2.0*math.pi,
                      child: child,
                    );
                  }),
           const SizedBox(
             height: 50,
           ),
           const Text('Covid-19',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
           const  Text('Tracker App',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
