import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../customeAnimations/fade_in_slide.dart';
import '../../utils/asset_utils/assets_util.dart';

class ResultPage extends StatefulWidget {
  final String result;
  final String reccomandation;

  const ResultPage(
      {super.key, required this.result, required this.reccomandation});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<void> sendResults(String result, String reccomandation) async {
    var url = Uri.parse('http://192.168.100.14:3020/mongo/results/create');

    try{
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "result": result,
          "reccomandation": reccomandation,
        }),
      );
      if(response.statusCode == 200){
        print('Result sent successfully');
      }else{
        print('Result sending failed with status code ${response.statusCode}');
      }

    }catch (e){
      print(e.toString());
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendResults(widget.result, widget.reccomandation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInSlide(
                duration: 1.0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 200,
                  child: Image.asset(Assets.eezimedzLogo),
                )),

            Row(
              children: [
                Text(
                  'DIAGNOSIS',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Pallete.onePrimaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.result,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            FadeInSlide(
                duration: 1.0,
                child: Divider(color: Colors.grey.withOpacity(0.2))),


            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'RECOMANDATIONS',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Pallete.onePrimaryColor),
                ),
              ],
            ),

            Text(
              widget.reccomandation,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800),
            ),

            const SizedBox(
              height: 16,
            ),

            // Text(result),
            // Text(reccomandation),
          ],
        ),
      ),
    );
  }
}
