import 'package:counter_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        // backgroundColor:  Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Consumer<CounterProvider>(
            builder: (context,value,child){
              print("Consumer called..");
              return Text(value.getValue().toString());
            },
           ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed: (){
           // Provider.of<CounterProvider>(context,listen: false).deCrement();
            context.read<CounterProvider>().deCrement();
          },child: Icon(Icons.remove),),
          FloatingActionButton(onPressed: (){
            // Provider.of<CounterProvider>(context,listen: false).inCrement();
            context.read<CounterProvider>().inCrement();

          },child: Icon(Icons.add),),
        ],
      ),
    );
  }
}
