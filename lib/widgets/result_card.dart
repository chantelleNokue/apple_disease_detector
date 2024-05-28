
import 'package:apple_diseases_detector/screens/results/models/resultmodel.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';


class ResultCard extends StatelessWidget {
  final ResultModel result;
  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return  Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 4
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(
                  0, 3
              ),
            ),
          ],
        ),
        child:  Container(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                  color: Colors.white,
            ),

          child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(12)),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/128/16136/16136792.png',
                          width: 40,
                        color: Pallete.onePrimaryColor,
                      )
                  ),
                  title: Text(
                    'Result: ${result.result}',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    result.reccomandation,
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                      fontSize: 12
                    ),
                  ),

                  trailing: IconButton(
                    icon: Icon(
                      Icons.more_vert
                    ),
                    onPressed: (){

                    },
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 4,
                //             horizontal: 12
                //         ),
                //         decoration: BoxDecoration(
                //             color: Pallete.primaryColor.withOpacity(0.4),
                //             borderRadius: BorderRadius.circular(6)),
                //         child: Padding(
                //           padding: const EdgeInsets.all(6.0),
                //           child: Text(
                //             result.preferredAppointmentTime,
                //             style: GoogleFonts.roboto(
                //                 color: Colors.white,
                //                 fontSize: 12
                //             ),
                //           ),
                //         ),
                //       ),
                //
                //       Container(
                //         padding: const EdgeInsets.symmetric(
                //           vertical: 4,
                //           horizontal: 16
                //         ),
                //         decoration: BoxDecoration(
                //             color: Pallete.primaryColor,
                //             borderRadius: BorderRadius.circular(6)),
                //         child: Padding(
                //           padding: const EdgeInsets.all(6.0),
                //           child: Text(
                //             Helpers.getTimeFromTimeStamp(format: 'dd/MM/yyyy', timeStamp: result.preferredAppointmentDate.toString()),
                //             style: GoogleFonts.roboto(
                //               color: Colors.white,
                //               fontSize: 12
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   )



              ],
            ),
          ),

      );

  }
}



