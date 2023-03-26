// *********** CAN BE USED WHENEVER NECCESSARY INSTEAD OF BLOC GLOBAL OBJECT */

// import 'package:flutter/material.dart';
// import 'package:mentz/src/blocs/journey_bloc.dart';

// class journeyBlocProvider extends InheritedWidget {
//   final JourneyBloc bloc;

//   journeyBlocProvider({Key? key, required Widget child})
//       : bloc = JourneyBloc(),
//         super(key: key, child: child);

//   @override
//   bool updateShouldNotify(_) => true;

//   static JourneyBloc of(BuildContext context) {
//     return (context.dependOnInheritedWidgetOfExactType<journeyBlocProvider>()
//             as journeyBlocProvider)
//         .bloc;
//   }
// }