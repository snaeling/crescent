// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $searchServiceHash() => r'a6c3008f59a6707f66c230c24ab1258bc2012f36';

/// See also [searchService].
final searchServiceProvider = Provider<SearchService>(
  searchService,
  name: r'searchServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $searchServiceHash,
);
typedef SearchServiceRef = ProviderRef<SearchService>;
String $queryHash() => r'f933bca5b31c0b490eb397854b12affea38002e8';

/// See also [query].
class QueryProvider extends AutoDisposeFutureProvider<SearchResult> {
  QueryProvider(
    this.term,
  ) : super(
          (ref) => query(
            ref,
            term,
          ),
          from: queryProvider,
          name: r'queryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : $queryHash,
        );

  final String term;

  @override
  bool operator ==(Object other) {
    return other is QueryProvider && other.term == term;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, term.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef QueryRef = AutoDisposeFutureProviderRef<SearchResult>;

/// See also [query].
final queryProvider = QueryFamily();

class QueryFamily extends Family<AsyncValue<SearchResult>> {
  QueryFamily();

  QueryProvider call(
    String term,
  ) {
    return QueryProvider(
      term,
    );
  }

  @override
  AutoDisposeFutureProvider<SearchResult> getProviderOverride(
    covariant QueryProvider provider,
  ) {
    return call(
      provider.term,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'queryProvider';
}
