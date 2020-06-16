import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui_starter/blocs/blocs.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';
import 'RecentChats.dart';
import 'chatscreen.dart';
import 'loading_indicator.dart';


class ChatScreen extends StatefulWidget {

  final User user;

  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _flag = false; 

  // EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  
];

  
  final _textController = TextEditingController();

  _onSubmit(){
    setState(() {

      DateTime now = DateTime.now();
      String formattedTime = DateFormat.jm().format(now);      

      int range=_textController.text.length;
      var string=_textController.text;

      

      for(int i=0; i<range;i++)
      {
        if(string[i] != " ")
          _flag=true;
      }
      if(_textController.text!="" && _flag){
        
        Message mesg = new Message(
        sender: currentUser,
        time: formattedTime,
        text: _textController.text,
        isLiked: false,
        unread: true,
      );
      Message reply = new Message(
        sender: greg,
        time: formattedTime,
        text: 'Hii how are you?',
        isLiked: false,
        unread: true,
      );
      
      messages.add(mesg);
      messages.add(reply);

      
      _textController.clear();
      _flag=false;}
    });
  }

  _buildMsg(Message message,bool isMe){
    return Container(
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
  }

  _buildmessagetype(){
    return Container(
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
              controller: _textController ,
              decoration: InputDecoration.collapsed(
                hintText: "Type a message",
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: _onSubmit,
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context){
          return ChatsBloc()..add(ChatsLoadedEvent(widget.user));
        },
        child: chats_screeen(context,messages),
      ),
    );
  }
}

Widget chats_screeen(BuildContext context,List<Message> message){
  return BlocBuilder<ChatsBloc,ChatsState>(
    builder:(context,state){
      print(state);
      if(state is ChatsLoadInProgress){
          return LoadingIndicator();
        }
        if(state is ChatsLoaded){
          final user = state.user;

         return chat_screeen_widget(user,context,message);
        }
        if(state is ChatsLoadSuccess){
          final user = state.user;

         return chat_screeen_widget(user,context,message);
        }
        if(state is ChatsLoadFailure){

        }
        if(state is ChatsLoading){
          return LoadingIndicator();
        }
        return LoadingIndicator();
    } ,
  );
}
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

/*
GestureDetector(
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
                        child: CircleAvatar(radius: 40.0,backgroundImage: AssetImage(widget.user.imageUrl),),
                      ),
                      SizedBox(height: 10.0,),
                      Text(widget.user.name,style: TextStyle(fontWeight: FontWeight.bold),),
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
                        return _buildMsg(message,isMe);
                      } ,
                      itemCount: messages.length,
                    ),
                  ),
                ),
              ),
              _buildmessagetype(),
            ],
          ),
        ),
        */