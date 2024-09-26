import 'package:crayondcart/Models/showCase2Model.dart';
import 'package:crayondcart/Service/ApiService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDataProvider = FutureProvider<List<UserModel>>(
  (ref) async {
    return ref.watch(apiDataProvider).fetchUsers();
  },
);
