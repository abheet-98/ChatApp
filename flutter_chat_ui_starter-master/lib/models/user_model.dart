import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  User({
    this.id,
    this.name,
    this.imageUrl,
  });

  @override
  // TODO: implement props
  List<Object> get props => [];

}
