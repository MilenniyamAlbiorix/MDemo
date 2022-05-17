import 'dart:convert';

NewResponse welcomeFromJson(String str) => NewResponse.fromJson(json.decode(str));

String welcomeToJson(NewResponse data) => json.encode(data.toJson());

class NewResponse {
  NewResponse({
    this.responseCode,
    this.results,
  });

  int? responseCode;
  List<Result>? results;

  factory NewResponse.fromJson(Map<String, dynamic> json) => NewResponse(
    responseCode: json["response_code"] == null ? null : json["response_code"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode == null ? null : responseCode,
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
  };

}

class Result {
  Result({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  String? category;
  String? type;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: json["category"] == null ? null : json["category"],
    type: json["type"] == null ? null : json["type"],
    difficulty: json["difficulty"] == null ? null : json["difficulty"],
    question: json["question"] == null ? null : json["question"],
    correctAnswer: json["correct_answer"] == null ? null : json["correct_answer"],
    incorrectAnswers: json["incorrect_answers"] == null ? null : List<String>.from(json["incorrect_answers"].map((x) => x)),
  );
  Map<String, dynamic> toJson() => {
    "category": category == null ? null : category,
    "type": type == null ? null : type,
    "difficulty": difficulty == null ? null : difficulty,
    "question": question == null ? null : question,
    "correct_answer": correctAnswer == null ? null : correctAnswer,
    "incorrect_answers": incorrectAnswers == null ? null : List<dynamic>.from(incorrectAnswers!.map((x) => x)),
  };
}

