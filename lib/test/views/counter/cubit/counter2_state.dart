part of 'counter2_cubit.dart';

@immutable
sealed class Counter2State extends Equatable{
  final int value;
  const Counter2State(this.value);

  @override
  // TODO: implement props
  List<Object?> get props => [value];
}

final class Counter2Initial extends Counter2State {
  const Counter2Initial(super.value);
}

final class Counter2ChangeValue extends Counter2State {
  const Counter2ChangeValue(super.value);
}
