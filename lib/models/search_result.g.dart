// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return SearchResult(
      start: json['start'] as int,
      numFound: json['numFound'] as int,
      docs: (json['docs'] as List)
          ?.map((e) =>
              e == null ? null : Document.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'start': instance.start,
      'numFound': instance.numFound,
      'docs': instance.docs
    };
