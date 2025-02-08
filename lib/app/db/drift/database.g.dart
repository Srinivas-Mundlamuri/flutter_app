// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CartItemTblTable extends CartItemTbl
    with TableInfo<$CartItemTblTable, CartItemTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _featuredImageMeta =
      const VerificationMeta('featuredImage');
  @override
  late final GeneratedColumn<String> featuredImage = GeneratedColumn<String>(
      'featured_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, price, description, featuredImage, createdAt, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_item_tbl';
  @override
  VerificationContext validateIntegrity(Insertable<CartItemTblData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('featured_image')) {
      context.handle(
          _featuredImageMeta,
          featuredImage.isAcceptableOrUnknown(
              data['featured_image']!, _featuredImageMeta));
    } else if (isInserting) {
      context.missing(_featuredImageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartItemTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartItemTblData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      featuredImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}featured_image'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $CartItemTblTable createAlias(String alias) {
    return $CartItemTblTable(attachedDatabase, alias);
  }
}

class CartItemTblData extends DataClass implements Insertable<CartItemTblData> {
  final int id;
  final String title;
  final double price;
  final String description;
  final String featuredImage;
  final DateTime createdAt;
  final int quantity;
  const CartItemTblData(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.featuredImage,
      required this.createdAt,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['price'] = Variable<double>(price);
    map['description'] = Variable<String>(description);
    map['featured_image'] = Variable<String>(featuredImage);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  CartItemTblCompanion toCompanion(bool nullToAbsent) {
    return CartItemTblCompanion(
      id: Value(id),
      title: Value(title),
      price: Value(price),
      description: Value(description),
      featuredImage: Value(featuredImage),
      createdAt: Value(createdAt),
      quantity: Value(quantity),
    );
  }

  factory CartItemTblData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartItemTblData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<double>(json['price']),
      description: serializer.fromJson<String>(json['description']),
      featuredImage: serializer.fromJson<String>(json['featuredImage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<double>(price),
      'description': serializer.toJson<String>(description),
      'featuredImage': serializer.toJson<String>(featuredImage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  CartItemTblData copyWith(
          {int? id,
          String? title,
          double? price,
          String? description,
          String? featuredImage,
          DateTime? createdAt,
          int? quantity}) =>
      CartItemTblData(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        featuredImage: featuredImage ?? this.featuredImage,
        createdAt: createdAt ?? this.createdAt,
        quantity: quantity ?? this.quantity,
      );
  CartItemTblData copyWithCompanion(CartItemTblCompanion data) {
    return CartItemTblData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      price: data.price.present ? data.price.value : this.price,
      description:
          data.description.present ? data.description.value : this.description,
      featuredImage: data.featuredImage.present
          ? data.featuredImage.value
          : this.featuredImage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartItemTblData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('featuredImage: $featuredImage, ')
          ..write('createdAt: $createdAt, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, price, description, featuredImage, createdAt, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItemTblData &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price &&
          other.description == this.description &&
          other.featuredImage == this.featuredImage &&
          other.createdAt == this.createdAt &&
          other.quantity == this.quantity);
}

class CartItemTblCompanion extends UpdateCompanion<CartItemTblData> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> price;
  final Value<String> description;
  final Value<String> featuredImage;
  final Value<DateTime> createdAt;
  final Value<int> quantity;
  const CartItemTblCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.description = const Value.absent(),
    this.featuredImage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  CartItemTblCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double price,
    required String description,
    required String featuredImage,
    required DateTime createdAt,
    this.quantity = const Value.absent(),
  })  : title = Value(title),
        price = Value(price),
        description = Value(description),
        featuredImage = Value(featuredImage),
        createdAt = Value(createdAt);
  static Insertable<CartItemTblData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? price,
    Expression<String>? description,
    Expression<String>? featuredImage,
    Expression<DateTime>? createdAt,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (featuredImage != null) 'featured_image': featuredImage,
      if (createdAt != null) 'created_at': createdAt,
      if (quantity != null) 'quantity': quantity,
    });
  }

  CartItemTblCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? price,
      Value<String>? description,
      Value<String>? featuredImage,
      Value<DateTime>? createdAt,
      Value<int>? quantity}) {
    return CartItemTblCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      featuredImage: featuredImage ?? this.featuredImage,
      createdAt: createdAt ?? this.createdAt,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (featuredImage.present) {
      map['featured_image'] = Variable<String>(featuredImage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemTblCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('featuredImage: $featuredImage, ')
          ..write('createdAt: $createdAt, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $FavoritesItemTblTable extends FavoritesItemTbl
    with TableInfo<$FavoritesItemTblTable, FavoritesItemTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesItemTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _featuredImageMeta =
      const VerificationMeta('featuredImage');
  @override
  late final GeneratedColumn<String> featuredImage = GeneratedColumn<String>(
      'featured_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, price, description, featuredImage, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites_item_tbl';
  @override
  VerificationContext validateIntegrity(
      Insertable<FavoritesItemTblData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('featured_image')) {
      context.handle(
          _featuredImageMeta,
          featuredImage.isAcceptableOrUnknown(
              data['featured_image']!, _featuredImageMeta));
    } else if (isInserting) {
      context.missing(_featuredImageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoritesItemTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritesItemTblData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      featuredImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}featured_image'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $FavoritesItemTblTable createAlias(String alias) {
    return $FavoritesItemTblTable(attachedDatabase, alias);
  }
}

class FavoritesItemTblData extends DataClass
    implements Insertable<FavoritesItemTblData> {
  final int id;
  final String title;
  final double price;
  final String description;
  final String featuredImage;
  final DateTime createdAt;
  const FavoritesItemTblData(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.featuredImage,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['price'] = Variable<double>(price);
    map['description'] = Variable<String>(description);
    map['featured_image'] = Variable<String>(featuredImage);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoritesItemTblCompanion toCompanion(bool nullToAbsent) {
    return FavoritesItemTblCompanion(
      id: Value(id),
      title: Value(title),
      price: Value(price),
      description: Value(description),
      featuredImage: Value(featuredImage),
      createdAt: Value(createdAt),
    );
  }

  factory FavoritesItemTblData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritesItemTblData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<double>(json['price']),
      description: serializer.fromJson<String>(json['description']),
      featuredImage: serializer.fromJson<String>(json['featuredImage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<double>(price),
      'description': serializer.toJson<String>(description),
      'featuredImage': serializer.toJson<String>(featuredImage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavoritesItemTblData copyWith(
          {int? id,
          String? title,
          double? price,
          String? description,
          String? featuredImage,
          DateTime? createdAt}) =>
      FavoritesItemTblData(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        featuredImage: featuredImage ?? this.featuredImage,
        createdAt: createdAt ?? this.createdAt,
      );
  FavoritesItemTblData copyWithCompanion(FavoritesItemTblCompanion data) {
    return FavoritesItemTblData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      price: data.price.present ? data.price.value : this.price,
      description:
          data.description.present ? data.description.value : this.description,
      featuredImage: data.featuredImage.present
          ? data.featuredImage.value
          : this.featuredImage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesItemTblData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('featuredImage: $featuredImage, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, price, description, featuredImage, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritesItemTblData &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price &&
          other.description == this.description &&
          other.featuredImage == this.featuredImage &&
          other.createdAt == this.createdAt);
}

class FavoritesItemTblCompanion extends UpdateCompanion<FavoritesItemTblData> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> price;
  final Value<String> description;
  final Value<String> featuredImage;
  final Value<DateTime> createdAt;
  const FavoritesItemTblCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.description = const Value.absent(),
    this.featuredImage = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoritesItemTblCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double price,
    required String description,
    required String featuredImage,
    required DateTime createdAt,
  })  : title = Value(title),
        price = Value(price),
        description = Value(description),
        featuredImage = Value(featuredImage),
        createdAt = Value(createdAt);
  static Insertable<FavoritesItemTblData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? price,
    Expression<String>? description,
    Expression<String>? featuredImage,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (featuredImage != null) 'featured_image': featuredImage,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoritesItemTblCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? price,
      Value<String>? description,
      Value<String>? featuredImage,
      Value<DateTime>? createdAt}) {
    return FavoritesItemTblCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      featuredImage: featuredImage ?? this.featuredImage,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (featuredImage.present) {
      map['featured_image'] = Variable<String>(featuredImage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesItemTblCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('featuredImage: $featuredImage, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CartItemTblTable cartItemTbl = $CartItemTblTable(this);
  late final $FavoritesItemTblTable favoritesItemTbl =
      $FavoritesItemTblTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cartItemTbl, favoritesItemTbl];
}

typedef $$CartItemTblTableCreateCompanionBuilder = CartItemTblCompanion
    Function({
  Value<int> id,
  required String title,
  required double price,
  required String description,
  required String featuredImage,
  required DateTime createdAt,
  Value<int> quantity,
});
typedef $$CartItemTblTableUpdateCompanionBuilder = CartItemTblCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<double> price,
  Value<String> description,
  Value<String> featuredImage,
  Value<DateTime> createdAt,
  Value<int> quantity,
});

class $$CartItemTblTableFilterComposer
    extends Composer<_$AppDatabase, $CartItemTblTable> {
  $$CartItemTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get featuredImage => $composableBuilder(
      column: $table.featuredImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));
}

class $$CartItemTblTableOrderingComposer
    extends Composer<_$AppDatabase, $CartItemTblTable> {
  $$CartItemTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get featuredImage => $composableBuilder(
      column: $table.featuredImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));
}

class $$CartItemTblTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartItemTblTable> {
  $$CartItemTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get featuredImage => $composableBuilder(
      column: $table.featuredImage, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);
}

class $$CartItemTblTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CartItemTblTable,
    CartItemTblData,
    $$CartItemTblTableFilterComposer,
    $$CartItemTblTableOrderingComposer,
    $$CartItemTblTableAnnotationComposer,
    $$CartItemTblTableCreateCompanionBuilder,
    $$CartItemTblTableUpdateCompanionBuilder,
    (
      CartItemTblData,
      BaseReferences<_$AppDatabase, $CartItemTblTable, CartItemTblData>
    ),
    CartItemTblData,
    PrefetchHooks Function()> {
  $$CartItemTblTableTableManager(_$AppDatabase db, $CartItemTblTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartItemTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartItemTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartItemTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> featuredImage = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> quantity = const Value.absent(),
          }) =>
              CartItemTblCompanion(
            id: id,
            title: title,
            price: price,
            description: description,
            featuredImage: featuredImage,
            createdAt: createdAt,
            quantity: quantity,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required double price,
            required String description,
            required String featuredImage,
            required DateTime createdAt,
            Value<int> quantity = const Value.absent(),
          }) =>
              CartItemTblCompanion.insert(
            id: id,
            title: title,
            price: price,
            description: description,
            featuredImage: featuredImage,
            createdAt: createdAt,
            quantity: quantity,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CartItemTblTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CartItemTblTable,
    CartItemTblData,
    $$CartItemTblTableFilterComposer,
    $$CartItemTblTableOrderingComposer,
    $$CartItemTblTableAnnotationComposer,
    $$CartItemTblTableCreateCompanionBuilder,
    $$CartItemTblTableUpdateCompanionBuilder,
    (
      CartItemTblData,
      BaseReferences<_$AppDatabase, $CartItemTblTable, CartItemTblData>
    ),
    CartItemTblData,
    PrefetchHooks Function()>;
typedef $$FavoritesItemTblTableCreateCompanionBuilder
    = FavoritesItemTblCompanion Function({
  Value<int> id,
  required String title,
  required double price,
  required String description,
  required String featuredImage,
  required DateTime createdAt,
});
typedef $$FavoritesItemTblTableUpdateCompanionBuilder
    = FavoritesItemTblCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<double> price,
  Value<String> description,
  Value<String> featuredImage,
  Value<DateTime> createdAt,
});

class $$FavoritesItemTblTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesItemTblTable> {
  $$FavoritesItemTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get featuredImage => $composableBuilder(
      column: $table.featuredImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$FavoritesItemTblTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesItemTblTable> {
  $$FavoritesItemTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get featuredImage => $composableBuilder(
      column: $table.featuredImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$FavoritesItemTblTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesItemTblTable> {
  $$FavoritesItemTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get featuredImage => $composableBuilder(
      column: $table.featuredImage, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoritesItemTblTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoritesItemTblTable,
    FavoritesItemTblData,
    $$FavoritesItemTblTableFilterComposer,
    $$FavoritesItemTblTableOrderingComposer,
    $$FavoritesItemTblTableAnnotationComposer,
    $$FavoritesItemTblTableCreateCompanionBuilder,
    $$FavoritesItemTblTableUpdateCompanionBuilder,
    (
      FavoritesItemTblData,
      BaseReferences<_$AppDatabase, $FavoritesItemTblTable,
          FavoritesItemTblData>
    ),
    FavoritesItemTblData,
    PrefetchHooks Function()> {
  $$FavoritesItemTblTableTableManager(
      _$AppDatabase db, $FavoritesItemTblTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesItemTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesItemTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesItemTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> featuredImage = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              FavoritesItemTblCompanion(
            id: id,
            title: title,
            price: price,
            description: description,
            featuredImage: featuredImage,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required double price,
            required String description,
            required String featuredImage,
            required DateTime createdAt,
          }) =>
              FavoritesItemTblCompanion.insert(
            id: id,
            title: title,
            price: price,
            description: description,
            featuredImage: featuredImage,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoritesItemTblTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoritesItemTblTable,
    FavoritesItemTblData,
    $$FavoritesItemTblTableFilterComposer,
    $$FavoritesItemTblTableOrderingComposer,
    $$FavoritesItemTblTableAnnotationComposer,
    $$FavoritesItemTblTableCreateCompanionBuilder,
    $$FavoritesItemTblTableUpdateCompanionBuilder,
    (
      FavoritesItemTblData,
      BaseReferences<_$AppDatabase, $FavoritesItemTblTable,
          FavoritesItemTblData>
    ),
    FavoritesItemTblData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CartItemTblTableTableManager get cartItemTbl =>
      $$CartItemTblTableTableManager(_db, _db.cartItemTbl);
  $$FavoritesItemTblTableTableManager get favoritesItemTbl =>
      $$FavoritesItemTblTableTableManager(_db, _db.favoritesItemTbl);
}
