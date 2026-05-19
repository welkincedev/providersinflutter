import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier{
  // private state
  int _count = 0;

  int get count => _count;  //public getter

  void increment(){
    _count++;
    notifyListeners();  // trigers Rebuild
    notifyListeners();  // trigers Rebuild
  }

  void decrement(){
    if (_count> 0){
      _count--;
    }

   // _count--;  > Negative Count
    
    notifyListeners(); // trigers Rebuild
  }

  void reset(){
    _count = 0;
    notifyListeners();
  }
}