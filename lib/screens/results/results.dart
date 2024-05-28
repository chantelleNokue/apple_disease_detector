import 'package:apple_diseases_detector/constants/colors.dart';
import 'package:apple_diseases_detector/screens/results/bloc/result_bloc.dart';
import 'package:apple_diseases_detector/screens/results/models/resultmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/result_card.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  List<ResultModel> results = [];
  final ResultBloc resultBloc = ResultBloc();

  @override
  void initState() {
    resultBloc.add(ResultInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Pallete.onePrimaryColor,
        title: Text('Results', style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_sharp,
                color: Colors.white,
              ));
        }),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.person,  color: Colors.white,),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              BlocConsumer<ResultBloc, ResultState>(
                bloc: resultBloc,
                listenWhen: (previous, current) => current is PrescriptionActionState,
                buildWhen: (previous, current) => current is! PrescriptionActionState,
                listener: (context, state) {
                  // Implementation
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case ResultfetchingLoadingState:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case PrescriptionFetchingSuccessfulState:
                      final successState = state as PrescriptionFetchingSuccessfulState;

                      if (successState.results.isEmpty) {
                        return const Center(
                          child: Text('No admissions found'),
                        );
                      }

                      return SizedBox(
                        height: 600,
                        child: ListView.builder(
                          itemCount: successState.results.length,
                          itemBuilder: (context, index) {
                            final result = successState.results[index];



                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ResultCard(

                                  result: result,
                                ),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}
