import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui_starter/blocs/blocs.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';

import '../screens/loading_indicator.dart';


Widget chat_screeen_widget(User user,context,List<Message> messages){
  return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.grey[200]),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 35.0,
                      color: Colors.black38,
                      onPressed: (){ Navigator.pop(context); },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50.0,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: CircleAvatar(radius: 40.0,backgroundImage: AssetImage(user.imageUrl),),
                      ),
                      SizedBox(height: 10.0,),
                      Text(user.name,style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10.0,),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.grey[200]),
                    child: IconButton(
                      icon: Icon(Icons.more_vert),
                      iconSize: 35.0,
                      color: Colors.black38,
                      onPressed: (){  },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: ListView.builder(
                      
                      padding: EdgeInsets.only(top:15.0),
                      itemBuilder: (BuildContext context, int index){
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id ;
                        return  Container(
                          margin: isMe ?
                          EdgeInsets.only(
                            top:8.0,bottom:8.0,left:80.0
                          ) :
                          EdgeInsets.only(
                            top:8.0,bottom:8.0,right:80.0
                          ) ,
                          padding: EdgeInsets.symmetric(horizontal:25.0,vertical:15.0),
                          color: isMe ? Theme.of(context).accentColor: Colors.blueGrey[100],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(message.time, style: TextStyle(fontSize: 12.0),),
                              SizedBox(height: 8.0,),
                              Text(message.text),
                            ],
                          ) ,
                        );
                      } ,
                      itemCount: messages.length,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal:8.0),
                height: 70.0,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.attachment),
                      iconSize: 25.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){},
                    ),
                    Expanded(
                      child: TextField(
//                        controller: _textController ,
                        decoration: InputDecoration.collapsed(
                          hintText: "Type a message",
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      iconSize: 25.0,
                      color: Theme.of(context).primaryColor,
//                      onPressed: _onSubmit,
                    ),

                  ],
                ),
              )
                      ],
                    ),
                  );
}