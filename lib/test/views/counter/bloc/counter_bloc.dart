import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final int value;
  CounterBloc({this.value=0}) : super(CounterInitial(value)) {
    // 初始化逻辑
    print("Bloc 初始化");
    // 也可以 emit 一个新状态
    emit(CounterChangeValue(state.value + 5));
    // on<CounterEvent>((event,emit){
    //   // TODO: implement event handler
    //   emit(CounterChangeValue(state.value+88));
    // });

    on<CounterIncrementEvent>((event, emit) {
      emit(CounterChangeValue(state.value+2));
    });
    on<CounterSubductionEvent>((event,emit){
      emit(CounterChangeValue(state.value-2));
    });
  }

  StreamSubscription? subscription;

  @override
  Future<void> close() {
    // TODO: implement close
    subscription?.cancel();
    print("测试看看");
    return super.close();
  }
}
