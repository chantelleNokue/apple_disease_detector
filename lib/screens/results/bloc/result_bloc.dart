import 'dart:async';
import 'dart:convert';

import 'package:apple_diseases_detector/screens/results/models/resultmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';



// import 'package:Eezimedz_Patients/models/appointmentsmodel.dart';
part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(PrescriptionInitial()) {
    on<ResultInitialFetchEvent>(resultInitialFetchEvent);
  }


  FutureOr<void> resultInitialFetchEvent(
      ResultInitialFetchEvent event,
      Emitter<ResultState> emit) async {
    emit(ResultfetchingLoadingState());

    var client = http.Client();
    List<ResultModel> result = [];
    try {
      print('noku');

      var headers = {
        'Content-Type': 'application/json'
      };

      var request = http.Request('GET', Uri.parse('http://192.168.100.14:3020/mongo/results/getAll'));
      request.body = json.encode({
        "email": "nokue@gmail.com"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();


      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      //   print('nokuee');
      // }
      // else {
      //   print(response.reasonPhrase);
      // }

      if (response.statusCode == 200) {
        print('noku');
        var responseBody = await response.stream.bytesToString();
        var jsonData = json.decode(responseBody);

        for (int i = 0; i < jsonData.length; i++) {
          ResultModel resultss =
          ResultModel.fromMap(jsonData[i] as Map<String, dynamic>);
          result.add(resultss);
        }
        print(jsonData);
        emit(PrescriptionFetchingSuccessfulState(results: result));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      emit(ResultfetchingErrorState());
      log(e.toString());
    }
  }
}
