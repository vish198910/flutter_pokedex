import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class BlocState<T> {
  BlocState({T defaultValue})
      : this._(
          BehaviorSubject<T>.seeded(defaultValue),
          defaultValue,
        );

  BlocState._(this._controller, this._value);

  final StreamController<T> _controller;
  T _value;

  Stream<T> get stream => _controller.stream;

  StreamSink<T> get sink => _controller.sink;

  T get value => _value;

  void add(T newValue) {
    sink.add(newValue);
    _value = newValue;
  }

  void dispose() {
    _controller.close();
  }
}
