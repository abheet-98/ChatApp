import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_chat_ui_starter/blocs/recent_request/recent_request.dart';

class RecentRequestBloc extends Bloc<RecentRequestEvent, RecentRequestState> {

  RecentRequestBloc();

  @override
  RecentRequestState get initialState => RecentRequestLoadInProgress();

  @override
  Stream<RecentRequestState> mapEventToState(RecentRequestEvent event) async* {
    if (event is RecentRequestLoadedEvent) {
      yield* _mapTodosLoadedToState(event);
    }
    if (event is MessageShowEvent) {
      yield* _mapMessageShowToState(event);
    }

  }

  Stream<RecentRequestState> _mapTodosLoadedToState(event) async* {
    try {
        final user = event.user;
        final respose = user; //api call
        yield RecentRequestLoadSuccess(respose);
    } catch (_) {
      yield RecentRequestLoadFailure();
    }
  }

  Stream<RecentRequestState> _mapMessageShowToState(event) async* {
    try {
        final user = event.user;
        final respose = user; //api call
        yield MessageShow(respose);
    } catch (_) {
      yield RecentRequestLoadFailure();
    }
  }


}
