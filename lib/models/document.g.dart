// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
      titleSuggest: json['title_suggest'] as String,
      editionKey:
          (json['edition_key'] as List)?.map((e) => e as String)?.toList(),
      coverId: json['cover_i'] as int,
      isbn: (json['isbn'] as List)?.map((e) => e as String)?.toList(),
      hasFulltext: json['has_fulltext'] as bool,
      authorName:
          (json['author_name'] as List)?.map((e) => e as String)?.toList(),
      contributor:
          (json['contributor'] as List)?.map((e) => e as String)?.toList(),
      authorKey:
          (json['author_key'] as List)?.map((e) => e as String)?.toList(),
      firstPublishYear: json['first_publish_year'] as int,
      title: json['title'] as String,
      publisher: (json['publisher'] as List)?.map((e) => e as String)?.toList(),
      language: (json['language'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'title_suggest': instance.titleSuggest,
      'edition_key': instance.editionKey,
      'cover_i': instance.coverId,
      'isbn': instance.isbn,
      'has_fulltext': instance.hasFulltext,
      'author_name': instance.authorName,
      'contributor': instance.contributor,
      'author_key': instance.authorKey,
      'first_publish_year': instance.firstPublishYear,
      'title': instance.title,
      'publisher': instance.publisher,
      'language': instance.language
    };
