import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.widget);
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;

  //Methods
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 0) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(context.widget);
    var theme = Theme.of(context);
    // Add style
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: theme.colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "Total per Person",
                      style: style,
                    ),
                    Text(
                      "\$23.89",
                      style: style.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontSize: theme.textTheme.displaySmall?.fontSize),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                        labelText: 'Bill Amount'),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print("Value: $value ");
                    },
                  ),
                  //Split Bill area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Split',
                        style: theme.textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          IconButton(
                              color: theme.colorScheme.primary,
                              onPressed: decrement,
                              icon: const Icon(Icons.remove)),
                          Text(
                            "$_personCount",
                            style: theme.textTheme.titleMedium,
                          ),
                          IconButton(
                              color: theme.colorScheme.primary,
                              onPressed: increment,
                              icon: const Icon(Icons.add)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//class MyHomePage extends StatefulWidget {
 // const MyHomePage({super.key, required this.title});

 // final String title;

 // @override
 // State<MyHomePage> createState() => _MyHomePageState();
//}

//class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  //void _incrementCounter() {
    //setState(() {
      //_counter++;
    //});
  //}

  //@override
  //Widget build(BuildContext context) {

    //return Scaffold(
      //appBar: AppBar(
      
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        //title: Text(widget.title),
      //),
      //body: Center(
      
        //child: Column(
        
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
            //const Text(
              //'You have pushed the button this many times:',
            //),
            //Text(
              //'$_counter',
              //style: Theme.of(context).textTheme.headlineMedium,
            //),
          //],
        //),
      //),
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
      //),
    //);
  //}
//}
