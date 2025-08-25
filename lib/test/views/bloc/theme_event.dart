part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ThemeDark extends ThemeEvent{

}
class ThemeLight extends ThemeEvent{

}