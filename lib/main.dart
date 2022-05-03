import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deliveryapp/CheckoutWidget.dart';
import 'package:deliveryapp/home/event.dart';
import 'package:deliveryapp/home/state.dart';
import 'package:deliveryapp/home/view.dart';
import 'package:deliveryapp/home/bloc.dart';

void main() => runApp(FoodoApp());

class FoodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodOApp',
      home: BlocProvider<HomeblocBloc>(
          builder: (context) => HomeblocBloc(),
          child: FoodMainWidgetStateless()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FoodMainWidgetStateless extends StatelessWidget {
  FoodMainWidgetStateless({required Key key}) : super(key: key);
  List<String> _foodName = ["Burger", "Salad", "Pasta", "Sandwich"];
  List<String> _foodImage = [
    "https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?w=2000",
    "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGVhbHRoeSUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80",
    "https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19744.jpg?size=626&ext=jpg&ga=GA1.2.1160264821.1651393756",
    "https://img.freepik.com/free-photo/club-sandwich-with-side-french-fries_140725-1744.jpg?size=626&ext=jpg&ga=GA1.2.1160264821.1651393756"
  ];
  List<int> _foodPrice = [60, 100, 120, 80];
  int total = 0;

  @override
  Widget build(BuildContext context) {
    HomeblocBloc homeblocBloc = BlocProvider.of<HomeblocBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("FoodOApp"),
        actions: <Widget>[
          Container(
            height: 30.0,
            width: 30.0,
            padding: EdgeInsets.fromLTRB(0, 15.0, 15.0, 0),
            child: BlocBuilder<HomeblocBloc, HomeblocState>(
                condition: (previousState, currentState) {
              if (previousState == currentState) {
                print(previousState);
                print(currentState);
                return false;
              }
              print(previousState);
              print(currentState);
              return true;
            }, builder: (context, state) {
              if (state is HomeBlocAdded) {
                print(state);
                ++total;
                print(total);
              } else if (state is HomeBlocRemoved) {
                --total;
                if (total < 0) {
                  total = 0;
                }
              }
              return Badge(
                bagdeColor: Colors.deepOrangeAccent,
                toAnimate: true,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    homeblocBloc.dispatch(HomeBlocLoadEvent());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutWidget(
                                  key: null,
                                )));
                  },
                ),
                badgeContent: Text(total.toString()),
              );
            }),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _foodName.length,
          itemBuilder: (BuildContext context, int count) {
            return Card(
              elevation: 26.0,
              color: Colors.white70,
              child: Column(
                children: <Widget>[
                  Image.network(_foodImage[count]),
                  Row(
                    children: <Widget>[
                      Spacer(flex: 2),
                      Text(
                        "Name: " + _foodName[count],
                        style: TextStyle(
                            color: Colors.deepOrangeAccent, fontSize: 20.0),
                      ),
                      Spacer(),
                      Text(
                        "Price: " + _foodPrice[count].toString() + "\$",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent, fontSize: 20.0),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  ButtonBar(
                    children: [
                      ElevatedButton(
                          child: Icon(
                            Icons.add,
                            size: 40.0,
                          ),
                          onPressed: () {
                            homeblocBloc.dispatch(HomeBlocAddEvent(FoodModel(
                                name: _foodName[count],
                                price: _foodPrice[count])));
                          }),
                      ElevatedButton(
                          child: Icon(
                            Icons.remove,
                            size: 40.0,
                          ),
                          onPressed: () {
                            homeblocBloc.dispatch(
                                HomeBlocRemoveEvent(_foodName[count]));
                          })
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
