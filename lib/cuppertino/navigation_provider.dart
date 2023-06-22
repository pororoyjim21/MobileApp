import 'package:bsu_aims/cuppertino/navigation_item.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier{
  NavigationItem _navigationItem = NavigationItem.personal;

  NavigationItem get navigationItem => _navigationItem;

  void setNavigationItem(NavigationItem navigationItem){
    _navigationItem = navigationItem;

    notifyListeners();

  }

}