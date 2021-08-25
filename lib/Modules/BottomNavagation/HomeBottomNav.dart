import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Shared/Cubit/Cubit.dart';
import 'package:fluttertest/Shared/Cubit/States.dart';

class BottomNavagationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, states) => {},
          builder: (context, states) {
            var cubit = AppCubit.get(context);
            return Scaffold(
                bottomNavigationBar: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                    primaryColor: Colors.grey.shade800,
                  ),
                  child: BottomNavigationBar(
                      backgroundColor: Colors.white,
                      ///// item Selected Colors//////
                      selectedIconTheme:
                          IconThemeData(color: Color(0xffFE6078), size: 25),
                      selectedItemColor: Colors.white,
                      selectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.bold),
                      ////// un selected //////////
                      unselectedIconTheme:
                          IconThemeData(color: Colors.grey, size: 18),
                      unselectedItemColor: Color(0xffCCDEE5),
                      showUnselectedLabels: true,
                      onTap: (value) {
                        cubit.changeBottomNav(value);
                      },
                      currentIndex: cubit.currenindex,
                      items: cubit.bottomItem),
                ),
                body: cubit.screen[cubit.currenindex]);
          }),
    );
  }
}
