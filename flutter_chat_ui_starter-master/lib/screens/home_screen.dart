import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui_starter/blocs/blocs.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';
import 'RecentChats.dart';
import 'chatscreen.dart';
import 'loading_indicator.dart';

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
      body:  BlocProvider(
        create: (context) {
          return TodosBloc()..add(TodosLoadedEvent(User(id: 1)));
        },
        child: home_screeen(context),
      ),
    );
  }
}



  Widget home_screeen(BuildContext context) {
    return BlocConsumer<TodosBloc, TodosState>(
      listener: (context,state){
        print(state);
        if(state is RecentChatLoaded){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(user:state.user),
            ),
          );
        }

      },
      builder: (context, state) {
        print(state);
        if(state is TodosLoadInProgress){
          return LoadingIndicator();
        }
        if(state is TodosLoadSuccess){
          final user = state.user;

         return home_screeen_widget(user,context);
        }
        if(state is TodosLoadFailure){

        }
        if(state is RecentChatLoading){
          return LoadingIndicator();
        }
        return LoadingIndicator();
      },
    );
  }


Widget home_screeen_widget(User user,context){
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

              RecentChats(context),

            ],
          ),
        ),
      )
    ],
  );
}

Widget RecentChats(BuildContext context) {
  return Expanded(
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
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index){
              final Message chat = chats[index];

              return GestureDetector(
                onTap: ()
                {
                  print("click on user");
                  print(chat.sender.id);
                  return BlocProvider.of<TodosBloc>(context).add(RecentChatLoadedEvent(chat.sender));
                },
//                onTap: ()=> Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (_) => ChatScreen(user:chat.sender),
//                  ),
//                ),
                child: Container(
                  margin: EdgeInsets.only(top:5.0,bottom:5.0,right:10.0,left: 5.0),
                  padding: EdgeInsets.symmetric(horizontal:1.0,vertical:5.0),
                  decoration: BoxDecoration(color: Colors.blueGrey[50]),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(radius: 35.0,backgroundImage: AssetImage(chat.sender.imageUrl),),
                          SizedBox(width:10.0 ,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                chat.sender.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height:5.0 ,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.60,
                                child: Text(
                                  chat.text,
                                  style: TextStyle(fontSize: 15.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                              chat.time
                          ),
                          SizedBox(height: 5.0,),

                        ],
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    ),
  );
}