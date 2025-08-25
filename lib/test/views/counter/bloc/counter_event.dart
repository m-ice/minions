part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// 加法操作事件
class CounterIncrementEvent extends CounterEvent{

}

/// 减法操作事件
class CounterSubductionEvent extends CounterEvent{

}