import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CheckoutEvent extends Equatable {
  CheckoutEvent([List props = const []]);
}

class LoadItemsEvent extends CheckoutEvent {
  LoadItemsEvent([List props = const []]) : super(props);

  @override
  String toString() {
    // TODO: implement toString
    return 'LoadCheckoutItems';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
