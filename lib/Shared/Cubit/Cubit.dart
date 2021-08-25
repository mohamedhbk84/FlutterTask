import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Modules/BottomNavagation/Explore.dart';
import 'package:fluttertest/Modules/BottomNavagation/Gallery.dart';
import 'package:fluttertest/Modules/BottomNavagation/date.dart';
import 'package:fluttertest/Modules/BottomNavagation/direction.dart';
import 'package:fluttertest/Shared/Cubit/States.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitioalSates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currenindex = 0;

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.directions), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.date_range), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.photo), label: ""),
  ];

  var screen = [
    ExploreScreen(),
    DirectoryScreen(),
    DateScreen(),
    GalleryScreen(),
  ];

  void changeBottomNav(int index) {
    currenindex = index;

    emit(AppChangeBottomNavStates());
  }
}
