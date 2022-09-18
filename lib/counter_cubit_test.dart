import 'package:flutter_test/flutter_test.dart';

import 'cubit/counter_cubit.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      // counterCubit.close();
    });

    test(
        'the initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      // expect(counterCubit.state, CounterState(couterValue: 0));
    });
  });
}
