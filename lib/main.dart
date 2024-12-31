import 'package:counter_provider/counter_provider.dart';
import 'package:counter_provider/list_provider.dart';

import 'package:counter_provider/second_page.dart';
import 'package:counter_provider/therd_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context)=>ListProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TherdPage(),
      ),
    );
  }
}



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
             Text(
              'You have pushed the button in second page this many times:',style: Theme.of(context).textTheme.headlineMedium,
            ),
            Consumer<CounterProvider>(
              builder: (ctx,cvalue,_){
                return Text('${cvalue.getValue()}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
        },
        tooltip: 'move next page ',
        child: const Icon(Icons.navigate_next_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
