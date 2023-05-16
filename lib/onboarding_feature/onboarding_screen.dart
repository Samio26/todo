import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/helpers/onBoardinfo.dart';
import 'package:todo/navigation/routes.dart';
import 'package:todo/onboarding_feature/widgets/button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controllerr=PageController();
    return Scaffold(
      body:SafeArea(
        child: PageView.builder(
          controller: controllerr,
          itemCount: 3,
          itemBuilder: ((context, index) => 
           Column(
            
            children: [
              const SizedBox(height: 10,),
              Image.asset("assets/onBoard.png",height: 250,),
              const SizedBox(height:20),
          SmoothPageIndicator(controller: controllerr, count: 3,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10
          ),
          ),
            const SizedBox(height: 25),
            Text(Board.titles[index],style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
            const SizedBox(height: 15,),
            Text(Board.description[index],style: TextStyle(fontSize: 16,color: Colors.grey),textAlign: TextAlign.center,),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          TextButton(onPressed:(){
            Navigator.of(context).pushNamedAndRemoveUntil(homeScreen, (route) => false);
          },
          child: Text("Skip",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.w500),),),
          Buttonnext(function: () {
         index==2?controllerr.animateToPage(0, duration: Duration(microseconds: 400), curve: Curves.easeInOut):
            controllerr.nextPage( duration: Duration(microseconds: 400), curve: Curves.easeInOut);
          },)
          
        
              ],),
            ),
          const SizedBox(height: 20,)
            ],
          )
        ),
      ) ),
    );
  }
}