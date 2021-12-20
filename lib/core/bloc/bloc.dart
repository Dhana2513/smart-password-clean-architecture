import 'dart:async';
import 'package:rxdart/rxdart.dart';


class Bloc<T> {
  BehaviorSubject<T> _subject = BehaviorSubject<T>();

  Bloc();

  bool isClosed = false;
  StreamSink<T> get sink => _subject.sink;
  ValueStream<T> get stream => _subject.stream;

  _reInitializeStreamIfNeeded() {
    if (isClosed) {
      _subject = BehaviorSubject<T>();
    }
  }

  addToSink(T event) {
    _reInitializeStreamIfNeeded();
    sink.add(event);
  }

  close() {
    _subject.close();
    isClosed = true;
    sink.close();
  }
}