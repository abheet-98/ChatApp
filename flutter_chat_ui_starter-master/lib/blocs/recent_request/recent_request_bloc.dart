import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todos/blocs/recent_request/recent_request.dart';

class RecentFilteredRequestBloc extends Bloc<RecentFilteredRequestEvent, RecentFilteredRequestState> {

  RecentFilteredRequestBloc();

  @override
  RecentFilteredRequestState get initialState => RecentRequestLoadInProgress();

  @override
  Stream<RecentFilteredRequestState> mapEventToState(RecentFilteredRequestEvent event) async* {
    if (event is RecentRequestLoadedEvent) {
      yield* _mapTodosLoadedToState(event);
    }
    if (event is MessageShowEvent) {
      yield* _mapMessageShowToState(event);
    }

  }

  Stream<RecentFilteredRequestState> _mapTodosLoadedToState(event) async* {
    try {
        final user = event.user;
        final respose = user; //api call
        yield RecentRequestLoadSuccess(respose);
    } catch (_) {
      yield RecentRequestLoadFailure();
    }
  }

  Stream<RecentFilteredRequestState> _mapMessageShowToState(event) async* {
    try {
        final user = event.user;
        final respose = user; //api call
        yield MessageShow(respose);
    } catch (_) {
      yield RecentRequestLoadFailure();
    }
  }


}
