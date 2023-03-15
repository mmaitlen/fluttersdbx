import 'package:flutter/material.dart';

enum NotifierState { initial, loading, loaded }

// Based on Stacked architecture
class BaseViewModel extends ChangeNotifier {
  NotifierState _notifierState = NotifierState.initial;

  void setLoading() {
    _notifierState = NotifierState.loading;
    // notifyListeners();
  }

  void setLoaded() {
    _notifierState = NotifierState.loaded;
    //notifyListeners();
  }

  bool get isLoading => _notifierState == NotifierState.loading;
  bool get hasLoaded => _notifierState == NotifierState.loaded;

  void setNotifierState(NotifierState viewState) {
    _notifierState = viewState;
    notifyListeners();
  }
}
