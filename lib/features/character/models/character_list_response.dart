import 'package:base_project/features/character/models/character.dart';

import '../../../core/api/base_models/base_entity_enforce.dart';

class CharacterListResponse extends BaseEntity {
  CharacterListResponse({
    Pagination? pagination,
    List<Character>? data,
  }) {
    _pagination = pagination;
    _data = data;
  }

  CharacterListResponse.fromJson(dynamic json) {
    _pagination = Pagination.fromJson(json['info']);
    _data = json['results'];
  }

  Pagination? _pagination;
  List<Character>? _data;

  CharacterListResponse copyWith(
          {Pagination? pagination, List<Character>? data}) =>
      CharacterListResponse(
        pagination: pagination ?? _pagination,
        data: data ?? _data,
      );

  Pagination? get pagination => _pagination;
  List<Character>? get data => _data;

  set pagination(Pagination? value) => _pagination = value;
  set data(List<Character>? value) => _data = value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterListResponse &&
          runtimeType == other.runtimeType &&
          _pagination == other._pagination &&
          _data == other._data;

  @override
  int get hashCode => _pagination.hashCode ^ _data.hashCode;
}

class Pagination {
  Pagination({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) {
    _count = count;
    _pages = pages;
    _next = next;
    _prev = prev;
  }

  Pagination.fromJson(dynamic json) {
    _count = int.tryParse(json['count']);
    _pages = int.tryParse(json['pages']);
    _next = json['next'];
    _prev = json['prev'];
  }

  int? _count;
  int? _pages;
  String? _next;
  String? _prev;

  Pagination copyWith({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) =>
      Pagination(
        count: count ?? _count,
        pages: pages ?? _pages,
        next: next ?? _next,
        prev: prev ?? _prev,
      );

  int? get count => _count;
  int? get pages => _pages;
  String? get next => _next;
  String? get prev => _prev;

  set count(int? value) => _count = value;
  set pages(int? value) => _pages = value;
  set next(String? value) => _next = value;
  set prev(String? value) => _prev = value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pagination &&
          runtimeType == other.runtimeType &&
          _count == other._count &&
          _pages == other._pages &&
          _next == other._next &&
          _prev == other._prev;

  @override
  int get hashCode =>
      _count.hashCode ^ _pages.hashCode ^ _next.hashCode ^ _prev.hashCode;
}