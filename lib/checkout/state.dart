import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CheckoutState extends Equatable {
  CheckoutState([List props = const []]);
}

class LoadingCheckoutState extends CheckoutState {
  @override
  String toString() {
    return 'LoadingCheckoutState';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ItemsLoadedState extends CheckoutState {
  Map<String, int> foodNamePrice = Map<String, int>();

  ItemsLoadedState({required this.foodNamePrice}) : super([foodNamePrice]);

  @override
  String toString() {
    // TODO: implement toString
    return 'ItemsLoadedState';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
