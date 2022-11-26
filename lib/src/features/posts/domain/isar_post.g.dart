// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_post.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarPostCollection on Isar {
  IsarCollection<IsarPost> get isarPosts => this.collection();
}

const IsarPostSchema = CollectionSchema(
  name: r'IsarPost',
  id: 8958281595613992375,
  properties: {
    r'blocks': PropertySchema(
      id: 0,
      name: r'blocks',
      type: IsarType.objectList,
      target: r'IsarEmbeddedPostBlock',
    ),
    r'canPublish': PropertySchema(
      id: 1,
      name: r'canPublish',
      type: IsarType.bool,
    ),
    r'canShare': PropertySchema(
      id: 2,
      name: r'canShare',
      type: IsarType.bool,
    ),
    r'commentsLocked': PropertySchema(
      id: 3,
      name: r'commentsLocked',
      type: IsarType.bool,
    ),
    r'contributorBlockIncomingOrOutgoing': PropertySchema(
      id: 4,
      name: r'contributorBlockIncomingOrOutgoing',
      type: IsarType.bool,
    ),
    r'cws': PropertySchema(
      id: 5,
      name: r'cws',
      type: IsarType.stringList,
    ),
    r'effectiveAdultContent': PropertySchema(
      id: 6,
      name: r'effectiveAdultContent',
      type: IsarType.bool,
    ),
    r'filename': PropertySchema(
      id: 7,
      name: r'filename',
      type: IsarType.string,
    ),
    r'hasAnyContributorMuted': PropertySchema(
      id: 8,
      name: r'hasAnyContributorMuted',
      type: IsarType.bool,
    ),
    r'hasCohostPlus': PropertySchema(
      id: 9,
      name: r'hasCohostPlus',
      type: IsarType.bool,
    ),
    r'headline': PropertySchema(
      id: 10,
      name: r'headline',
      type: IsarType.string,
    ),
    r'isEditor': PropertySchema(
      id: 11,
      name: r'isEditor',
      type: IsarType.bool,
    ),
    r'isLiked': PropertySchema(
      id: 12,
      name: r'isLiked',
      type: IsarType.bool,
    ),
    r'numComments': PropertySchema(
      id: 13,
      name: r'numComments',
      type: IsarType.long,
    ),
    r'numSharedComments': PropertySchema(
      id: 14,
      name: r'numSharedComments',
      type: IsarType.long,
    ),
    r'pinned': PropertySchema(
      id: 15,
      name: r'pinned',
      type: IsarType.bool,
    ),
    r'plainTextBody': PropertySchema(
      id: 16,
      name: r'plainTextBody',
      type: IsarType.string,
    ),
    r'postEditUrl': PropertySchema(
      id: 17,
      name: r'postEditUrl',
      type: IsarType.string,
    ),
    r'publishedAt': PropertySchema(
      id: 18,
      name: r'publishedAt',
      type: IsarType.dateTime,
    ),
    r'singlePostPageUrl': PropertySchema(
      id: 19,
      name: r'singlePostPageUrl',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 20,
      name: r'state',
      type: IsarType.long,
    ),
    r'tags': PropertySchema(
      id: 21,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'transparentShareOfPostId': PropertySchema(
      id: 22,
      name: r'transparentShareOfPostId',
      type: IsarType.long,
    ),
    r'ttl': PropertySchema(
      id: 23,
      name: r'ttl',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _isarPostEstimateSize,
  serialize: _isarPostSerialize,
  deserialize: _isarPostDeserialize,
  deserializeProp: _isarPostDeserializeProp,
  idName: r'id',
  indexes: {
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
  links: {
    r'postingProject': LinkSchema(
      id: 7682787284669433470,
      name: r'postingProject',
      target: r'IsarProject',
      single: true,
    ),
    r'shareTree': LinkSchema(
      id: -210739367377899357,
      name: r'shareTree',
      target: r'IsarPost',
      single: false,
    ),
    r'relatedProjects': LinkSchema(
      id: -405653695969265745,
      name: r'relatedProjects',
      target: r'IsarProject',
      single: false,
    )
  },
  embeddedSchemas: {r'IsarEmbeddedPostBlock': IsarEmbeddedPostBlockSchema},
  getId: _isarPostGetId,
  getLinks: _isarPostGetLinks,
  attach: _isarPostAttach,
  version: '3.0.5',
);

int _isarPostEstimateSize(
  IsarPost object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.blocks;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarEmbeddedPostBlock]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += IsarEmbeddedPostBlockSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.cws;
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
    final value = object.filename;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.headline;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.plainTextBody;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.postEditUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.singlePostPageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tags;
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
  return bytesCount;
}

void _isarPostSerialize(
  IsarPost object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<IsarEmbeddedPostBlock>(
    offsets[0],
    allOffsets,
    IsarEmbeddedPostBlockSchema.serialize,
    object.blocks,
  );
  writer.writeBool(offsets[1], object.canPublish);
  writer.writeBool(offsets[2], object.canShare);
  writer.writeBool(offsets[3], object.commentsLocked);
  writer.writeBool(offsets[4], object.contributorBlockIncomingOrOutgoing);
  writer.writeStringList(offsets[5], object.cws);
  writer.writeBool(offsets[6], object.effectiveAdultContent);
  writer.writeString(offsets[7], object.filename);
  writer.writeBool(offsets[8], object.hasAnyContributorMuted);
  writer.writeBool(offsets[9], object.hasCohostPlus);
  writer.writeString(offsets[10], object.headline);
  writer.writeBool(offsets[11], object.isEditor);
  writer.writeBool(offsets[12], object.isLiked);
  writer.writeLong(offsets[13], object.numComments);
  writer.writeLong(offsets[14], object.numSharedComments);
  writer.writeBool(offsets[15], object.pinned);
  writer.writeString(offsets[16], object.plainTextBody);
  writer.writeString(offsets[17], object.postEditUrl);
  writer.writeDateTime(offsets[18], object.publishedAt);
  writer.writeString(offsets[19], object.singlePostPageUrl);
  writer.writeLong(offsets[20], object.state);
  writer.writeStringList(offsets[21], object.tags);
  writer.writeLong(offsets[22], object.transparentShareOfPostId);
  writer.writeDateTime(offsets[23], object.ttl);
}

IsarPost _isarPostDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarPost(
    blocks: reader.readObjectList<IsarEmbeddedPostBlock>(
      offsets[0],
      IsarEmbeddedPostBlockSchema.deserialize,
      allOffsets,
      IsarEmbeddedPostBlock(),
    ),
    canPublish: reader.readBoolOrNull(offsets[1]),
    canShare: reader.readBoolOrNull(offsets[2]),
    commentsLocked: reader.readBoolOrNull(offsets[3]),
    contributorBlockIncomingOrOutgoing: reader.readBoolOrNull(offsets[4]),
    cws: reader.readStringList(offsets[5]),
    effectiveAdultContent: reader.readBoolOrNull(offsets[6]),
    filename: reader.readStringOrNull(offsets[7]),
    hasAnyContributorMuted: reader.readBoolOrNull(offsets[8]),
    hasCohostPlus: reader.readBoolOrNull(offsets[9]),
    headline: reader.readStringOrNull(offsets[10]),
    id: id,
    isEditor: reader.readBoolOrNull(offsets[11]),
    isLiked: reader.readBoolOrNull(offsets[12]),
    numComments: reader.readLongOrNull(offsets[13]),
    numSharedComments: reader.readLongOrNull(offsets[14]),
    pinned: reader.readBoolOrNull(offsets[15]),
    plainTextBody: reader.readStringOrNull(offsets[16]),
    postEditUrl: reader.readStringOrNull(offsets[17]),
    publishedAt: reader.readDateTimeOrNull(offsets[18]),
    singlePostPageUrl: reader.readStringOrNull(offsets[19]),
    state: reader.readLongOrNull(offsets[20]),
    tags: reader.readStringList(offsets[21]),
    transparentShareOfPostId: reader.readLongOrNull(offsets[22]),
  );
  return object;
}

P _isarPostDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<IsarEmbeddedPostBlock>(
        offset,
        IsarEmbeddedPostBlockSchema.deserialize,
        allOffsets,
        IsarEmbeddedPostBlock(),
      )) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readStringList(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarPostGetId(IsarPost object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarPostGetLinks(IsarPost object) {
  return [object.postingProject, object.shareTree, object.relatedProjects];
}

void _isarPostAttach(IsarCollection<dynamic> col, Id id, IsarPost object) {
  object.id = id;
  object.postingProject
      .attach(col, col.isar.collection<IsarProject>(), r'postingProject', id);
  object.shareTree
      .attach(col, col.isar.collection<IsarPost>(), r'shareTree', id);
  object.relatedProjects
      .attach(col, col.isar.collection<IsarProject>(), r'relatedProjects', id);
}

extension IsarPostQueryWhereSort on QueryBuilder<IsarPost, IsarPost, QWhere> {
  QueryBuilder<IsarPost, IsarPost, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterWhere> anyTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'ttl'),
      );
    });
  }
}

extension IsarPostQueryWhere on QueryBuilder<IsarPost, IsarPost, QWhereClause> {
  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> ttlEqualTo(DateTime ttl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ttl',
        value: [ttl],
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> ttlNotEqualTo(
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

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> ttlGreaterThan(
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

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> ttlLessThan(
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

  QueryBuilder<IsarPost, IsarPost, QAfterWhereClause> ttlBetween(
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

extension IsarPostQueryFilter
    on QueryBuilder<IsarPost, IsarPost, QFilterCondition> {
  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> blocksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blocks',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> blocksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blocks',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> blocksLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blocks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> blocksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blocks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> blocksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blocks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> blocksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blocks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      blocksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blocks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> blocksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blocks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> canPublishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'canPublish',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      canPublishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'canPublish',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> canPublishEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canPublish',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> canShareIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'canShare',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> canShareIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'canShare',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> canShareEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canShare',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      commentsLockedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commentsLocked',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      commentsLockedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commentsLocked',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> commentsLockedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentsLocked',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      contributorBlockIncomingOrOutgoingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contributorBlockIncomingOrOutgoing',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      contributorBlockIncomingOrOutgoingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contributorBlockIncomingOrOutgoing',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      contributorBlockIncomingOrOutgoingEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contributorBlockIncomingOrOutgoing',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cws',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cws',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cws',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cws',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cws',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cws',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cws',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cws',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cws',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cws',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cws',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      cwsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cws',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cws',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cws',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cws',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cws',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cws',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> cwsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cws',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      effectiveAdultContentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveAdultContent',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      effectiveAdultContentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveAdultContent',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      effectiveAdultContentEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveAdultContent',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'filename',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'filename',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filename',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filename',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filename',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filename',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> filenameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filename',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      hasAnyContributorMutedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasAnyContributorMuted',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      hasAnyContributorMutedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasAnyContributorMuted',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      hasAnyContributorMutedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasAnyContributorMuted',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      hasCohostPlusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasCohostPlus',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      hasCohostPlusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasCohostPlus',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> hasCohostPlusEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasCohostPlus',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'headline',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'headline',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'headline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'headline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'headline',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'headline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'headline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'headline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'headline',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headline',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> headlineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'headline',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> isEditorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isEditor',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> isEditorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isEditor',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> isEditorEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEditor',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> isLikedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLiked',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> isLikedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLiked',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> isLikedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLiked',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> numCommentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numComments',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      numCommentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numComments',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> numCommentsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numComments',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      numCommentsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numComments',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> numCommentsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numComments',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> numCommentsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numComments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      numSharedCommentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numSharedComments',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      numSharedCommentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numSharedComments',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      numSharedCommentsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numSharedComments',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      numSharedCommentsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numSharedComments',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      numSharedCommentsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numSharedComments',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      numSharedCommentsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numSharedComments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> pinnedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pinned',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> pinnedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pinned',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> pinnedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinned',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      plainTextBodyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plainTextBody',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      plainTextBodyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plainTextBody',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> plainTextBodyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plainTextBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      plainTextBodyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plainTextBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> plainTextBodyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plainTextBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> plainTextBodyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plainTextBody',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      plainTextBodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plainTextBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> plainTextBodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plainTextBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> plainTextBodyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plainTextBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> plainTextBodyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plainTextBody',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      plainTextBodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plainTextBody',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      plainTextBodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plainTextBody',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'postEditUrl',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      postEditUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'postEditUrl',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postEditUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      postEditUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'postEditUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'postEditUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'postEditUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'postEditUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'postEditUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'postEditUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'postEditUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postEditUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postEditUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      postEditUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'postEditUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> publishedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publishedAt',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      publishedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publishedAt',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> publishedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      publishedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> publishedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> publishedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publishedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'singlePostPageUrl',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'singlePostPageUrl',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'singlePostPageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'singlePostPageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'singlePostPageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'singlePostPageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'singlePostPageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'singlePostPageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'singlePostPageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'singlePostPageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'singlePostPageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      singlePostPageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'singlePostPageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> stateEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> stateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> stateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> stateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      transparentShareOfPostIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transparentShareOfPostId',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      transparentShareOfPostIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transparentShareOfPostId',
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      transparentShareOfPostIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transparentShareOfPostId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      transparentShareOfPostIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transparentShareOfPostId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      transparentShareOfPostIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transparentShareOfPostId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      transparentShareOfPostIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transparentShareOfPostId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> ttlEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ttl',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> ttlGreaterThan(
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

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> ttlLessThan(
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

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> ttlBetween(
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
}

extension IsarPostQueryObject
    on QueryBuilder<IsarPost, IsarPost, QFilterCondition> {
  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> blocksElement(
      FilterQuery<IsarEmbeddedPostBlock> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'blocks');
    });
  }
}

extension IsarPostQueryLinks
    on QueryBuilder<IsarPost, IsarPost, QFilterCondition> {
  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> postingProject(
      FilterQuery<IsarProject> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'postingProject');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      postingProjectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'postingProject', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> shareTree(
      FilterQuery<IsarPost> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'shareTree');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      shareTreeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'shareTree', length, true, length, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> shareTreeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'shareTree', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      shareTreeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'shareTree', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      shareTreeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'shareTree', 0, true, length, include);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      shareTreeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'shareTree', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      shareTreeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'shareTree', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition> relatedProjects(
      FilterQuery<IsarProject> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'relatedProjects');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      relatedProjectsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'relatedProjects', length, true, length, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      relatedProjectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'relatedProjects', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      relatedProjectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'relatedProjects', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      relatedProjectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'relatedProjects', 0, true, length, include);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      relatedProjectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'relatedProjects', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterFilterCondition>
      relatedProjectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'relatedProjects', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarPostQuerySortBy on QueryBuilder<IsarPost, IsarPost, QSortBy> {
  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByCanPublish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canPublish', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByCanPublishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canPublish', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByCanShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canShare', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByCanShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canShare', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByCommentsLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentsLocked', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByCommentsLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentsLocked', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      sortByContributorBlockIncomingOrOutgoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contributorBlockIncomingOrOutgoing', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      sortByContributorBlockIncomingOrOutgoingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contributorBlockIncomingOrOutgoing', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByEffectiveAdultContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveAdultContent', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      sortByEffectiveAdultContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveAdultContent', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByFilename() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filename', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByFilenameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filename', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      sortByHasAnyContributorMuted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasAnyContributorMuted', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      sortByHasAnyContributorMutedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasAnyContributorMuted', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByHasCohostPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCohostPlus', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByHasCohostPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCohostPlus', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByHeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headline', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByHeadlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headline', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByIsEditor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEditor', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByIsEditorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEditor', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByIsLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByNumComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numComments', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByNumCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numComments', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByNumSharedComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numSharedComments', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByNumSharedCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numSharedComments', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByPinnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByPlainTextBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plainTextBody', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByPlainTextBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plainTextBody', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByPostEditUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postEditUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByPostEditUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postEditUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByPublishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByPublishedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortBySinglePostPageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singlePostPageUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortBySinglePostPageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singlePostPageUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      sortByTransparentShareOfPostId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transparentShareOfPostId', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      sortByTransparentShareOfPostIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transparentShareOfPostId', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> sortByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension IsarPostQuerySortThenBy
    on QueryBuilder<IsarPost, IsarPost, QSortThenBy> {
  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByCanPublish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canPublish', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByCanPublishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canPublish', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByCanShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canShare', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByCanShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canShare', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByCommentsLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentsLocked', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByCommentsLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentsLocked', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      thenByContributorBlockIncomingOrOutgoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contributorBlockIncomingOrOutgoing', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      thenByContributorBlockIncomingOrOutgoingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contributorBlockIncomingOrOutgoing', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByEffectiveAdultContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveAdultContent', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      thenByEffectiveAdultContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveAdultContent', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByFilename() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filename', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByFilenameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filename', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      thenByHasAnyContributorMuted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasAnyContributorMuted', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      thenByHasAnyContributorMutedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasAnyContributorMuted', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByHasCohostPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCohostPlus', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByHasCohostPlusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCohostPlus', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByHeadline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headline', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByHeadlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headline', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByIsEditor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEditor', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByIsEditorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEditor', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByIsLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByNumComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numComments', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByNumCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numComments', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByNumSharedComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numSharedComments', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByNumSharedCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numSharedComments', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByPinnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pinned', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByPlainTextBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plainTextBody', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByPlainTextBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plainTextBody', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByPostEditUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postEditUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByPostEditUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postEditUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByPublishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByPublishedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenBySinglePostPageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singlePostPageUrl', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenBySinglePostPageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singlePostPageUrl', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      thenByTransparentShareOfPostId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transparentShareOfPostId', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy>
      thenByTransparentShareOfPostIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transparentShareOfPostId', Sort.desc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.asc);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QAfterSortBy> thenByTtlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttl', Sort.desc);
    });
  }
}

extension IsarPostQueryWhereDistinct
    on QueryBuilder<IsarPost, IsarPost, QDistinct> {
  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByCanPublish() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canPublish');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByCanShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canShare');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByCommentsLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commentsLocked');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct>
      distinctByContributorBlockIncomingOrOutgoing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contributorBlockIncomingOrOutgoing');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByCws() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cws');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct>
      distinctByEffectiveAdultContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveAdultContent');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByFilename(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filename', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct>
      distinctByHasAnyContributorMuted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasAnyContributorMuted');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByHasCohostPlus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasCohostPlus');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByHeadline(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'headline', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByIsEditor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEditor');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLiked');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByNumComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numComments');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByNumSharedComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numSharedComments');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByPinned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinned');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByPlainTextBody(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plainTextBody',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByPostEditUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'postEditUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByPublishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publishedAt');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctBySinglePostPageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'singlePostPageUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct>
      distinctByTransparentShareOfPostId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transparentShareOfPostId');
    });
  }

  QueryBuilder<IsarPost, IsarPost, QDistinct> distinctByTtl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttl');
    });
  }
}

extension IsarPostQueryProperty
    on QueryBuilder<IsarPost, IsarPost, QQueryProperty> {
  QueryBuilder<IsarPost, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarPost, List<IsarEmbeddedPostBlock>?, QQueryOperations>
      blocksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blocks');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations> canPublishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canPublish');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations> canShareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canShare');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations> commentsLockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commentsLocked');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations>
      contributorBlockIncomingOrOutgoingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contributorBlockIncomingOrOutgoing');
    });
  }

  QueryBuilder<IsarPost, List<String>?, QQueryOperations> cwsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cws');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations>
      effectiveAdultContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveAdultContent');
    });
  }

  QueryBuilder<IsarPost, String?, QQueryOperations> filenameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filename');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations>
      hasAnyContributorMutedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasAnyContributorMuted');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations> hasCohostPlusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasCohostPlus');
    });
  }

  QueryBuilder<IsarPost, String?, QQueryOperations> headlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'headline');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations> isEditorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEditor');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations> isLikedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLiked');
    });
  }

  QueryBuilder<IsarPost, int?, QQueryOperations> numCommentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numComments');
    });
  }

  QueryBuilder<IsarPost, int?, QQueryOperations> numSharedCommentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numSharedComments');
    });
  }

  QueryBuilder<IsarPost, bool?, QQueryOperations> pinnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinned');
    });
  }

  QueryBuilder<IsarPost, String?, QQueryOperations> plainTextBodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plainTextBody');
    });
  }

  QueryBuilder<IsarPost, String?, QQueryOperations> postEditUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'postEditUrl');
    });
  }

  QueryBuilder<IsarPost, DateTime?, QQueryOperations> publishedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publishedAt');
    });
  }

  QueryBuilder<IsarPost, String?, QQueryOperations>
      singlePostPageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'singlePostPageUrl');
    });
  }

  QueryBuilder<IsarPost, int?, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<IsarPost, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<IsarPost, int?, QQueryOperations>
      transparentShareOfPostIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transparentShareOfPostId');
    });
  }

  QueryBuilder<IsarPost, DateTime, QQueryOperations> ttlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttl');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const IsarEmbeddedPostBlockSchema = Schema(
  name: r'IsarEmbeddedPostBlock',
  id: 601577805968937534,
  properties: {
    r'altText': PropertySchema(
      id: 0,
      name: r'altText',
      type: IsarType.string,
    ),
    r'attachmentId': PropertySchema(
      id: 1,
      name: r'attachmentId',
      type: IsarType.string,
    ),
    r'content': PropertySchema(
      id: 2,
      name: r'content',
      type: IsarType.string,
    ),
    r'fileUrl': PropertySchema(
      id: 3,
      name: r'fileUrl',
      type: IsarType.string,
    ),
    r'previewUrl': PropertySchema(
      id: 4,
      name: r'previewUrl',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.byte,
      enumMap: _IsarEmbeddedPostBlocktypeEnumValueMap,
    )
  },
  estimateSize: _isarEmbeddedPostBlockEstimateSize,
  serialize: _isarEmbeddedPostBlockSerialize,
  deserialize: _isarEmbeddedPostBlockDeserialize,
  deserializeProp: _isarEmbeddedPostBlockDeserializeProp,
);

int _isarEmbeddedPostBlockEstimateSize(
  IsarEmbeddedPostBlock object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.altText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.attachmentId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fileUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.previewUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarEmbeddedPostBlockSerialize(
  IsarEmbeddedPostBlock object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.altText);
  writer.writeString(offsets[1], object.attachmentId);
  writer.writeString(offsets[2], object.content);
  writer.writeString(offsets[3], object.fileUrl);
  writer.writeString(offsets[4], object.previewUrl);
  writer.writeByte(offsets[5], object.type.index);
}

IsarEmbeddedPostBlock _isarEmbeddedPostBlockDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarEmbeddedPostBlock(
    altText: reader.readStringOrNull(offsets[0]),
    attachmentId: reader.readStringOrNull(offsets[1]),
    content: reader.readStringOrNull(offsets[2]),
    fileUrl: reader.readStringOrNull(offsets[3]),
    previewUrl: reader.readStringOrNull(offsets[4]),
    type: _IsarEmbeddedPostBlocktypeValueEnumMap[
            reader.readByteOrNull(offsets[5])] ??
        PostBlockType.markdown,
  );
  return object;
}

P _isarEmbeddedPostBlockDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_IsarEmbeddedPostBlocktypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PostBlockType.markdown) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarEmbeddedPostBlocktypeEnumValueMap = {
  'markdown': 0,
  'attachment': 1,
};
const _IsarEmbeddedPostBlocktypeValueEnumMap = {
  0: PostBlockType.markdown,
  1: PostBlockType.attachment,
};

extension IsarEmbeddedPostBlockQueryFilter on QueryBuilder<
    IsarEmbeddedPostBlock, IsarEmbeddedPostBlock, QFilterCondition> {
  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'altText',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'altText',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'altText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'altText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'altText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'altText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'altText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'altText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      altTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'altText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      altTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'altText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'altText',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> altTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'altText',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentId',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentId',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      attachmentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      attachmentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> attachmentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileUrl',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileUrl',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      fileUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      fileUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> fileUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'previewUrl',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'previewUrl',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previewUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previewUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previewUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previewUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'previewUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'previewUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      previewUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'previewUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
          QAfterFilterCondition>
      previewUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'previewUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previewUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> previewUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'previewUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> typeEqualTo(PostBlockType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> typeGreaterThan(
    PostBlockType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> typeLessThan(
    PostBlockType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarEmbeddedPostBlock, IsarEmbeddedPostBlock,
      QAfterFilterCondition> typeBetween(
    PostBlockType lower,
    PostBlockType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarEmbeddedPostBlockQueryObject on QueryBuilder<
    IsarEmbeddedPostBlock, IsarEmbeddedPostBlock, QFilterCondition> {}
