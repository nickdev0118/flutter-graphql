import 'package:gql/ast.dart';

class Query$getAllCountries {
  Query$getAllCountries({
    this.countries,
    this.$__typename = 'Query',
  });

  factory Query$getAllCountries.fromJson(Map<String, dynamic> json) {
    final l$countries = json['countries'];
    final l$$__typename = json['__typename'];
    return Query$getAllCountries(
      countries: l$countries == null
          ? null
          : Query$getAllCountries$countries.fromJson(
              (l$countries as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getAllCountries$countries? countries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$countries = countries;
    _resultData['countries'] = l$countries?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$countries = countries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$countries,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAllCountries) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$countries = countries;
    final lOther$countries = other.countries;
    if (l$countries != lOther$countries) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getAllCountries on Query$getAllCountries {
  CopyWith$Query$getAllCountries<Query$getAllCountries> get copyWith =>
      CopyWith$Query$getAllCountries(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getAllCountries<TRes> {
  factory CopyWith$Query$getAllCountries(
    Query$getAllCountries instance,
    TRes Function(Query$getAllCountries) then,
  ) = _CopyWithImpl$Query$getAllCountries;

  factory CopyWith$Query$getAllCountries.stub(TRes res) =
      _CopyWithStubImpl$Query$getAllCountries;

  TRes call({
    Query$getAllCountries$countries? countries,
    String? $__typename,
  });
  CopyWith$Query$getAllCountries$countries<TRes> get countries;
}

class _CopyWithImpl$Query$getAllCountries<TRes>
    implements CopyWith$Query$getAllCountries<TRes> {
  _CopyWithImpl$Query$getAllCountries(
    this._instance,
    this._then,
  );

  final Query$getAllCountries _instance;

  final TRes Function(Query$getAllCountries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? countries = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAllCountries(
        countries: countries == _undefined
            ? _instance.countries
            : (countries as Query$getAllCountries$countries?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getAllCountries$countries<TRes> get countries {
    final local$countries = _instance.countries;
    return local$countries == null
        ? CopyWith$Query$getAllCountries$countries.stub(_then(_instance))
        : CopyWith$Query$getAllCountries$countries(
            local$countries, (e) => call(countries: e));
  }
}

class _CopyWithStubImpl$Query$getAllCountries<TRes>
    implements CopyWith$Query$getAllCountries<TRes> {
  _CopyWithStubImpl$Query$getAllCountries(this._res);

  TRes _res;

  call({
    Query$getAllCountries$countries? countries,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getAllCountries$countries<TRes> get countries =>
      CopyWith$Query$getAllCountries$countries.stub(_res);
}

const documentNodeQuerygetAllCountries = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getAllCountries'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'countries'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'capital'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Query$getAllCountries$countries {
  Query$getAllCountries$countries({
    this.name,
    this.capital,
    this.$__typename = 'Country',
  });

  factory Query$getAllCountries$countries.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$capital = json['capital'];
    final l$$__typename = json['__typename'];
    return Query$getAllCountries$countries(
      name: (l$name as String?),
      capital: (l$capital as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? name;

  final String? capital;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$capital = capital;
    _resultData['capital'] = l$capital;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$capital = capital;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$capital,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAllCountries$countries) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$capital = capital;
    final lOther$capital = other.capital;
    if (l$capital != lOther$capital) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getAllCountries$countries
    on Query$getAllCountries$countries {
  CopyWith$Query$getAllCountries$countries<Query$getAllCountries$countries>
      get copyWith => CopyWith$Query$getAllCountries$countries(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAllCountries$countries<TRes> {
  factory CopyWith$Query$getAllCountries$countries(
    Query$getAllCountries$countries instance,
    TRes Function(Query$getAllCountries$countries) then,
  ) = _CopyWithImpl$Query$getAllCountries$countries;

  factory CopyWith$Query$getAllCountries$countries.stub(TRes res) =
      _CopyWithStubImpl$Query$getAllCountries$countries;

  TRes call({
    String? name,
    String? capital,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getAllCountries$countries<TRes>
    implements CopyWith$Query$getAllCountries$countries<TRes> {
  _CopyWithImpl$Query$getAllCountries$countries(
    this._instance,
    this._then,
  );

  final Query$getAllCountries$countries _instance;

  final TRes Function(Query$getAllCountries$countries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? capital = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAllCountries$countries(
        name: name == _undefined ? _instance.name : (name as String?),
        capital:
            capital == _undefined ? _instance.capital : (capital as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getAllCountries$countries<TRes>
    implements CopyWith$Query$getAllCountries$countries<TRes> {
  _CopyWithStubImpl$Query$getAllCountries$countries(this._res);

  TRes _res;

  call({
    String? name,
    String? capital,
    String? $__typename,
  }) =>
      _res;
}
