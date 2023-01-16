import 'package:flutter/material.dart';

class stockitem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  stockitem(
      {required this.title,
      required this.id,
      required this.price,
      required this.quantity});
}

class cart with ChangeNotifier {
  Map<String, stockitem> _items = {};

  Map<String, stockitem> get items {
    return {..._items};
  }

  int get itemcount {
    return _items.length;
  }

  double get amountes {
    double am = 0.0;
    _items.forEach((key, value) {
      am += value.price * value.quantity;
    });
    return am;
  }

  void additem(String id, double price, String t) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (value) => stockitem(
            title: value.title,
            id: value.id,
            price: value.price,
            quantity: value.quantity + 1),
      );
    } else {
      print('klllll');
      _items.putIfAbsent(
          id,
          () => stockitem(
              title: t.toString(),
              id: DateTime.now().toString(),
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  void remove(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removesingle(String prodid) {
    if (!_items.containsKey(prodid)) {
      return;
    }

    if (_items[prodid]!.quantity > 1) {
      _items.update(
          prodid,
          (v) => stockitem(
              title: v.title,
              id: v.id,
              price: v.price,
              quantity: v.quantity - 1));
    }
    if (_items[prodid]!.quantity == 1) {
      _items.remove(prodid);
    }
    notifyListeners();
  }
}
