import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {

  CounterBase(this.value);
  
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}