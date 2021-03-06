import 'package:flutter_chat_ui_starter/models/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser =
    User(id: 0, name: 'Current User', imageUrl: 'assets/images/greg.jpg');

// USERS
final User greg = User(id: 1, name: 'Greg', imageUrl: 'assets/images/greg.jpg');
final User james =
    User(id: 2, name: 'James', imageUrl: 'assets/images/james.jpg');
final User john = User(id: 3, name: 'John', imageUrl: 'assets/images/john.jpg');
final User olivia =
    User(id: 4, name: 'Olivia', imageUrl: 'assets/images/olivia.jpg');
final User sam = User(id: 5, name: 'Sam', imageUrl: 'assets/images/sam.jpg');
final User sophia =
    User(id: 6, name: 'Sophia', imageUrl: 'assets/images/sophia.jpg');
final User steven =
    User(id: 7, name: 'Steven', imageUrl: 'assets/images/steven.jpg');

final User phoebe =
    User(id: 8, name: 'Phoebe', imageUrl: 'assets/images/olivia.jpg');
final User harry =
    User(id: 9, name: 'Harry', imageUrl: 'assets/images/james.jpg');

// FAVORITE CONTACTS
//List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Where are you?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'I\'m going home',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Bye !!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 AM',
    text: 'Good night',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'See you soon !',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'What are you doing?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: phoebe,
    time: '6:30 PM',
    text: 'Come on time',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: harry,
    time: '7:30 PM',
    text: 'Where are you?',
    isLiked: false,
    unread: true,
  ),
];

