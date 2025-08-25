import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter2_state.dart';

class Counter2Cubit extends Cubit<Counter2State> {
  Counter2Cubit() : super(Counter2Initial(0));

  void increment() => emit(Counter2ChangeValue(state.value+1));
  void subduction() => emit(Counter2ChangeValue(state.value-1));
}
