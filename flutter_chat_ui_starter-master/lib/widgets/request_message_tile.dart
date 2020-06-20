import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bethere_app/models/request.dart';
import 'package:bethere_app/core/todos_app_core.dart';
import 'package:bethere_app/models/models.dart';

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
          margin:
              EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0, left: 5.0),
          padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
          decoration: BoxDecoration(color: Colors.blueGrey[50]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CachedNetworkImage(
                    //https://ik.imagekit.io/bethere/tr:w-500,c-fill,q-auto/public/556b7519-4e7.jpeg?ik-sdk-version=python-2.2.4
                    imageUrl:
                        "https://ik.imagekit.io/bethere/tr:w-500,c-fill,q-auto/public/556b7519-4e7.jpeg?ik-sdk-version=python-2.2.4",
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images_main/blank-profile-picture.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width / 7.5,
                      height: MediaQuery.of(context).size.height / 9.8,
                    ),
                    width: MediaQuery.of(context).size.width / 5.2,
                    height: MediaQuery.of(context).size.height / 7,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  /* CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage(requestMessage.url),
                  ), */
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.requestMessage.messageText != null ? this.requestMessage.messageText : 'Blank',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Text(
                          this.requestMessage.messageText != null ? this.requestMessage.messageText : 'Blank',
                          style: TextStyle(fontSize: 14.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Text("7:00 AM"),
                ],
              ),
              /* Column(
            children: <Widget>[
              Text(requestMessage.),
              SizedBox(
                height: 5.0,
              ),
            ],
          ) */
            ],
          ),
        ),
      ),
    );
  }
}
