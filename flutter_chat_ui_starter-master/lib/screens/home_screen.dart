import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui_starter/blocs/blocs.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';
import 'recent_requests.dart';
import 'request_message.dart';
import 'loading_indicator.dart';
import '../widgets/home_screen_widget.dart';

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
          return RecentRequestBloc()..add(RecentRequestLoadedEvent(User(id: 1)));
        },
        child: home_screeen(context),
      ),
    );
  }
}



  Widget home_screeen(BuildContext context) {
    return BlocConsumer<RecentRequestBloc, RecentRequestState>(
      listener: (context,state){
        print(state);
        if(state is MessageShow){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RequestMessagePage(user:state.user),
            ),
          );
        }

      },
      builder: (context, state) {
        print(state);
        if(state is RecentRequestLoadInProgress){
          return LoadingIndicator();
        }
        if(state is RecentRequestLoadSuccess){
          final user = state.user;

         return home_screen_widget(context);
        }
        if(state is RecentRequestLoadFailure){

        }
        
        return LoadingIndicator();
      },
    );
  }