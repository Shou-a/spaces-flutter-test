import 'base_entity_enforce.dart';

class ListResponse<T extends BaseEntity> extends BaseEntity {
  Pagination? pagination;
  List<T> data;

  ListResponse({
    this.pagination = null,
    this.data = const [],
  });

  @override
  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ListResponse<T>(
      pagination: Pagination.fromJson(json["info"]),
      data: json["results"] == null
          ? []
          : List<T>.from(json["results"]!.map((x) => fromJsonT(x))),
    );
  }
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
    _count = json['count'];
    _pages = json['pages'];
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
