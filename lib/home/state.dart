import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:deliveryapp/FoodModel.dart';

@immutable
class HomeblocState extends Equatable {
  const HomeblocState([List props = const []]);

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

abstract class HomeBlocStateLoading extends HomeblocState {
  @override
  String toString() => 'HomeBlocStateLoading';
}

abstract class HomeBlocAdded extends HomeblocState {
  @override
  String toString() => 'HomeBlocStateAdded';
}

abstract class HomeBlocRemoved extends HomeblocState {
  @override
  String toString() => 'HomeBlocStateRemoved';
}
