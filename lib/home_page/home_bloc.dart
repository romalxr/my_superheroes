import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final BehaviorSubject<PageState> _state = BehaviorSubject();

  Stream<PageState> observe() => _state;

  HomeBloc() {
    _state.add(PageState.init);
  }

  dispose() {
    _state.close();
  }

  onPressedTest1() {
    _state.add(PageState.test1);
    print('test1 pressed');
  }
}

enum PageState {
  init,
  test1,
}
