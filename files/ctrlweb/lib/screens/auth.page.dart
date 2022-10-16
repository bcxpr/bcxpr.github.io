// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ctrlweb/fadeanimation.dart';
import 'package:ctrlweb/services/auth.dart';
import 'package:ctrlweb/states/boiler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String errorMsg = '';
  String errorCode = '';
  @override
  Widget build(BuildContext context) {
    // final mainState = Provider.of<MainState>(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Consumer<MainState>(
      builder: ((context, mainState, child) => Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 0.7],
                // begin: FractionalOffset.topCenter,
                // end: FractionalOffset.bottomCenter,
                // tileMode: TileMode.clamp,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                // stops: [0.1, 1.0],
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  Colors.purple,
                  Colors.black,
                ],
              ),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: height / 8,
                    child: mainState.authError
                        ? Center(
                            child: Text(
                              '$errorCode : $errorMsg',
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        : const Text('')),
                Center(
                  child: FadeAnimation(
                    delay: 0.5,
                    child: SizedBox(
                      width: 350,
                      // height: 455,
                      child: Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // color: Color.fromARGB(255, 209, 208, 208),
                        elevation: 10,
                        // shadowColor: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 8,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        // "https://cdn.pixabay.com/photo/2013/06/29/19/52/mountains-142158_960_720.jpg",
                                        // "https://c4.wallpaperflare.com/wallpaper/560/771/577/pixel-cat-fantasy-art-digital-art-swamp-forest-hd-wallpaper-preview.jpg",
                                        "https://www.i-sight.com/wp-content/uploads/2021/05/How-to-Authenticate-Online-Evidence.png",
                                    // "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/ugjh1p6bhqu8yeskaqst",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
                                  //     Image.network(
                                  //   "https://cdn.pixabay.com/photo/2013/06/29/19/52/mountains-142158_960_720.jpg",
                                  //   fit: BoxFit.fill,
                                  // ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                              // (15.0),
                              child: Container(
                                // width: 160,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          mainState.switch2Login();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            height: 35,
                                            // width: 80,
                                            decoration: BoxDecoration(
                                              color: mainState.defaultAuthPage
                                                  ? Colors.black
                                                  : Colors.white,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Sign In',
                                              style: TextStyle(
                                                color: mainState.defaultAuthPage
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          mainState.switch2Register();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            height: 35,
                                            // width: 80,
                                            decoration: BoxDecoration(
                                              color: !mainState.defaultAuthPage
                                                  ? Colors.black
                                                  : Colors.white,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Sign Up',
                                              style: TextStyle(
                                                color:
                                                    !mainState.defaultAuthPage
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: TextField(
                                controller: mainState.emailField,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: TextFormFieldDeco('Email'),
                                onChanged: (text) {
                                  mainState.emailText(text);
                                  print(mainState.email);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: TextField(
                                controller: mainState.passwordField,
                                obscureText: true,
                                enableSuggestions: true,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: TextFormFieldDeco('Password'),
                                onChanged: (text) {
                                  mainState.passwordText(text);
                                  print(mainState.password);
                                },
                              ),
                            ),
                            !mainState.defaultAuthPage
                                ? const SizedBox(
                                    height: 15,
                                  )
                                : Container(),

                            !mainState.defaultAuthPage
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                    ),
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      onChanged: (text) {
                                        mainState.authorizeAuthFields(text);
                                      },
                                      obscureText: true,
                                      decoration:
                                          TextFormFieldDeco('Repeat Password'),
                                    ),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  mainState.defaultAuthPage
                                      ? Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: MaterialButton(
                                              color: Colors.blue,
                                              onPressed: () async {
                                                // FirebaseAuth.instance
                                                //     .signInAnonymously();
                                                var result =
                                                    await AuthService().signIn(
                                                  mainState.email,
                                                  mainState.password,
                                                );
                                                // print(result.code);

                                                if (result
                                                    is FirebaseAuthException) {
                                                  mainState.errorHandler(true);
                                                  setState(() {
                                                    errorCode = result.code;
                                                    errorMsg = result.message!;
                                                  });
                                                } else {
                                                  mainState.errorHandler(false);
                                                  mainState.erase();
                                                  print(result);
                                                }
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Text(
                                                'Sign In',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: MaterialButton(
                                              color: Colors.blue,
                                              onPressed: mainState.authRpt
                                                  ? () async {
                                                      // FirebaseAuth.instance
                                                      //     .signInAnonymously();
                                                      var result =
                                                          await AuthService()
                                                              .signUp(
                                                        mainState.email,
                                                        mainState.password,
                                                      );
                                                      // print(result.code);

                                                      if (result
                                                          is FirebaseAuthException) {
                                                        mainState
                                                            .errorHandler(true);
                                                        setState(() {
                                                          errorCode =
                                                              result.code;
                                                          errorMsg =
                                                              result.message!;
                                                        });
                                                      } else {
                                                        mainState.errorHandler(
                                                            false);
                                                        mainState.erase();
                                                        mainState
                                                            .switch2Login();
                                                        print(result);
                                                      }
                                                    }
                                                  : null,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Text(
                                                mainState.authRpt
                                                    ? 'Sign Up'
                                                    : mainState.misMatch
                                                        ? 'Password Mismatch'
                                                        : '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                  mainState.defaultAuthPage
                                      ? const SizedBox(
                                          width: 15,
                                        )
                                      : Container(),
                                  mainState.defaultAuthPage
                                      ? Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: MaterialButton(
                                              color: Colors.blue,
                                              onPressed: () {},
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: const Text(
                                                'Forgot Password ?',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // Row(
                            //   children: [
                            //     const SizedBox(
                            //       width: 15,
                            //     ),
                            //     // Expanded(
                            //     //   child: SizedBox(
                            //     //     height: 40,
                            //     //     child: MaterialButton(
                            //     //       color: Colors.blue,
                            //     //       onPressed: () {},
                            //     //       shape: RoundedRectangleBorder(
                            //     //         borderRadius: BorderRadius.circular(30),
                            //     //       ),
                            //     //       child: const Text(
                            //     //         'Forgot Password ?',
                            //     //         style: TextStyle(
                            //     //           color: Colors.white,
                            //     //         ),
                            //     //       ),
                            //     //     ),
                            //     //   ),
                            //     // ),
                            //     const SizedBox(
                            //       width: 15,
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    ));
  }

  InputDecoration TextFormFieldDeco(labelText) {
    return InputDecoration(
      hintStyle: const TextStyle(
        color: Colors.white,
      ),
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      helperStyle: const TextStyle(
        color: Colors.white,
      ),
      errorStyle: const TextStyle(
        color: Colors.white,
      ),
      // contentPadding: const EdgeInsets.all(8.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: Colors.green,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      labelText: labelText,
    );
  }
}
