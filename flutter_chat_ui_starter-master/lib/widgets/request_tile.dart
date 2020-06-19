import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bethere_app/models/request.dart';
import 'package:bethere_app/core/todos_app_core.dart';
import 'package:bethere_app/models/models.dart';

class RequestTile extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Request request;

  RequestTile({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(request.id.toString()),
      onDismissed: onDismissed,
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
                      width: MediaQuery.of(context).size.width / 5.2,
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    width: MediaQuery.of(context).size.width / 5.2,
                    height: MediaQuery.of(context).size.height / 7,
                    fit: BoxFit.cover,
                  ),
                  /* CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage(request.url),
                  ), */
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        request.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Text(
                          request.title,
                          style: TextStyle(fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              /* Column(
            children: <Widget>[
              Text(request.),
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
