class SeekerDashboardModel {
  SeekerDashboardModel({
     this.status,
     this.message,
     this.seekerQuestionAnswerDetail,
     this.a,
     this.b,
     this.c,
  });
   String? status;
   String? message;
   SeekerQuestionAnswerDetail? seekerQuestionAnswerDetail;
   int ?a;
   int? b;
   int ?c;
  
  SeekerDashboardModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    seekerQuestionAnswerDetail = SeekerQuestionAnswerDetail.fromJson(json['seeker_question_answer_detail']);
    a = json['a'];
    b = json['b'];
    c = json['c'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['seeker_question_answer_detail'] = seekerQuestionAnswerDetail!.toJson();
    _data['a'] = a;
    _data['b'] = b;
    _data['c'] = c;
    return _data;
  }
}

class SeekerQuestionAnswerDetail {
  SeekerQuestionAnswerDetail({
     this.id,
     this.seekerId,
     this.question,
     this.firstAnswer,
     this.secondAnswer,
     this.thirdAnswer,
     this.correctAnswer,
  });
   int ?id;
   int? seekerId;
   String? question;
   String ?firstAnswer;
   String? secondAnswer;
   String ?thirdAnswer;
   String? correctAnswer;
  
  SeekerQuestionAnswerDetail.fromJson(Map<String, dynamic> json){
    id = json['id'];
    seekerId = json['seeker_id'];
    question = json['question'];
    firstAnswer = json['first_answer'];
    secondAnswer = json['second_answer'];
    thirdAnswer = json['third_answer'];
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['seeker_id'] = seekerId;
    _data['question'] = question;
    _data['first_answer'] = firstAnswer;
    _data['second_answer'] = secondAnswer;
    _data['third_answer'] = thirdAnswer;
    _data['correct_answer'] = correctAnswer;
    return _data;
  }
}