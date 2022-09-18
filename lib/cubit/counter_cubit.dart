import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubcription;
  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    internetStreamSubcription = internetCubit.listen((internetState) {});
  }

  void increment() => emit(CounterState(counterValue: state.counterValue! + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue! - 1));

  @override
  Future<void> close() {
    internetStreamSubcription.cancel();
    return super.close();
  }
}
