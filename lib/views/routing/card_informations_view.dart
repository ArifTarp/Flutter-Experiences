import 'package:flutter/material.dart';
import 'package:flutter_tutorial/views/routing/detail_view.dart';
import 'package:flutter_tutorial/views/routing/navigation_route_with_enum.dart';
import 'package:flutter_tutorial/views/routing/navigation_route.dart';
import 'package:flutter_tutorial/views/routing/transitions/enter_exit_route.dart';
import 'package:flutter_tutorial/views/routing/transitions/fade_route.dart';
import 'package:flutter_tutorial/views/routing/transitions/rotation_route.dart';
import 'package:flutter_tutorial/views/routing/transitions/scale_rotate_route.dart';
import 'package:flutter_tutorial/views/routing/transitions/scale_route.dart';
import 'package:flutter_tutorial/views/routing/transitions/size_route.dart';
import 'package:flutter_tutorial/views/routing/transitions/slide_route.dart';

class CardInformationsView extends StatefulWidget {
  CardInformationsView({Key key}) : super(key: key);

  @override
  _CardInformationsViewState createState() => _CardInformationsViewState();
}

class _CardInformationsViewState extends State<CardInformationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Card(
        margin: EdgeInsets.only(top: 200, bottom: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://i.picsum.photos/id/384/200/300.jpg?hmac=XxaMr3mI-4OhEVSNwfLw4oqF4Je819ACxZKz52AzXvQ"),
            Text("ads"),
            RaisedButton.icon(
              onPressed: () {
                //Navigator.of(context).pushNamed("/detailView"); // or
                //Navigator.pushNamed(context, "/detailView"); // or

                // push work as stack of views. And we delete view
                //Navigator.pushNamedAndRemoveUntil(context, "/detailView", (route) => false,arguments: "Arif"); // or
                //Navigator.pushNamed(context, NavigationRoute.DETAIL, arguments: "Arif"); //or
                //Navigator.pushNamed(context, navigationRouteConverter(NavRoute.DETAIL), arguments: "Arif"); //or

                // overrides the view that comes after it. similar to "Navigator.pushNamedAndRemoveUntil"
                //Navigator.pushReplacementNamed(context, navigationRouteConverter(NavRoute.DETAIL),arguments: "Arif"); //or

                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailView(),settings: RouteSettings(arguments: "Arif")));*/ //or

                // ROUTE TRANSITIONS
                /*Navigator.push(
                    context,
                    EnterExitRoute(
                        enterPage: DetailView(),
                        exitPage: CardInformationsView(),
                        settings: RouteSettings(arguments: "Arif")));*/ 
                //or
                /*Navigator.push(
                    context,
                    FadeRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));*/
                //or
                /*Navigator.push(
                    context,
                    RotationRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));*/
                //or
                /*Navigator.push(
                    context,
                    ScaleRotateRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));*/
                //or
                /*Navigator.push(
                    context,
                    ScaleRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));*/
                //or
                /*Navigator.push(
                    context,
                    SizeRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));*/
                //or
                /*Navigator.push(
                    context,
                    SlideTopRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));*/
                //or
                /*Navigator.push(
                    context,
                    SlideBottomRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));*/
                //or
                /*Navigator.push(
                    context,
                    SlideRightRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));*/
                //or
                Navigator.push(
                    context,
                    SlideLeftRoute(page: DetailView(),settings: RouteSettings(arguments: "Arif")));    
              },
              icon: Icon(Icons.details),
              label: Text("Read More..."),
            )
          ],
        ),
      )),
    );
  }
}
