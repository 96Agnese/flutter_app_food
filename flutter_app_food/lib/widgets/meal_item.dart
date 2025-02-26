import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
           @required this.id,
           @required this.title,
            @required this.imageURL,
            @required this.duration,
            @required this.complexity,
             @required this.affordability,
  });

String get complexityText {
  switch (complexity) {
    case Complexity.Simple:
      return 'Simple';
      break;
    case Complexity.Challenging:
      return'Challenging';
      break;
    case Complexity.Hard:
      return 'Hard';
      break;
    default:
      return 'Unknow';

  }
}


String get affordabilityText {
  switch (affordability) {
    case Affordability.Affordable:
      return 'Affordable';
      break;
    case Affordability.Pricey:
      return'Pricey';
      break;
    case Affordability.Luxurious:
      return 'Luxurious';
      break;
    default:
      return 'Unknow';

  }
}




  void selectMeal(BuildContext context) {
  Navigator.of(context).pushNamed(MealDetailScreen.routeName,
                          arguments: id,
  );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
     child: Card(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
     ),
       elevation: 4,
       margin: EdgeInsets.all(10),
       child: Column(
         children: [
           Stack(
             children: [
               ClipRect(
                child: Align (
                alignment: Alignment.topCenter,

                 child: Image.network(
                         imageURL, height: 250,
                        width: double.infinity,
                         fit: BoxFit.cover,
                 ),
               ),
               ),
               Positioned(
                 bottom: 20,
                 right: 10,

                 child: Container(
                   width: 300,
                   color: Colors.black54,
                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),

                   child: Text(title, style: TextStyle(fontSize: 23,
                         color: Colors.white,
                   ),
                     softWrap: true,
                     overflow: TextOverflow.fade,

                   ),
                 ),
               )

             ],
            ),
           Padding(
             padding: const EdgeInsets.all(20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6,),
                    Text('$duration min', style: TextStyle(color: Colors.black),),
                  ],),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(width: 6,),
                    Text('$complexityText', style: TextStyle(color: Colors.black),),
                  ],),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6,),
                    Text('$affordabilityText', style: TextStyle(color: Colors.black),),
                  ],),





              ],

             ),
           )
         ],
       ),
     ),
    );
  }
}
