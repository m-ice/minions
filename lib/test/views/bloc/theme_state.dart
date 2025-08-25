part of 'theme_bloc.dart';

@immutable
sealed class ThemeState extends Equatable{
  final ThemeData themeData;
  const ThemeState(this.themeData);
  @override
  // TODO: implement props
  List<Object?> get props => [themeData];
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial(super.themeData);
}


/// 状态变化
class ThemeChangeValue extends ThemeState{
  const ThemeChangeValue(super.value);
}