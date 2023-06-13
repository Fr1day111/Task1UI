import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskui/HomePage.dart';
import 'package:taskui/Texts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media UI',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
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

  final TextEditingController _mController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: SizedBox(
                    height: 400,
                    child: LottieBuilder.network('https://assets4.lottiefiles.com/packages/lf20_umqaz2yv.json')),
              ),
              NormalText(data: 'Welcome!', size: 20),
              const NormalText(data: 'Please login to continue the app', size: 15),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: NormalText(data: 'Email',size: 15,)
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                 // controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromARGB(255, 209, 207, 207)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child:NormalText(data: 'Password',size: 15,)
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromARGB(255, 209, 207, 207)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Center(
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
                        //signIN();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: NormalText(data: 'Login', size: 20)
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       decoration: const BoxDecoration(
    //         image: DecorationImage(
    //             image: AssetImage("Assets/Photos/bg.png"), fit: BoxFit.cover),
    //       ),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Center(
    //             child: Container(
    //               width: 370,
    //               height: 400,
    //               decoration: BoxDecoration(
    //                   boxShadow: [
    //                     BoxShadow(
    //                         color: Colors.grey.shade600,
    //                         spreadRadius: 1,
    //                         blurRadius: 15)
    //                   ],
    //                   color: Colors.grey[350],
    //                   borderRadius: BorderRadius.circular(30)),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   SizedBox(
    //                     height: 70,
    //                     width: 70,
    //                     child: Image.asset('Assets/Logo/logomain.png'),
    //                   ),
    //                   const Text(
    //                     'Let\'s get Started!!!',
    //                     style: TextStyle(
    //                         fontFamily: 'OpenSans',
    //                         fontSize: 24,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                   const SizedBox(
    //                     height: 20,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 24),
    //                     child: TextFormField(
    //                       controller: _mController,
    //                       decoration: InputDecoration(
    //                         filled: true,
    //                         fillColor: Colors.grey[200],
    //                         hintText: 'Email',
    //                         hintStyle: const TextStyle(fontFamily: 'OpenSans'),
    //                         border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.circular(20),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 24),
    //                     child: TextFormField(
    //                       controller: _passwordController,
    //                       obscureText: _isPassHidden,
    //                       decoration: InputDecoration(
    //                           filled: true,
    //                           fillColor: Colors.grey[200],
    //                           hintText: 'Password',
    //                           hintStyle:
    //                           const TextStyle(fontFamily: 'OpenSans'),
    //                           border: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(20),
    //                           ),
    //                           suffixIcon: IconButton(
    //                             icon: Icon(_isPassHidden
    //                                 ? Icons.visibility_outlined
    //                                 : Icons.visibility_off_outlined),
    //                             onPressed: () {
    //                               setState(() {
    //                                 _isPassHidden = !_isPassHidden;
    //                               });
    //                             },
    //                           )),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 24.0),
    //                     child: Align(
    //                       alignment: Alignment.centerRight,
    //                       child: GestureDetector(
    //                         onTap: (){
    //                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
    //                         },
    //                         child: RichText(text: const TextSpan(
    //                             text: "",
    //                             style: TextStyle(fontFamily: 'OpenSans',
    //                                 color: Colors.black,
    //                                 fontWeight: FontWeight.bold),
    //                             children: [
    //                               TextSpan(
    //                                 text: 'Forget Password?',
    //                                 style: TextStyle(
    //                                   //fontStyle: FontStyle.italic,
    //                                     fontFamily: 'OpenSans',
    //                                     fontWeight: FontWeight.bold,
    //                                     color: Colors.lightBlueAccent),
    //
    //                               )
    //                             ]
    //                         )),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                      // signIn();
    //                     },
    //                     child: Container(
    //                       height: 50,
    //                       width: 300,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(25),
    //                         color: Colors.lightBlueAccent,
    //                       ),
    //                       child: const Center(
    //                           child: Text(
    //                             'Sign In',
    //                             style: TextStyle(
    //                                 fontFamily: 'OpenSans',
    //                                 fontWeight: FontWeight.bold),
    //                           )),
    //                     ),
    //                   ),
    //                   const    SizedBox(height: 12,),
    //                   const    SizedBox(height: 12,),
    //
    //
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
