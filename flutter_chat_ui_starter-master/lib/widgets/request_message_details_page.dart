import 'package:bethere_app/blocs/requestmessagedetails/request_message_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bethere_app/core/todos_app_core.dart';
import 'package:bethere_app/blocs/blocs.dart';
import 'package:bethere_app/widgets/widgets.dart';
import 'package:bethere_app/screens/screens.dart';
import 'package:bethere_app/models/request.dart';
import '../app_keys.dart';

class RequestMessageDetailsPage extends StatelessWidget {
  final RequestMessage requestMessage;
  RequestMessageDetailsPage({this.requestMessage});

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return MultiBlocProvider(
        providers: [
          BlocProvider<RequestMessageDetailsBloc>(
            create: (context) => RequestMessageDetailsBloc()
              ..add(RequestMessageDetailsLoaded(this.requestMessage)),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text("Details"),
          ),
          body: BlocConsumer<RequestMessageDetailsBloc,
              RequestMessageDetailsState>(
            listener: (context, state) {
//        if(state is )
            },
            builder: (context, state) {
              if (state is RequestMessageDetailsLoadInProgress) {
                return LoadingIndicator(key: ArchSampleKeys.todosLoading);
              } else if (state is RequestMessageDetailsLoadSuccess) {
                final coursePrice = Container(
                  padding: const EdgeInsets.all(7.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: new Text(
                    "Completed",
                    style: TextStyle(color: Colors.white),
                  ),
                ); /*  */
                final topContentText = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 42.0),
                    Text(
                      state.objectData.influencerName,
                      style: TextStyle(color: Colors.white, fontSize: 45.0),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.58,
                        ),
                        Expanded(flex: 1, child: coursePrice)
                      ],
                    ),
                  ],
                );
                final topContent = Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage(
                                "assets/images_main/blank-profile-picture.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      padding: EdgeInsets.all(40.0),
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
                      child: topContentText,
                    ),
                    // Positioned(
                    //   left: 8.0,
                    //   top: 60.0,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: Icon(Icons.arrow_back, color: Colors.white),
                    //   ),
                    // )
                  ],
                );
                final bottomContentText = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Ref No. : #" + state.objectData.order.referenceNumber,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Customer Name: " + state.objectData.user.name,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Booking Date: " + state.objectData.order.orderDate,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child:
                    Text(
                      "Instructions: " + state.objectData.instructions,
                      style: TextStyle(fontSize: 16.0),
                    ),),
                    Divider(
                      thickness: 1.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child:
                    Text(
                      "Item Name: " + state.objectData.order.item.subItemName,
                      style: TextStyle(fontSize: 16.0),
                    ),),
                    Divider(
                      thickness: 1.0,
                    ),Padding(
                      padding: EdgeInsets.all(5.0),
                      child:
                    Text(
                      "Gross Amount: " +
                          state.objectData.order.grossAmount.toString(),
                      style: TextStyle(fontSize: 16.0),
                    ),),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child:
                    Text(
                      "Discount: " + state.objectData.order.discount.toString(),
                      style: TextStyle(fontSize: 16.0),
                    ),),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child:
                    Text(
                      "Total Amount: " + state.objectData.order.totalAmount,
                      style: TextStyle(fontSize: 16.0),
                    ),),
                    Divider(
                      thickness: 1.0,
                    ),
                  ],
                );

                final buttons = Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
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
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
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
                            SizedBox(
                              width: 3.0,
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
                    ],
                  ),
                );

                final bottomContent = Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[bottomContentText],
                  ),
                );
                return Column(
                  children: <Widget>[topContent, bottomContent, buttons],
                );
                // return Container(height:100.0, child: Text(state.objectData.negotiation.amount));
//                 final requests = state.requestmessages;
//                 print("requests" + requests.toString());

//                 return ListView.builder(
//                   key: ArchSampleKeys.todoList,
//                   itemCount: requests != null && requests.length > 0
//                       ? requests.length
//                       : 0,
//                   itemBuilder: (BuildContext context, int index) {
// //                    final request = requests[index];
//                     return RequestMessageTile(
//                       requestMessage: requests[index],
//                       onDismissed: (direction) {},
//                       onTap: () async {

//                       },
// //                onCheckboxChanged: (_) {
// //                  BlocProvider.of<RequestMessageDetailsBloc>(context).add(
// //                    TodoUpdated(request.copyWith(complete: !request.complete)),
// //                  );
// //                },
//                     );
//                   },
//                 );
              } else {
                return Container(key: AppKeys.filteredRequestEmptyContainer);
              }
            },
          ),
        ));
  }
}
