import 'package:deliveryapp/home/bloc.dart';
import 'package:deliveryapp/storeData.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  StoreData _storeData = StoreData();

  HomeblocBloc(HomeblocState initialState) : super(initialState);

  @override
  HomeblocState get initialState => HomeBlocStateLoading();

  @override
  Stream<HomeblocState> mapEventToState(
    HomeblocEvent event,
  ) async* {
    if (event is HomeBlocAddEvent) {
      yield* _mapAddEventToAddState(event);
    } else if (event is HomeBlocRemoveEvent) {
      yield* _mapRemoveEventToRemoveState(event);
    } else {
      yield HomeBlocStateLoading();
    }
  }

  Stream<HomeblocState> _mapRemoveEventToRemoveState(event) async* {
    yield HomeBlocStateLoading();

    //Logic to remove the food
    _storeData.removeFoodDetails(event.food);
    yield HomeBlocRemoved();
  }

  Stream<HomeblocState> _mapAddEventToAddState(event) async* {
    yield HomeBlocStateLoading();
    print("Add Event");
    //Logic to save the food
    _storeData.storeFoodDetails(event.food.name, event.food.price);
    yield HomeBlocAdded();
  }

  void dispatch(HomeBlocLoadEvent homeBlocLoadEvent) {}
}
