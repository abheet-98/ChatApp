import 'package:flutter/material.dart';
import '../screens/recent_requests.dart';

Widget home_screen_widget(BuildContext context){
  return Column(
    children: <Widget>[
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[400],

          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal:20.0,vertical: 15.0),
                child: Row(
                  children: <Widget>[

                    Text(
                      "Messages",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0
                      ),
                    )
                  ],
                ),
              ),

              RecentRequestsPage(),

            ],
          ),
        ),
      )
    ],
  );
}