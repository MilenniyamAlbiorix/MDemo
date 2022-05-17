import 'package:demo/services/new_service_api_.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'Model/Resultrespnse.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();
  List results = [];

// TODO: Add methods
  Future<NewResponse> getUser() async {
    // Perform GET request to the endpoint "/users/<id>"
    Response response = await _dio.get(
        ('https://opentdb.com/api.php?amount=5&difficulty=medium&type=multiple&category=11'));

    // Prints the raw data returned by the server
    print('User Info: ${response.data}');

    // Parsing the raw JSON data to the User class
    NewResponse user = NewResponse.fromJson(response.data);

    setState(() {
      results = user.results as List;
    });
    return user;
  }

  @override
  initstate() {
    super.initState();
    getUser();
  }

  int _groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("CALL API AND SET DATA")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder<List<Result>?>(
                future: ResultsAPiservices().fetchResults(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          strokeWidth: 8),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Expanded(child: Container(child: Text(snapshot.data![index].,),)
                                ],
                              ),
                            )
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "QUS -:${snapshot.data![index].question}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      child: Text(
                                        "Ans:${snapshot.data![index].correctAnswer}",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//   Widget myRadioButton({String? title, int? value, Function(bool)? onChanged}) {
//     return RadioListTile(
//       value: value,
//       groupValue: _groupValue,
//       title: Text(title!),
//       onChanged: onChanged,
//     );
//   }
// }
}
