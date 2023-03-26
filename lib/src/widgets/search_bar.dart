import 'package:flutter/material.dart';
import 'package:mentz/src/accessories/color_pallette.dart';
import '../blocs/journey_bloc.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: TextField(
        onSubmitted: (searchedText) {
          jBloc.fetchSearchedResults(searchedText);
        },
        autocorrect: false,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: ColorPallette.secondaryText),
            contentPadding: EdgeInsets.all(4.w),
            isDense: true,
            filled: true,
            // border: InputBorder.none,
            fillColor: ColorPallette.lightPrimaryColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            prefixIcon: Icon(Icons.search, color: ColorPallette.secondaryText,),
            hintText: 'Search For Place ...'),
        style: TextStyle(
          color: ColorPallette.secondaryText,
        ),
      ),
    );
  }
}
