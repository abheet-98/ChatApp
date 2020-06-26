import 'package:bethere_app/blocs/requestmessage/request_message.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bethere_app/models/request.dart';
import 'package:bethere_app/core/todos_app_core.dart';
import 'package:bethere_app/models/models.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestMessageTile extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final RequestMessage requestMessage;

  RequestMessageTile({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.requestMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.requestMessage.id.toString()),
//      onDismissed: onDismissed,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          //height: 150.0,
          margin:
          EdgeInsets.only(top: 5.0, bottom: 1.0, right: 5.0, left: 5.0),
          padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 2.0,
                  ),
                ],
            ),
          // child: Row(
          //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Badge(
                    badgeColor: Colors.deepPurple,
                    shape: BadgeShape.circle,
                    /* borderRadius: 20,
                        toAnimate: false,
                        badgeContent:
                            Text('NEW', style: TextStyle(color: Colors.white)), */
                    //showBadge: this.requestMessage.seen,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Text(
                          this.requestMessage.itemTitle != null
                              ? this.requestMessage.itemTitle
                              : 'Blank',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Text(
                          this.requestMessage.messageText != null
                              ? this.requestMessage.messageText
                              : 'Blank',
                          maxLines: 4,
                          style: TextStyle(fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Text(this.requestMessage.createdDate),
                        // child: Text(
                        //   this.requestMessage.messageText != null
                        //       ? this.requestMessage.messageText
                        //       : 'Blank',
                        //   style: TextStyle(fontSize: 15.0),
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.0001,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(this.requestMessage.status.text),
                      // SizedBox(
                      //   height: 5.0,
                      // ),
                      // Text(this.requestMessage.createdDate),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 4,
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        BlocProvider.of<RequestMessageBloc>(context)
                            .add(RequestMessageAccept(this.requestMessage));
                      },
                      // child: Padding(
                      //   padding: EdgeInsets.all(1.0),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Accept',
                              style: TextStyle(
                                fontSize: 12,
                                
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              
                              Icons.check_circle,
                              color: Colors.white,
                              size: 28.0,
                            )
                          ],
                        ),
                      //),
                    ),

                    // child: Row(
                    //   children: <Widget>[
                    //     Text("Accept"),
                    //     IconButton(
                    //       icon: const Icon(Icons.check_box),
                    //       tooltip: 'Accept',
                    //       onPressed: () {
                    //         // RequestBloc()..add(RequestLoaded(Request(id: 1)));
                    //       },
                    //     ),
                    //   ],
                    // ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        BlocProvider.of<RequestMessageBloc>(context)
                            .add(RequestMessageReject(this.requestMessage));
                      },
                      // child: Padding(
                      //   padding: EdgeInsets.all(1.0),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Reject',
                              style: TextStyle(
                                fontSize: 12,
                                
                                color: Colors.white,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12.0,
                                                          child: Icon(
                                Icons.clear,
                                color: Theme.of(context).accentColor,
                              ),
                            )
                          ],
                        ),
                      //),
                    ),

                    
                  ),
                  
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 4,
                  // ),
                ],
              )
            ],
          ),
          
        ),
      ),
    );
  }
}
