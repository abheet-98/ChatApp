import 'package:flutter/material.dart';
import 'request_message.dart';
import '../models/message_model.dart';

class RecentRequestsPage extends StatefulWidget {
  @override
  _RecentRequestsPageState createState() => _RecentRequestsPageState();
}

class _RecentRequestsPageState extends State<RecentRequestsPage> {
  @override
  Widget build(BuildContext context) {
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
                onTap: ()=> Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (_) => RequestMessagePage(user:chat.sender),
                  ),
                ),
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
}