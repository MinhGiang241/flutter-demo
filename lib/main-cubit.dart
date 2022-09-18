import 'dart:async';

import 'package:bloc/bloc.dart';

// cubit

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

//bloc
abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
  }
  void _onIncrement(Increment event, Emitter<int> emit) {
    emit(state + 1);
  }

  void _onDecrement(Decrement event, Emitter<int> emit) {
    emit(state - 1);
  }
}

Future<void> main(List<String> args) async {
  //cubit
  final cubit = CounterCubit();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.decrement();
  print(cubit.state);

  //bloc
  final bloc = CounterBloc();

  bloc.add(Increment());
  await Future.delayed(Duration.zero);
  print(bloc.state);

  await bloc.close();
}
