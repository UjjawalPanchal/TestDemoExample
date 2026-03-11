import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/route/routes.dart';
import 'package:test_project/screens/counter/controller/count_controller.dart';
import 'package:test_project/screens/list_demo_screen/list_demo_screen.dart';
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
    // return MaterialApp.router(routerConfig: MyRouter.router);

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;
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

      debugPrint("count_controller = ${controller.count}");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                // navigateByName(MyRoutes.listHome);
                navigateToAnyScreen(ListDemoScreen());
                // navigateToAnyScreen(SliverDemoScreen());
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

void navigateByName(String path) {
  print("My Route To navigate -- $path");
  MyRouter.router.go(path);
}

Future<dynamic> navigateToAnyScreen(Widget navigate) {
  return Navigator.push(key.currentContext!, MaterialPageRoute(builder: (context) => navigate));
  // return Future.value(Get.to(navigate));
}
