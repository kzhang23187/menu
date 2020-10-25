import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/pages/pages.dart';
import 'package:menu/providers/meals.dart';
import 'package:provider/provider.dart';
import './providers/providers.dart';
import 'app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Meals(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => MealsPosition(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: Colors.lightBlue[800],
            accentColor: Colors.cyan[600],

            // Define the default font family.

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: GoogleFonts.quicksandTextTheme(textTheme).copyWith(
              headline2: GoogleFonts.quicksand(
                textStyle: textTheme.headline2,
                // fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
              headline6: GoogleFonts.quicksand(
                textStyle: textTheme.headline5,
                // fontSize: 35,
                // fontWeight: FontWeight.bold,
              ),
              headline5: GoogleFonts.quicksand(
                  textStyle: textTheme.headline5,
                  fontSize: 35,
                  fontWeight: FontWeight.normal),
              bodyText1: GoogleFonts.quicksand(
                fontSize: 15,
                textStyle: textTheme.bodyText1,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          home: App(),
        ));
    // onGenerateRoute: (settings) {
    //   if (settings.name == ProductDetailScreen.routeName) {
    //     return PageRouteBuilder(
    //         pageBuilder: (context, animation, secondaryAnimation) =>
    //             ifAuth(ProductDetailScreen(
    //                 settings.arguments as String)),
    //         transitionsBuilder:
    //             (context, animation, secondaryAnimation, child) {
    //           var curve = Curves.ease;
    //           var tween = Tween<double>(begin: 0.0, end: 1.0)
    //               .chain(CurveTween(curve: curve));

    //           return FadeTransition(
    //               opacity: animation.drive(tween), child: child);
    //         });
    //   }
    //   return ifAuth(ProductsOverviewScreen());
    // }
  }
}
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // Define the default brightness and colors.
//         brightness: Brightness.light,
//         primaryColor: Colors.lightBlue[800],
//         accentColor: Colors.cyan[600],

//         // Define the default font family.

//         // Define the default TextTheme. Use this to specify the default
//         // text styling for headlines, titles, bodies of text, and more.
//         textTheme: GoogleFonts.quicksandTextTheme(textTheme).copyWith(
//           headline2: GoogleFonts.quicksand(
//             textStyle: textTheme.headline2,
//             // fontSize: 35,
//             fontWeight: FontWeight.w400,
//           ),
//           // headline5: GoogleFonts.quicksand(
//           //   textStyle: textTheme.headline5,
//           //   // fontSize: 35,
//           //   // fontWeight: FontWeight.bold,
//           // ),
//           bodyText1: GoogleFonts.quicksand(
//               textStyle: textTheme.bodyText1, fontWeight: FontWeight.normal),
//         ),
//       ),
//       home: App(),
//     );
//   }
// }
