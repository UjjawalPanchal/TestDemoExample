/*
* Created by ujjawal on 29/01/26.
*/
import 'dart:async';

import 'package:flutter/material.dart'; // import 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
import 'package:shared_preferences/shared_preferences.dart'; // import 'package:flutter_thermal_printer/utils/printer';
import 'package:test_project/custom_widgets/text_widget.dart';
import 'package:test_project/payment_method.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool show = false;

  List<double> pList = [1, 2, 3, 4, 5];
  late List<UserData?> userDataList;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode userNameFc = FocusNode();

  AppState currentState = AppState.initial;

  // List<Printer> printers = [];
  // StreamSubscription<List<Printer>>? _devicesStreamSubscription;
  // final _flutterThermalPrinterPlugin = FlutterThermalPrinter.instance;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  late SharedPreferences _preferences;

  /*
  * It is a default method when the class state is initialized
  * */
  @override
  void initState() {
    print("I am initState");
    super.initState();
    initSharedPreference();

    userDataList = [UserData("Munna", 30)];
    userDataList.add(UserData("Ujjawal", 30));
    userDataList.add(UserData("Arshad", 20));
    userDataList.remove(UserData("Ujjawal", 30));
    userDataList.insert(1, null);
    userDataList.removeAt(1);
    userDataList.clear();
    userDataList.addAll([]);
    userDataList.addAll([]);

    UserData? userDataFirst = userDataList.elementAtOrNull(3);

    if (userDataFirst == null || userDataFirst.age == 0) {
      print("No Data Found");
    } else {}

    for (var element in userDataList) {
      print("$element");
    }
    for (int i = 0; i < userDataList.length; i++) {}

    userNameFc.addListener(() => print("I am focus"));

    List<int> numbers = [1, 3, 5, 7, 9];
    // Using an anonymous function with map, in arrow syntax
    var doubledNumbers = numbers.map((number) => number + 1);
    print(doubledNumbers.toList()); // Prints: [2, 4, 6, 8, 10]

    var greet = (String name) {
      return 'Hello, $name!';
    };
    print(greet('Test')); // Prints: Hello, Test!

    void performOperation(void Function() callback) {
      // Some operation
      callback();
    }

    performOperation(() => print('Operation performed'));
  }

  @override
  Widget build(BuildContext context) {
    print("I am build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Form", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Form(
        key: keyForm,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              TextField(
                focusNode: userNameFc,
                textInputAction: TextInputAction.next,
                controller: username,
                enableInteractiveSelection: true,
                contextMenuBuilder: null,
                // contextMenuBuilder: (BuildContext context, EditableTextState editableTextState) {
                //   final List<ContextMenuButtonItem> buttonItems = editableTextState.contextMenuButtonItems;
                //   buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
                //     return buttonItem.type == ContextMenuButtonType.copy ||
                //         buttonItem.type == ContextMenuButtonType.cut ||
                //         buttonItem.type == ContextMenuButtonType.lookUp ||
                //         buttonItem.type == ContextMenuButtonType.paste;
                //   });
                //   return AdaptiveTextSelectionToolbar.buttonItems(anchors: editableTextState.contextMenuAnchors, buttonItems: buttonItems);
                // },
                onChanged: (value) {
                  print(value);
                },
                decoration: InputDecoration(prefixIcon: Icon(Icons.person), border: OutlineInputBorder(), labelText: 'Username'),
              ),
              TextField(
                obscureText: show,
                controller: password,
                obscuringCharacter: '*',
                textInputAction: TextInputAction.go,
                maxLength: 6,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),

                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: ContainerButton(
              //     width: 200,
              //     height: 46,
              //     color: Colors.orange,
              //     radius: 30,
              //     child: currentState == AppState.loading
              //         ? CircularProgressIndicator()
              //         : TextWidget("Submit", textSize: 16, tColor: Colors.white),
              //     onCallback: () {
              //       // BankAccount bAccount = BankAccount();
              //       // print("Balance = ${bAccount.balance}");
              //       // bAccount.processTransaction(PaymentOption(), PaymentType.online(100));
              //
              //       setState(() {
              //         if (currentState == AppState.initial) {
              //           currentState = AppState.loading;
              //         } else {
              //           currentState = AppState.initial;
              //         }
              //
              //         print("Balance = ${currentState.name}");
              //       });
              //
              //       // buttonClick(() {
              //       //   ScaffoldMessenger.of(
              //       //     context,
              //       //   ).showSnackBar(SnackBar(content: Text("Login Successful \nUserName: ${username.text}\nPassword: ${password.text}")));
              //       // });
              //     },
              //   ),
              // ),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      if (keyForm.currentState!.validate()) {
                        addDataToPreference();
                        // buttonClick(() {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("Login Successful \nUserName: ${username.text}\nPassword: ${password.text}")),
                        //   );
                        // });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextWidget("Form is Not validate")));
                      }

                      buttonClick(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Successful \nUserName: ${username.text}\nPassword: ${password.text}")),
                        );
                      });

                      // initScanning();
                    },
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)),
                    child: TextWidget("Submit", textSize: 16, tColor: Colors.white),
                    // Text(
                    //   "Submit",
                    //   style: TextStyle(fontSize: 14, color: Colors.white),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buttonClick(Function() callBack) async {
    Stream<Future<int>> value = getDataFromFuture(10, 20);
    print("$value");
    await Future.delayed(Duration(seconds: 2));
    callBack.call();
    // if (context.mounted) {
    //   Navigator.pop(context);
    // }
  }

  void initScanning() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // _flutterThermalPrinterPlugin.bleConfig = const BleConfig(connectionStabilizationDelay: Duration(seconds: 3));
      startScan();
    });
  }

  // Get Printer List
  void startScan() async {
    // _devicesStreamSubscription?.cancel();
    // await _flutterThermalPrinterPlugin.getPrinters(connectionTypes: [ConnectionType.USB, ConnectionType.BLE]);
    // _devicesStreamSubscription = _flutterThermalPrinterPlugin.devicesStream.listen((List<Printer> event) {
    //   setState(() {
    //     printers = event;
    //     printers.removeWhere(
    //       (element) => element.name == null || element.name == '' || element.name!.toLowerCase().contains("print") == false,
    //     );
    //   });
    // });
    // Future.delayed(Duration(seconds: 10), () => _devicesStreamSubscription?.cancel());
  }

  Stream<Future<int>> getDataFromFuture(int i, int b) async* {
    await Future.delayed(Duration(seconds: 1));
    int result = i + b;
    yield Future.value(result);
  }

  @override
  void didUpdateWidget(covariant LoginForm oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // _devicesStreamSubscription?.cancel();
    super.dispose();
  }

  void addDataToPreference() {
    if (username.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextWidget("Username and Password is required")));
      return;
    }

    UserData userData = UserData(username.text, int.parse(password.text));
    _preferences.setString("userInfo", userData.toString());
    // _preferences.remove("userInfo");

    _preferences.setString("username", username.text);
    _preferences.setString("password", password.text);
  }

  void initSharedPreference() async {
    _preferences = await SharedPreferences.getInstance();
    username.text = _preferences.getString("username") ?? '';
    password.text = _preferences.getString("password") ?? '';
  }
}

class UserData {
  String? name;
  int? age;

  UserData(this.name, this.age);

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    return data;
  }
}
