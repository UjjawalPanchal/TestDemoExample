import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/counter/controller/count_controller.dart';
import 'package:test_project/screens/list_demo_screen.dart';
import 'package:test_project/screens/list_screen.dart';

void main() {
  // BankAccount bAccount = BankAccount();
  // print("Balance = ${bAccount.balance}");
  // bAccount.deposit(100);
  // print("Balance = ${bAccount.balance}");
  // bAccount.processTransaction(PaymentOption(), 100);
  // bAccount.processTransaction(DebitCard(), 100);
  //
  // PaymentOption paymentOption = PaymentOption();
  // paymentOption.addPayment(100);

  runApp(const MyApp());
}

GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: key,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.orange),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var pass = "test";
  String userName = "Ujjawal";
  List<int> arrayInt = [1, 3, 5, 6, 7, 8];
  GlobalKey<ListScreenState> loginKey = GlobalKey<ListScreenState>();

  @override
  void initState() {
    super.initState();
  }

  void _decrementCounter() {
    if (Get.isRegistered<CountController>()) {
      CountController controller = Get.find();

      print("count_controller = ${controller.count}");
    }
    // setState(() {
    //   if (_counter > 0) {
    //     _counter--;
    //   }
    // });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // for (int i = 0; i < arrayInt.length; i++) {
    //   print(arrayInt[i]);
    // }

    // arrayInt.forEach((element) => print(element));
    // for (int i in arrayInt) {
    //   print(i);
    // }
    //
    // switch (userName) {
    //   case "12":
    //     print("12");
    //     break;
    //   case "Ujjawal":
    //     print("Ujjawal");
    //     break;
    //   default:
    //     return;
    // }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text("Test Application Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            FloatingActionButton(
              heroTag: "decrement",
              onPressed: () {
                // userName = "12";
                // pass = "12";
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const ListScreen()));
                _decrementCounter();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.exposure_minus_1),
            ),
            FloatingActionButton(
              heroTag: "increment",
              onPressed: () {
                // userName = "12";
                // pass = "12";
                // navigateToAnyScreen(CounterDemo());
                navigateToAnyScreen(ListDemoScreen()).then((value) {
                  if (value != null) {
                    print("v--------------$value");
                  }
                });

                // Navigator.push(key.currentContext!, MaterialPageRoute(builder: (context) => LoginForm(0, "0"))).then((value) {
                //   loginKey.currentState!.arrayList[0];
                // });
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen(key: loginKey))).then((value) {
                //   loginKey.currentState!.arrayList[0];
                // });

                // _incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
}

Future<dynamic> navigateToAnyScreen(Widget navigate) {
  // Navigator.push(key.currentContext!, MaterialPageRoute(builder: (context) => navigate));
  return Future.value(Get.to(navigate));
}
