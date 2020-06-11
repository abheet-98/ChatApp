import 'package:flutter/material.dart';

import '../models/message_model.dart';
import 'RecentChats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chat App',
          style: TextStyle(            
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
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
                  RecentChats(),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
