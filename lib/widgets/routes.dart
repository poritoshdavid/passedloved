import 'package:flutter/material.dart';

class Routes{
  BuildContext context;
  Routes({required this.context});
  routePush(Widget widget){
    Route route = MaterialPageRoute(builder: (c)=>widget);
    Navigator.push(context, route);
  }

  routeReplace(Widget widget){
    Route route = MaterialPageRoute(builder: (c)=>widget);
    Navigator.of(context).pushReplacement(route);
  }

}