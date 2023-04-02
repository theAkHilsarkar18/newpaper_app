import 'package:flutter/material.dart';
import 'package:newpaper_app/homescreen/view/homescreen.dart';
import 'package:provider/provider.dart';

import 'homescreen/provider/homeprovider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Homescreen(),
        },
      ),
    ),
  );
}