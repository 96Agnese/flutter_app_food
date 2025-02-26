import 'package:flutter/material.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'NotoSerif',


        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: TextStyle(
            color: Color.fromARGB(20, 51, 51, 1),
          ),

          bodyText1: TextStyle(color: Color.fromARGB(20, 51, 51, 1),
          ),


          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'PTSans',
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
     // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },

      onGenerateRoute: (settings) {
        print (settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);


        },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },

    );
  }
}


