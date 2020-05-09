import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/bloc.dart';
import '../../../core/bloc_state.dart';

@injectable
class HomeBloc extends Bloc {
  final _AppBarState appBar = _AppBarState();

  // TODO: Add pokemon news state

  @override
  void dispose() {
    appBar.dispose();
  }
}

class AppBarStateType {
  const AppBarStateType({this.height, this.showTitle});

  final double height;
  final bool showTitle;
}

class _AppBarState {
  final _HeightState _height = _HeightState();
  final _TitleVisibilityState _titleVisibility = _TitleVisibilityState();

  Stream<AppBarStateType> get stream => ZipStream(
        [_height.stream, _titleVisibility.stream],
        (streamValues) => AppBarStateType(
          height: streamValues[0],
          showTitle: streamValues[1],
        ),
      );

  void setCardHeight(double height) => _height.add(height);

  void setShowTitle(bool showTitle) => _titleVisibility.add(showTitle);

  void handleScrollEvent(double scrollOffset) {
    final showTitle = scrollOffset > _height.value - kToolbarHeight;

    if (_titleVisibility.value != showTitle) {
      setShowTitle(showTitle);
    }
  }

  void dispose() {
    _height.dispose();
    _titleVisibility.dispose();
  }
}

class _HeightState extends BlocState<double> {
  _HeightState() : super(defaultValue: 0);
}

class _TitleVisibilityState extends BlocState<bool> {
  _TitleVisibilityState() : super(defaultValue: false);

  bool get visible => value;
}
