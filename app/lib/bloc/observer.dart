import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:memkept/bloc/theme_mode_cubit.dart';
import 'package:memkept/bloc/todo_bloc.dart';

final log = Logger("StateObserver");

class Observer extends BlocObserver {
  const Observer();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    switch (bloc.runtimeType) {
      case ThemeModeCubit:
        log.fine('${bloc.runtimeType} ${change.nextState}');
        break;
      case TodoBloc:
        log.fine(
            '${bloc.runtimeType} ${(change.nextState as TodoState).status}');
        break;
      default:
        log.fine('${bloc.runtimeType} updated.');
    }
  }
}
