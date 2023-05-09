
import 'package:flutter/foundation.dart';

import '../model/mesagge.dart';


class HomeProvider extends ChangeNotifier {
  final List<Mesagge> _messages = [];

  List<Mesagge> get messages => _messages;

  addNewMessage(Mesagge message) {
    _messages.add(message);
    notifyListeners();
  }
}