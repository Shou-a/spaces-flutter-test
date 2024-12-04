import 'package:flutter/material.dart';

import '../../../core/api/api_header.dart';
import '../../../core/api/api_services.dart';
import '../../../core/api/base_models/generic_response.dart';
import '../../../core/api/base_models/list_response.dart';
import '../../../core/widgets/custom_toaster.dart';
import '../models/character.dart';

class CharacterProvider extends ChangeNotifier {
  bool listLoading = false;
  List<Character> items = [];

  Future<GenericResponse<Character>> addItem(
      Character body, BuildContext context) async {
    GenericResponse<Character> response;
    try {
      listLoading = true;
      notifyListeners();
      //temp remove
      // response = await ApiServices(ApiHeader().dioData())
      //     .addItem(body, Character.fromJson, 'api.php?action=AddItem');
      // if (response.success == true) {
      //   if (response.success) items.add(response.data!);
      // } else {
      //   CusFlutterToast.showToast(response.message!);
      // }
      //temp add
      response = GenericResponse();

      items.insert(0, body);
      listLoading = false;
      notifyListeners();
    } catch (error) {
      listLoading = false;
      notifyListeners();
      return GenericResponse(message: error.toString());
    } finally {
      listLoading = false;
      notifyListeners();
    }
    return response;
  }

  Future<ListResponse<Character>> getList(
      Map<String, dynamic> body, BuildContext context,
      {int page = 0}) async {
    ListResponse<Character> response;
    try {
      listLoading = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).getList(body,
          Character.fromJson, 'character' + (page > 0 ? "?page=${page}" : ""));
      if (response.data.isNotEmpty) {
        if (page == 0) {
          items.clear();
        }
        items.addAll(response.data ?? []);
      }
      listLoading = false;
      notifyListeners();
    } catch (error) {
      listLoading = false;
      notifyListeners();
      return ListResponse();
    } finally {
      listLoading = false;
      notifyListeners();
    }
    return response;
  }

  Future<GenericResponse<Character>> getItem(
      Map<String, dynamic> body, BuildContext context) async {
    GenericResponse<Character> response;
    try {
      listLoading = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData())
          .getItem(body, Character.fromJson, 'api.php?action=AddItem');
      if (response.success == true) {
        items.clear();
        if (response.success) items.add(response.data!);
      } else {
        CusFlutterToast.showToast(response.message!);
      }
      listLoading = false;
      notifyListeners();
    } catch (error) {
      listLoading = false;
      notifyListeners();
      return GenericResponse(message: error.toString());
    } finally {
      listLoading = false;
      notifyListeners();
    }
    return response;
  }

  Future<GenericResponse<Character>> updateItem(
      Character body, BuildContext context) async {
    GenericResponse<Character> response;
    try {
      listLoading = true;
      notifyListeners();

      //temp remove
      // response = await ApiServices(ApiHeader().dioData())
      //     .updateItem(body.toJson(), Character.fromJson, 'api.php?action=EditItem');
      // if (response.success == true) {
      final index = items.indexWhere((x) => x.id == body.id);
      if (index != -1) {
        items[index] = body;
      }
      // } else {
      //   CusFlutterToast.showToast(response.message);
      // }
      //temp add
      response = GenericResponse();
      listLoading = false;
      notifyListeners();
    } catch (error) {
      listLoading = false;
      notifyListeners();
      return GenericResponse(message: error.toString());
    } finally {
      listLoading = false;
      notifyListeners();
    }
    return response;
  }

  Future<GenericResponse<Character>> deleteItem(
      Character body, BuildContext context) async {
    GenericResponse<Character> response;
    try {
      listLoading = true;
      notifyListeners();
      //temp remove

      // response = await ApiServices(ApiHeader().dioData())
      //     .deleteItem(body, Character.fromJson, 'api.php?action=DeleteItem');
      // if (response.success == true) {
      items.removeWhere((x) => x.id == body.id);
      // } else {
      //   CusFlutterToast.showToast(response.message);
      // }
      //temp add
      response = GenericResponse();

      listLoading = false;
      notifyListeners();
    } catch (error) {
      listLoading = false;
      notifyListeners();
      return GenericResponse(message: error.toString());
    } finally {
      listLoading = false;
      notifyListeners();
    }
    return response;
  }
}
