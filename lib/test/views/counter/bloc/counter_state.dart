part of 'counter_bloc.dart';

@immutable
sealed class CounterState extends Equatable{
  final int value;
  const CounterState(this.value);



  @override
  // TODO: implement props
  List<Object?> get props => [value];
}


/// 状态初始
final class CounterInitial extends CounterState {
  const CounterInitial(super.value);
}

/// 状态变化
class CounterChangeValue extends CounterState{
  const CounterChangeValue(super.value);
}