import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:statemanagement/providerdemo/provider_10_getx/modal/counterModal.dart';

class CounterController10 extends GetxController{
    CounterModel10 counter = CounterModel10();

    var count = 0.obs;
    void increment(){
      count++;
    }
    void decrement(){
      count--;
}
}