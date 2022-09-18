import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(couterValue: 0));

  void increment() => emit(CounterState(couterValue: state.couterValue + 1));
  void decrement() => emit(CounterState(couterValue: state.couterValue - 1));
}
