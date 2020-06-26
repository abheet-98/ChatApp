import 'package:equatable/equatable.dart';
import 'package:bethere_app/models/request.dart';
//import 'package:bethere_app/models/models.dart';

abstract class RequestMessageDetailsEvent extends Equatable {
  const RequestMessageDetailsEvent();

  @override
  List<Object> get props => [];
}

class RequestMessageDetailsLoaded extends RequestMessageDetailsEvent {
  final RequestMessage requestMessage;

  const RequestMessageDetailsLoaded(this.requestMessage);

  @override
  List<Object> get props => [requestMessage];

  @override
  String toString() => 'RequestMessageDetailsLoaded { requestMessage: $requestMessage }';
}

// class RequestMessageDetailsOpen extends RequestMessageDetailsEvent {
//   final RequestMessage requestMessage;

//   const RequestMessageDetailsOpen(this.requestMessage);

//   @override
//   List<Object> get props => [requestMessage];

//   @override
//   String toString() => 'RequestMessageDetailsOpen { request: $requestMessage }';
// }

// class RequestMessageAccept extends RequestMessageDetailsEvent {
//   final RequestMessage requestMessage;

//   const RequestMessageAccept(this.requestMessage);

//   @override
//   List<Object> get props => [requestMessage];

//   @override
//   String toString() => 'RequestMessageAccept { request: $requestMessage }';
// }


// class RequestMessageReject extends RequestMessageDetailsEvent {
//   final RequestMessage requestMessage;

//   const RequestMessageReject(this.requestMessage);

//   @override
//   List<Object> get props => [requestMessage];

//   @override
//   String toString() => 'RequestMessageReject { request: $requestMessage }';
// }
/* class TodoAdded extends RequestMessageDetailsEvent {
  final User todo;

  const TodoAdded(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoAdded { todo: $todo }';
}

class TodoUpdated extends RequestMessageDetailsEvent {
  final User todo;

  const TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoUpdated { updatedTodo: $todo }';
}

class TodoDeleted extends RequestMessageDetailsEvent {
  final User todo;

  const TodoDeleted(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoDeleted { todo: $todo }';
} 

class ClearCompleted extends RequestMessageDetailsEvent {}

class ToggleAll extends RequestMessageDetailsEvent {}
*/