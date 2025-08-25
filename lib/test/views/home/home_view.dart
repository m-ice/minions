part of '../index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc test"),

      actions: [
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (cx, state) {
            return IconButton(
              onPressed: (){
                if(state.themeData==ThemeData.light()){
                  BlocProvider.of<ThemeBloc>(cx).add(ThemeDark());
                }else{
                  BlocProvider.of<ThemeBloc>(cx).add(ThemeLight());
                }
              },
              icon:
              Icon(
                  state.themeData==ThemeData.light()?Icons.wb_sunny:Icons.nights_stay),
            );
          },
        ),
      ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: context.read<Counter>().increment,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),),
      body: Column(
        children: [
          ListTile(
            onTap: (){
              AppRouterHelper.toName(AppRouterConfig.counter,extra: 99);
            },
            title: Text("加减法"),
          ),
          ListTile(
            onTap: (){
              AppRouterHelper.toName(AppRouterConfig.test,extra: 99);
            },
            title: Text("Test"),
          ),

          // Count(),
        ],
      ),
    );
  }
}


class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
      '${context.watch<Counter>().count}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}