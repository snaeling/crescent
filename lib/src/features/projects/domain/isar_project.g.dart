// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_project.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarProjectCollection on Isar {
  IsarCollection<IsarProject> get isarProjects => this.collection();
}

const IsarProjectSchema = CollectionSchema(
  name: r'IsarProject',
  id: 8174210821231210712,
  properties: {
    r'avatarPreviewURL': PropertySchema(
      id: 0,
      name: r'avatarPreviewURL',
      type: IsarType.string,
    ),
    r'avatarShape': PropertySchema(
      id: 1,
      name: r'avatarShape',
      type: IsarType.byte,
      enumMap: _IsarProjectavatarShapeEnumValueMap,
    ),
    r'dek': PropertySchema(
      id: 2,
      name: r'dek',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'displayName': PropertySchema(
      id: 4,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'flags': PropertySchema(
      id: 5,
      name: r'flags',
      type: IsarType.stringList,
    ),
    r'handle': PropertySchema(
      id: 6,
      name: r'handle',
      type: IsarType.string,
    ),
    r'headerPreviewURL': PropertySchema(
      id: 7,
      name: r'headerPreviewURL',
      type: IsarType.string,
    ),
    r'privacy': PropertySchema(
      id: 8,
      name: r'privacy',
      type: IsarType.byte,
      enumMap: _IsarProjectprivacyEnumValueMap,
    ),
    r'pronouns': PropertySchema(
      id: 9,
      name: r'pronouns',
      type: IsarType.string,
    ),
    r'ttl': PropertySchema(
      id: 10,
      name: r'ttl',
      type: IsarType.dateTime,
    ),
    r'url': PropertySchema(
      id: 11,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _isarProjectEstimateSize,
  serialize: _isarProjectSerialize,
  deserialize: _isarProjectDeserialize,
  deserializeProp: _isarProjectDeserializeProp,
  idName: r'id',
  indexes: {
    r'handle': IndexSchema(
      id: -5563962949089040958,
      name: r'handle',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'handle',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'ttl': IndexSchema(
      id: 5079547260154789438,
      name: r'ttl',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ttl',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarProjectGetId,
  getLinks: _isarProjectGetLinks,
  attach: _isarProjectAttach,
  version: '3.0.5',
);

int _isarProjectEstimateSize(
  IsarProject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatarPreviewURL;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dek;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.displayName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.flags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.handle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.headerPreviewURL;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pronouns;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarProjectSerialize(
  IsarProject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatarPreviewURL);
  writer.writeByte(offsets[1], object.avatarShape.index);
  writer.writeString(offsets[2], object.dek);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.displayName);
  writer.writeStringList(offsets[5], object.flags);
  writer.writeString(offsets[6], object.handle);
  writer.writeString(offsets[7], object.headerPreviewURL);
  writer.writeByte(offsets[8], object.privacy.index);
  writer.writeString(offsets[9], object.pronouns);
  writer.writeDateTime(offsets[10], object.ttl);
  writer.writeString(offsets[11], object.url);
}

IsarProject _isarProjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarProject(
    avatarPreviewURL: reader.readStringOrNull(offsets[0]),
    avatarShape: _IsarProjectavatarShapeValueEnumMap[
            reader.readByteOrNull(offsets[1])] ??
        AvatarShape.circle,
    dek: reader.readStringOrNull(offsets[2]),
    description: reader.readStringOrNull(offsets[3]),
    displayName: reader.readStringOrNull(offsets[4]),
    flags: reader.readStringList(offsets[5]),
    handle: reader.readStringOrNull(offsets[6]),
    headerPreviewURL: reader.readStringOrNull(offsets[7]),
    id: id,
    privacy:
        _IsarProjectprivacyValueEnumMap[reader.readByteOrNull(offsets[8])] ??
            PrivacyType.private,
    pronouns: reader.readStringOrNull(offsets[9]),
    url: reader.readStringOrNull(offsets[11]),
  );
  return object;
}

P _isarProjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_IsarProjectavatarShapeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AvatarShape.circle) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (_IsarProjectprivacyValueEnumMap[reader.readByteOrNull(offset)] ??
          PrivacyType.private) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarProjectavatarShapeEnumValueMap = {
  'circle': 0,
  'egg': 1,
  'square': 2,
  'squircle': 3,
  'roundrect': 4,
  'capsuleBig': 5,
  'capsuleSmall': 6,
};
const _IsarProjectavatarShapeValueEnumMap = {
  0: AvatarShape.circle,
  1: AvatarShape.egg,
  2: AvatarShape.square,
  3: AvatarShape.squircle,
  4: AvatarShape.roundrect,
  5: AvatarShape.capsuleBig,
  6: AvatarShape.capsuleSmall,
};
const _IsarProjectprivacyEnumValueMap = {
  'private': 0,
  'public': 1,
};
const _IsarProjectprivacyValueEnumMap = {
  0: PrivacyType.private,
  1: PrivacyType.public,
};

Id _isarProjectGetId(IsarProject object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarProjectGetLinks(IsarProject object) {
  return [];
}

void _isarProjectAttach(
    IsarCollection<dynamic> col, Id id, IsarProject object) {
  object.id = id;
}

extension IsarProjectByIndex on IsarCollection<IsarProject> {
  Future<IsarProject?> getByHandle(String? handle) {
    return getByIndex(r'handle', [handle]);
  }

  IsarProject? getByHandleSync(String? handle) {
    return getByIndexSync(r'handle', [handle]);
  }

  Future<bool> deleteByHandle(String? handle) {
    return deleteByIndex(r'handle', [handle]);
  }

  bool deleteByHandleSync(String? handle) {
    return deleteByIndexSync(r'handle', [handle]);
  }

  Future<List<IsarProject?>> getAllByHandle(List<String?> handleValues) {
    final values = handleValues.map((e) => [e]).toList();
    return getAllByIndex(r'handle', values);
  }

  List<IsarProject?> getAllByHandleSync(List<String?> handleValues) {
    final values = handleValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'handle', values);
  }

  Future<int> deleteAllByHandle(List<String?> handleValues) {
    final values = handleValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'handle', values);
  }

  int deleteAllByHandleSync(List<String?> handleValues) {
    final values = handleValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'handle', values);
  }

  Future<Id> putByHandle(IsarProject object) {
    return putByIndex(r'handle', object);
  }

  Id putByHandleSync(IsarProject object, {bool saveLinks = true}) {
    return putByIndexSync(r'handle', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByHandle(List<IsarProject> objects) {
    return putAllByIndex(r'handle', objects);
  }

  List<Id> putAllByHandleSync(List<IsarProject> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'handle', objects, saveLinks: saveLinks);
  }
}

extension IsarProjectQueryWhereSort
    on QueryBuilder<IsarProject, IsarProject, QWhere> {
  QueryBuilder<IsarProject, IsarProject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhere> anyTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'ttl'),
      );
    });
  }
}

extension IsarProjectQueryWhere
    on QueryBuilder<IsarProject, IsarProject, QWhereClause> {
  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> handleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'handle',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> handleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'handle',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> handleEqualTo(
      String? handle) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'handle',
        value: [handle],
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> handleNotEqualTo(
      String? handle) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'handle',
              lower: [],
              upper: [handle],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'handle',
              lower: [handle],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'handle',
              lower: [handle],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'handle',
              lower: [],
              upper: [handle],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> ttlEqualTo(
      DateTime ttl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ttl',
        value: [ttl],
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> ttlNotEqualTo(
      DateTime ttl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ttl',
              lower: [],
              upper: [ttl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ttl',
              lower: [ttl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ttl',
              lower: [ttl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ttl',
              lower: [],
              upper: [ttl],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> ttlGreaterThan(
    DateTime ttl, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ttl',
        lower: [ttl],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> ttlLessThan(
    DateTime ttl, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ttl',
        lower: [],
        upper: [ttl],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterWhereClause> ttlBetween(
    DateTime lowerTtl,
    DateTime upperTtl, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ttl',
        lower: [lowerTtl],
        includeLower: includeLower,
        upper: [upperTtl],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarProjectQueryFilter
    on QueryBuilder<IsarProject, IsarProject, QFilterCondition> {
  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarPreviewURL',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarPreviewURL',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarPreviewURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarPreviewURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarPreviewURL',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarPreviewURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarPreviewURL',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarShapeEqualTo(AvatarShape value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarShape',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarShapeGreaterThan(
    AvatarShape value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarShape',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarShapeLessThan(
    AvatarShape value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarShape',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      avatarShapeBetween(
    AvatarShape lower,
    AvatarShape upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarShape',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dek',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dek',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dek',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> dekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dek',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      dekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dek',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'displayName',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'displayName',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> flagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flags',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flags',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flags',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flags',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> flagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      flagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> handleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'handle',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      handleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'handle',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> handleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      handleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'handle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> handleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'handle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> handleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'handle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      handleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'handle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> handleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'handle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> handleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'handle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> handleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'handle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      handleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handle',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      handleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'handle',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'headerPreviewURL',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'headerPreviewURL',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'headerPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'headerPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'headerPreviewURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'headerPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'headerPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'headerPreviewURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'headerPreviewURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerPreviewURL',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      headerPreviewURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'headerPreviewURL',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> privacyEqualTo(
      PrivacyType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'privacy',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      privacyGreaterThan(
    PrivacyType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'privacy',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> privacyLessThan(
    PrivacyType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'privacy',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> privacyBetween(
    PrivacyType lower,
    PrivacyType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'privacy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pronouns',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pronouns',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> pronounsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pronouns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pronouns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pronouns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> pronounsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pronouns',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pronouns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pronouns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pronouns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> pronounsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pronouns',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pronouns',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      pronounsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pronouns',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> ttlEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ttl',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> ttlGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ttl',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> ttlLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ttl',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> ttlBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ttl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension IsarProjectQueryObject
    on QueryBuilder<IsarProject, IsarProject, QFilterCondition> {}

extension IsarProjectQueryLinks
    on QueryBuilder<IsarProject, IsarProject, QFilterCondition> {}

extension IsarProjectQuerySortBy
    on QueryBuilder<IsarProject, IsarProject, QSortBy> {
  QueryBuilder<IsarProject, IsarProject, QAfterSortBy>
      sortByAvatarPreviewURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPreviewURL', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy>
      sortByAvatarPreviewURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPreviewURL', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByAvatarShape() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarShape', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByAvatarShapeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarShape', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByDek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dek', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByDekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dek', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByHandle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handle', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByHandleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handle', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy>
      sortByHeaderPreviewURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headerPreviewURL', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy>
      sortByHeaderPreviewURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headerPreviewURL', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByPrivacy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privacy', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByPrivacyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privacy', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByPronouns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pronouns', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByPronounsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pronouns', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension IsarProjectQuerySortThenBy
    on QueryBuilder<IsarProject, IsarProject, QSortThenBy> {
  QueryBuilder<IsarProject, IsarProject, QAfterSortBy>
      thenByAvatarPreviewURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPreviewURL', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy>
      thenByAvatarPreviewURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPreviewURL', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByAvatarShape() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarShape', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByAvatarShapeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarShape', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByDek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dek', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByDekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dek', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByHandle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handle', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByHandleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handle', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy>
      thenByHeaderPreviewURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headerPreviewURL', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy>
      thenByHeaderPreviewURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headerPreviewURL', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByPrivacy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privacy', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByPrivacyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privacy', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByPronouns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pronouns', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByPronounsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pronouns', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension IsarProjectQueryWhereDistinct
    on QueryBuilder<IsarProject, IsarProject, QDistinct> {
  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByAvatarPreviewURL(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarPreviewURL',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByAvatarShape() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarShape');
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByDek(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dek', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByFlags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flags');
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByHandle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByHeaderPreviewURL(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'headerPreviewURL',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByPrivacy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'privacy');
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByPronouns(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pronouns', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }

  QueryBuilder<IsarProject, IsarProject, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension IsarProjectQueryProperty
    on QueryBuilder<IsarProject, IsarProject, QQueryProperty> {
  QueryBuilder<IsarProject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarProject, String?, QQueryOperations>
      avatarPreviewURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarPreviewURL');
    });
  }

  QueryBuilder<IsarProject, AvatarShape, QQueryOperations>
      avatarShapeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarShape');
    });
  }

  QueryBuilder<IsarProject, String?, QQueryOperations> dekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dek');
    });
  }

  QueryBuilder<IsarProject, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<IsarProject, String?, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<IsarProject, List<String>?, QQueryOperations> flagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flags');
    });
  }

  QueryBuilder<IsarProject, String?, QQueryOperations> handleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handle');
    });
  }

  QueryBuilder<IsarProject, String?, QQueryOperations>
      headerPreviewURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'headerPreviewURL');
    });
  }

  QueryBuilder<IsarProject, PrivacyType, QQueryOperations> privacyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'privacy');
    });
  }

  QueryBuilder<IsarProject, String?, QQueryOperations> pronounsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pronouns');
    });
  }

  QueryBuilder<IsarProject, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }

  QueryBuilder<IsarProject, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
