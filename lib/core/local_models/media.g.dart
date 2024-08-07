// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMediaCollection on Isar {
  IsarCollection<Media> get medias => this.collection();
}

const MediaSchema = CollectionSchema(
  name: r'Media',
  id: 6434281596432674333,
  properties: {
    r'backdropUrl': PropertySchema(
      id: 0,
      name: r'backdropUrl',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'isFavorite': PropertySchema(
      id: 2,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'isWatchList': PropertySchema(
      id: 3,
      name: r'isWatchList',
      type: IsarType.bool,
    ),
    r'overview': PropertySchema(
      id: 4,
      name: r'overview',
      type: IsarType.string,
    ),
    r'posterUrl': PropertySchema(
      id: 5,
      name: r'posterUrl',
      type: IsarType.string,
    ),
    r'releaseDate': PropertySchema(
      id: 6,
      name: r'releaseDate',
      type: IsarType.string,
    ),
    r'stringify': PropertySchema(
      id: 7,
      name: r'stringify',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 8,
      name: r'title',
      type: IsarType.string,
    ),
    r'tmdbID': PropertySchema(
      id: 9,
      name: r'tmdbID',
      type: IsarType.long,
    ),
    r'voteAverage': PropertySchema(
      id: 10,
      name: r'voteAverage',
      type: IsarType.double,
    )
  },
  estimateSize: _mediaEstimateSize,
  serialize: _mediaSerialize,
  deserialize: _mediaDeserialize,
  deserializeProp: _mediaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mediaGetId,
  getLinks: _mediaGetLinks,
  attach: _mediaAttach,
  version: '3.1.0+1',
);

int _mediaEstimateSize(
  Media object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.backdropUrl.length * 3;
  bytesCount += 3 + object.overview.length * 3;
  bytesCount += 3 + object.posterUrl.length * 3;
  bytesCount += 3 + object.releaseDate.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _mediaSerialize(
  Media object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backdropUrl);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeBool(offsets[2], object.isFavorite);
  writer.writeBool(offsets[3], object.isWatchList);
  writer.writeString(offsets[4], object.overview);
  writer.writeString(offsets[5], object.posterUrl);
  writer.writeString(offsets[6], object.releaseDate);
  writer.writeBool(offsets[7], object.stringify);
  writer.writeString(offsets[8], object.title);
  writer.writeLong(offsets[9], object.tmdbID);
  writer.writeDouble(offsets[10], object.voteAverage);
}

Media _mediaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Media(
    backdropUrl: reader.readString(offsets[0]),
    id: id,
    isFavorite: reader.readBool(offsets[2]),
    isWatchList: reader.readBool(offsets[3]),
    overview: reader.readString(offsets[4]),
    posterUrl: reader.readString(offsets[5]),
    releaseDate: reader.readString(offsets[6]),
    title: reader.readString(offsets[8]),
    tmdbID: reader.readLong(offsets[9]),
    voteAverage: reader.readDouble(offsets[10]),
  );
  return object;
}

P _mediaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mediaGetId(Media object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _mediaGetLinks(Media object) {
  return [];
}

void _mediaAttach(IsarCollection<dynamic> col, Id id, Media object) {}

extension MediaQueryWhereSort on QueryBuilder<Media, Media, QWhere> {
  QueryBuilder<Media, Media, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MediaQueryWhere on QueryBuilder<Media, Media, QWhereClause> {
  QueryBuilder<Media, Media, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Media, Media, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Media, Media, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Media, Media, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MediaQueryFilter on QueryBuilder<Media, Media, QFilterCondition> {
  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backdropUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backdropUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backdropUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backdropUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backdropUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backdropUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backdropUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backdropUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backdropUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> backdropUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backdropUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> isWatchListEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWatchList',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overview',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'overview',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'overview',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overview',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> overviewIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'overview',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'posterUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'posterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'posterUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'posterUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> posterUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'posterUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'releaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'releaseDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> releaseDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'releaseDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> stringifyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> stringifyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringify',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> tmdbIDEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tmdbID',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> tmdbIDGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tmdbID',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> tmdbIDLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tmdbID',
        value: value,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> tmdbIDBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tmdbID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> voteAverageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> voteAverageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> voteAverageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voteAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Media, Media, QAfterFilterCondition> voteAverageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voteAverage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension MediaQueryObject on QueryBuilder<Media, Media, QFilterCondition> {}

extension MediaQueryLinks on QueryBuilder<Media, Media, QFilterCondition> {}

extension MediaQuerySortBy on QueryBuilder<Media, Media, QSortBy> {
  QueryBuilder<Media, Media, QAfterSortBy> sortByBackdropUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backdropUrl', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByBackdropUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backdropUrl', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByIsWatchList() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatchList', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByIsWatchListDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatchList', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByOverview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overview', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByOverviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overview', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByPosterUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterUrl', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByPosterUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterUrl', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByReleaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByTmdbID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbID', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByTmdbIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbID', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> sortByVoteAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.desc);
    });
  }
}

extension MediaQuerySortThenBy on QueryBuilder<Media, Media, QSortThenBy> {
  QueryBuilder<Media, Media, QAfterSortBy> thenByBackdropUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backdropUrl', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByBackdropUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backdropUrl', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByIsWatchList() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatchList', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByIsWatchListDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWatchList', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByOverview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overview', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByOverviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overview', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByPosterUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterUrl', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByPosterUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'posterUrl', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByReleaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByTmdbID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbID', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByTmdbIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbID', Sort.desc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.asc);
    });
  }

  QueryBuilder<Media, Media, QAfterSortBy> thenByVoteAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteAverage', Sort.desc);
    });
  }
}

extension MediaQueryWhereDistinct on QueryBuilder<Media, Media, QDistinct> {
  QueryBuilder<Media, Media, QDistinct> distinctByBackdropUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backdropUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByIsWatchList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWatchList');
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByOverview(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overview', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByPosterUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'posterUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByReleaseDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'releaseDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stringify');
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByTmdbID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tmdbID');
    });
  }

  QueryBuilder<Media, Media, QDistinct> distinctByVoteAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voteAverage');
    });
  }
}

extension MediaQueryProperty on QueryBuilder<Media, Media, QQueryProperty> {
  QueryBuilder<Media, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Media, String, QQueryOperations> backdropUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backdropUrl');
    });
  }

  QueryBuilder<Media, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Media, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<Media, bool, QQueryOperations> isWatchListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWatchList');
    });
  }

  QueryBuilder<Media, String, QQueryOperations> overviewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overview');
    });
  }

  QueryBuilder<Media, String, QQueryOperations> posterUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'posterUrl');
    });
  }

  QueryBuilder<Media, String, QQueryOperations> releaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'releaseDate');
    });
  }

  QueryBuilder<Media, bool?, QQueryOperations> stringifyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stringify');
    });
  }

  QueryBuilder<Media, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Media, int, QQueryOperations> tmdbIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tmdbID');
    });
  }

  QueryBuilder<Media, double, QQueryOperations> voteAverageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voteAverage');
    });
  }
}
