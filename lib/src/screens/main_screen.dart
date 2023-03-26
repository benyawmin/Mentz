/* Main screen of the Mentz application
This applcation shows the results from EFA server
*/

// Sizer is a package to create the app responsive
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:mentz/src/accessories/color_pallette.dart';
import 'package:mentz/src/accessories/text_style.dart';
import 'package:mentz/src/models/journey_model.dart';
import '../blocs/journey_bloc.dart';
import '../widgets/search_bar.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SearchBar(),
      // Loading the data fetched by API and showing on the screen
      StreamBuilder(
          stream: jBloc.searchedResultsStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(2.w),
                child: SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      final Location item = snapshot.data![index];
                      return Card(
                        elevation: 5,
                          child: ListTile(
                            textColor: ColorPallette.secondaryText,
                            tileColor: ColorPallette.textOrIconsColor,
                        leading: (() {
                          if (item.type.toString() == 'poi') {
                            return const Icon(
                              Icons.restaurant,
                              size: 30,
                            );
                          } else if (item.type.toString() == 'street') {
                            return const Icon(Icons.streetview);
                          } else if (item.type.toString() == 'stop') {
                            return const Icon(Icons.back_hand);
                          } else {
                            return const Icon(Icons.error);
                          }
                        }()),
                        title: Text(item.name, style: AppTextStyle.primary),
                      ));
                    }),
                    itemCount: snapshot.data?.length,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return SizedBox(
                  width: 300,
                  height: 300,
                  child: Text(snapshot.error.toString(),
                      style: AppTextStyle.primary));
            }
            return const SizedBox();
          })
    ]);
  }
}
