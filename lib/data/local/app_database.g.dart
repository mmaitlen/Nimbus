// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, LocationEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _zipcodeMeta = const VerificationMeta(
    'zipcode',
  );
  @override
  late final GeneratedColumn<String> zipcode = GeneratedColumn<String>(
    'zipcode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _cityNameMeta = const VerificationMeta(
    'cityName',
  );
  @override
  late final GeneratedColumn<String> cityName = GeneratedColumn<String>(
    'city_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stateNameMeta = const VerificationMeta(
    'stateName',
  );
  @override
  late final GeneratedColumn<String> stateName = GeneratedColumn<String>(
    'state_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    zipcode,
    cityName,
    stateName,
    latitude,
    longitude,
    isDefault,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('zipcode')) {
      context.handle(
        _zipcodeMeta,
        zipcode.isAcceptableOrUnknown(data['zipcode']!, _zipcodeMeta),
      );
    } else if (isInserting) {
      context.missing(_zipcodeMeta);
    }
    if (data.containsKey('city_name')) {
      context.handle(
        _cityNameMeta,
        cityName.isAcceptableOrUnknown(data['city_name']!, _cityNameMeta),
      );
    } else if (isInserting) {
      context.missing(_cityNameMeta);
    }
    if (data.containsKey('state_name')) {
      context.handle(
        _stateNameMeta,
        stateName.isAcceptableOrUnknown(data['state_name']!, _stateNameMeta),
      );
    } else if (isInserting) {
      context.missing(_stateNameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      zipcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zipcode'],
      )!,
      cityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_name'],
      )!,
      stateName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_name'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
    );
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(attachedDatabase, alias);
  }
}

class LocationEntry extends DataClass implements Insertable<LocationEntry> {
  final int id;
  final String zipcode;
  final String cityName;
  final String stateName;
  final double latitude;
  final double longitude;
  final bool isDefault;
  const LocationEntry({
    required this.id,
    required this.zipcode,
    required this.cityName,
    required this.stateName,
    required this.latitude,
    required this.longitude,
    required this.isDefault,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['zipcode'] = Variable<String>(zipcode);
    map['city_name'] = Variable<String>(cityName);
    map['state_name'] = Variable<String>(stateName);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['is_default'] = Variable<bool>(isDefault);
    return map;
  }

  LocationsCompanion toCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      id: Value(id),
      zipcode: Value(zipcode),
      cityName: Value(cityName),
      stateName: Value(stateName),
      latitude: Value(latitude),
      longitude: Value(longitude),
      isDefault: Value(isDefault),
    );
  }

  factory LocationEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationEntry(
      id: serializer.fromJson<int>(json['id']),
      zipcode: serializer.fromJson<String>(json['zipcode']),
      cityName: serializer.fromJson<String>(json['cityName']),
      stateName: serializer.fromJson<String>(json['stateName']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'zipcode': serializer.toJson<String>(zipcode),
      'cityName': serializer.toJson<String>(cityName),
      'stateName': serializer.toJson<String>(stateName),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'isDefault': serializer.toJson<bool>(isDefault),
    };
  }

  LocationEntry copyWith({
    int? id,
    String? zipcode,
    String? cityName,
    String? stateName,
    double? latitude,
    double? longitude,
    bool? isDefault,
  }) => LocationEntry(
    id: id ?? this.id,
    zipcode: zipcode ?? this.zipcode,
    cityName: cityName ?? this.cityName,
    stateName: stateName ?? this.stateName,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    isDefault: isDefault ?? this.isDefault,
  );
  LocationEntry copyWithCompanion(LocationsCompanion data) {
    return LocationEntry(
      id: data.id.present ? data.id.value : this.id,
      zipcode: data.zipcode.present ? data.zipcode.value : this.zipcode,
      cityName: data.cityName.present ? data.cityName.value : this.cityName,
      stateName: data.stateName.present ? data.stateName.value : this.stateName,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationEntry(')
          ..write('id: $id, ')
          ..write('zipcode: $zipcode, ')
          ..write('cityName: $cityName, ')
          ..write('stateName: $stateName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    zipcode,
    cityName,
    stateName,
    latitude,
    longitude,
    isDefault,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationEntry &&
          other.id == this.id &&
          other.zipcode == this.zipcode &&
          other.cityName == this.cityName &&
          other.stateName == this.stateName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.isDefault == this.isDefault);
}

class LocationsCompanion extends UpdateCompanion<LocationEntry> {
  final Value<int> id;
  final Value<String> zipcode;
  final Value<String> cityName;
  final Value<String> stateName;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<bool> isDefault;
  const LocationsCompanion({
    this.id = const Value.absent(),
    this.zipcode = const Value.absent(),
    this.cityName = const Value.absent(),
    this.stateName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.isDefault = const Value.absent(),
  });
  LocationsCompanion.insert({
    this.id = const Value.absent(),
    required String zipcode,
    required String cityName,
    required String stateName,
    required double latitude,
    required double longitude,
    this.isDefault = const Value.absent(),
  }) : zipcode = Value(zipcode),
       cityName = Value(cityName),
       stateName = Value(stateName),
       latitude = Value(latitude),
       longitude = Value(longitude);
  static Insertable<LocationEntry> custom({
    Expression<int>? id,
    Expression<String>? zipcode,
    Expression<String>? cityName,
    Expression<String>? stateName,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<bool>? isDefault,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (zipcode != null) 'zipcode': zipcode,
      if (cityName != null) 'city_name': cityName,
      if (stateName != null) 'state_name': stateName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (isDefault != null) 'is_default': isDefault,
    });
  }

  LocationsCompanion copyWith({
    Value<int>? id,
    Value<String>? zipcode,
    Value<String>? cityName,
    Value<String>? stateName,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<bool>? isDefault,
  }) {
    return LocationsCompanion(
      id: id ?? this.id,
      zipcode: zipcode ?? this.zipcode,
      cityName: cityName ?? this.cityName,
      stateName: stateName ?? this.stateName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (zipcode.present) {
      map['zipcode'] = Variable<String>(zipcode.value);
    }
    if (cityName.present) {
      map['city_name'] = Variable<String>(cityName.value);
    }
    if (stateName.present) {
      map['state_name'] = Variable<String>(stateName.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCompanion(')
          ..write('id: $id, ')
          ..write('zipcode: $zipcode, ')
          ..write('cityName: $cityName, ')
          ..write('stateName: $stateName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }
}

class $CachedWeatherTable extends CachedWeather
    with TableInfo<$CachedWeatherTable, CachedWeatherEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedWeatherTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
    'location_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES locations (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temperatureMeta = const VerificationMeta(
    'temperature',
  );
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
    'temperature',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windSpeedMeta = const VerificationMeta(
    'windSpeed',
  );
  @override
  late final GeneratedColumn<double> windSpeed = GeneratedColumn<double>(
    'wind_speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weatherIconUrlMeta = const VerificationMeta(
    'weatherIconUrl',
  );
  @override
  late final GeneratedColumn<String> weatherIconUrl = GeneratedColumn<String>(
    'weather_icon_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    locationId,
    description,
    temperature,
    windSpeed,
    weatherIconUrl,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_weather';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedWeatherEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
        _temperatureMeta,
        temperature.isAcceptableOrUnknown(
          data['temperature']!,
          _temperatureMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('wind_speed')) {
      context.handle(
        _windSpeedMeta,
        windSpeed.isAcceptableOrUnknown(data['wind_speed']!, _windSpeedMeta),
      );
    } else if (isInserting) {
      context.missing(_windSpeedMeta);
    }
    if (data.containsKey('weather_icon_url')) {
      context.handle(
        _weatherIconUrlMeta,
        weatherIconUrl.isAcceptableOrUnknown(
          data['weather_icon_url']!,
          _weatherIconUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weatherIconUrlMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedWeatherEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedWeatherEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}location_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      temperature: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temperature'],
      )!,
      windSpeed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wind_speed'],
      )!,
      weatherIconUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weather_icon_url'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $CachedWeatherTable createAlias(String alias) {
    return $CachedWeatherTable(attachedDatabase, alias);
  }
}

class CachedWeatherEntry extends DataClass
    implements Insertable<CachedWeatherEntry> {
  final int id;
  final int locationId;
  final String description;
  final double temperature;
  final double windSpeed;
  final String weatherIconUrl;
  final DateTime timestamp;
  const CachedWeatherEntry({
    required this.id,
    required this.locationId,
    required this.description,
    required this.temperature,
    required this.windSpeed,
    required this.weatherIconUrl,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location_id'] = Variable<int>(locationId);
    map['description'] = Variable<String>(description);
    map['temperature'] = Variable<double>(temperature);
    map['wind_speed'] = Variable<double>(windSpeed);
    map['weather_icon_url'] = Variable<String>(weatherIconUrl);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  CachedWeatherCompanion toCompanion(bool nullToAbsent) {
    return CachedWeatherCompanion(
      id: Value(id),
      locationId: Value(locationId),
      description: Value(description),
      temperature: Value(temperature),
      windSpeed: Value(windSpeed),
      weatherIconUrl: Value(weatherIconUrl),
      timestamp: Value(timestamp),
    );
  }

  factory CachedWeatherEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedWeatherEntry(
      id: serializer.fromJson<int>(json['id']),
      locationId: serializer.fromJson<int>(json['locationId']),
      description: serializer.fromJson<String>(json['description']),
      temperature: serializer.fromJson<double>(json['temperature']),
      windSpeed: serializer.fromJson<double>(json['windSpeed']),
      weatherIconUrl: serializer.fromJson<String>(json['weatherIconUrl']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'locationId': serializer.toJson<int>(locationId),
      'description': serializer.toJson<String>(description),
      'temperature': serializer.toJson<double>(temperature),
      'windSpeed': serializer.toJson<double>(windSpeed),
      'weatherIconUrl': serializer.toJson<String>(weatherIconUrl),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  CachedWeatherEntry copyWith({
    int? id,
    int? locationId,
    String? description,
    double? temperature,
    double? windSpeed,
    String? weatherIconUrl,
    DateTime? timestamp,
  }) => CachedWeatherEntry(
    id: id ?? this.id,
    locationId: locationId ?? this.locationId,
    description: description ?? this.description,
    temperature: temperature ?? this.temperature,
    windSpeed: windSpeed ?? this.windSpeed,
    weatherIconUrl: weatherIconUrl ?? this.weatherIconUrl,
    timestamp: timestamp ?? this.timestamp,
  );
  CachedWeatherEntry copyWithCompanion(CachedWeatherCompanion data) {
    return CachedWeatherEntry(
      id: data.id.present ? data.id.value : this.id,
      locationId: data.locationId.present
          ? data.locationId.value
          : this.locationId,
      description: data.description.present
          ? data.description.value
          : this.description,
      temperature: data.temperature.present
          ? data.temperature.value
          : this.temperature,
      windSpeed: data.windSpeed.present ? data.windSpeed.value : this.windSpeed,
      weatherIconUrl: data.weatherIconUrl.present
          ? data.weatherIconUrl.value
          : this.weatherIconUrl,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedWeatherEntry(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('description: $description, ')
          ..write('temperature: $temperature, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('weatherIconUrl: $weatherIconUrl, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    locationId,
    description,
    temperature,
    windSpeed,
    weatherIconUrl,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedWeatherEntry &&
          other.id == this.id &&
          other.locationId == this.locationId &&
          other.description == this.description &&
          other.temperature == this.temperature &&
          other.windSpeed == this.windSpeed &&
          other.weatherIconUrl == this.weatherIconUrl &&
          other.timestamp == this.timestamp);
}

class CachedWeatherCompanion extends UpdateCompanion<CachedWeatherEntry> {
  final Value<int> id;
  final Value<int> locationId;
  final Value<String> description;
  final Value<double> temperature;
  final Value<double> windSpeed;
  final Value<String> weatherIconUrl;
  final Value<DateTime> timestamp;
  const CachedWeatherCompanion({
    this.id = const Value.absent(),
    this.locationId = const Value.absent(),
    this.description = const Value.absent(),
    this.temperature = const Value.absent(),
    this.windSpeed = const Value.absent(),
    this.weatherIconUrl = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  CachedWeatherCompanion.insert({
    this.id = const Value.absent(),
    required int locationId,
    required String description,
    required double temperature,
    required double windSpeed,
    required String weatherIconUrl,
    required DateTime timestamp,
  }) : locationId = Value(locationId),
       description = Value(description),
       temperature = Value(temperature),
       windSpeed = Value(windSpeed),
       weatherIconUrl = Value(weatherIconUrl),
       timestamp = Value(timestamp);
  static Insertable<CachedWeatherEntry> custom({
    Expression<int>? id,
    Expression<int>? locationId,
    Expression<String>? description,
    Expression<double>? temperature,
    Expression<double>? windSpeed,
    Expression<String>? weatherIconUrl,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locationId != null) 'location_id': locationId,
      if (description != null) 'description': description,
      if (temperature != null) 'temperature': temperature,
      if (windSpeed != null) 'wind_speed': windSpeed,
      if (weatherIconUrl != null) 'weather_icon_url': weatherIconUrl,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  CachedWeatherCompanion copyWith({
    Value<int>? id,
    Value<int>? locationId,
    Value<String>? description,
    Value<double>? temperature,
    Value<double>? windSpeed,
    Value<String>? weatherIconUrl,
    Value<DateTime>? timestamp,
  }) {
    return CachedWeatherCompanion(
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      description: description ?? this.description,
      temperature: temperature ?? this.temperature,
      windSpeed: windSpeed ?? this.windSpeed,
      weatherIconUrl: weatherIconUrl ?? this.weatherIconUrl,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (windSpeed.present) {
      map['wind_speed'] = Variable<double>(windSpeed.value);
    }
    if (weatherIconUrl.present) {
      map['weather_icon_url'] = Variable<String>(weatherIconUrl.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedWeatherCompanion(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('description: $description, ')
          ..write('temperature: $temperature, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('weatherIconUrl: $weatherIconUrl, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SettingEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingEntry(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingEntry extends DataClass implements Insertable<SettingEntry> {
  final String key;
  final String value;
  const SettingEntry({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory SettingEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingEntry(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SettingEntry copyWith({String? key, String? value}) =>
      SettingEntry(key: key ?? this.key, value: value ?? this.value);
  SettingEntry copyWithCompanion(SettingsCompanion data) {
    return SettingEntry(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingEntry(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingEntry &&
          other.key == this.key &&
          other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<SettingEntry> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<SettingEntry> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppErrorsTable extends AppErrors
    with TableInfo<$AppErrorsTable, AppErrorEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppErrorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apiEndpointMeta = const VerificationMeta(
    'apiEndpoint',
  );
  @override
  late final GeneratedColumn<String> apiEndpoint = GeneratedColumn<String>(
    'api_endpoint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusCodeMeta = const VerificationMeta(
    'statusCode',
  );
  @override
  late final GeneratedColumn<int> statusCode = GeneratedColumn<int>(
    'status_code',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationIdentifierMeta =
      const VerificationMeta('locationIdentifier');
  @override
  late final GeneratedColumn<String> locationIdentifier =
      GeneratedColumn<String>(
        'location_identifier',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _requestParametersMeta = const VerificationMeta(
    'requestParameters',
  );
  @override
  late final GeneratedColumn<String> requestParameters =
      GeneratedColumn<String>(
        'request_parameters',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    timestamp,
    apiEndpoint,
    statusCode,
    errorMessage,
    locationIdentifier,
    requestParameters,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_errors';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppErrorEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('api_endpoint')) {
      context.handle(
        _apiEndpointMeta,
        apiEndpoint.isAcceptableOrUnknown(
          data['api_endpoint']!,
          _apiEndpointMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_apiEndpointMeta);
    }
    if (data.containsKey('status_code')) {
      context.handle(
        _statusCodeMeta,
        statusCode.isAcceptableOrUnknown(data['status_code']!, _statusCodeMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_errorMessageMeta);
    }
    if (data.containsKey('location_identifier')) {
      context.handle(
        _locationIdentifierMeta,
        locationIdentifier.isAcceptableOrUnknown(
          data['location_identifier']!,
          _locationIdentifierMeta,
        ),
      );
    }
    if (data.containsKey('request_parameters')) {
      context.handle(
        _requestParametersMeta,
        requestParameters.isAcceptableOrUnknown(
          data['request_parameters']!,
          _requestParametersMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppErrorEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppErrorEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      apiEndpoint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}api_endpoint'],
      )!,
      statusCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_code'],
      ),
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      )!,
      locationIdentifier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_identifier'],
      ),
      requestParameters: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_parameters'],
      ),
    );
  }

  @override
  $AppErrorsTable createAlias(String alias) {
    return $AppErrorsTable(attachedDatabase, alias);
  }
}

class AppErrorEntry extends DataClass implements Insertable<AppErrorEntry> {
  final int id;
  final DateTime timestamp;
  final String apiEndpoint;
  final int? statusCode;
  final String errorMessage;
  final String? locationIdentifier;
  final String? requestParameters;
  const AppErrorEntry({
    required this.id,
    required this.timestamp,
    required this.apiEndpoint,
    this.statusCode,
    required this.errorMessage,
    this.locationIdentifier,
    this.requestParameters,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['api_endpoint'] = Variable<String>(apiEndpoint);
    if (!nullToAbsent || statusCode != null) {
      map['status_code'] = Variable<int>(statusCode);
    }
    map['error_message'] = Variable<String>(errorMessage);
    if (!nullToAbsent || locationIdentifier != null) {
      map['location_identifier'] = Variable<String>(locationIdentifier);
    }
    if (!nullToAbsent || requestParameters != null) {
      map['request_parameters'] = Variable<String>(requestParameters);
    }
    return map;
  }

  AppErrorsCompanion toCompanion(bool nullToAbsent) {
    return AppErrorsCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      apiEndpoint: Value(apiEndpoint),
      statusCode: statusCode == null && nullToAbsent
          ? const Value.absent()
          : Value(statusCode),
      errorMessage: Value(errorMessage),
      locationIdentifier: locationIdentifier == null && nullToAbsent
          ? const Value.absent()
          : Value(locationIdentifier),
      requestParameters: requestParameters == null && nullToAbsent
          ? const Value.absent()
          : Value(requestParameters),
    );
  }

  factory AppErrorEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppErrorEntry(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      apiEndpoint: serializer.fromJson<String>(json['apiEndpoint']),
      statusCode: serializer.fromJson<int?>(json['statusCode']),
      errorMessage: serializer.fromJson<String>(json['errorMessage']),
      locationIdentifier: serializer.fromJson<String?>(
        json['locationIdentifier'],
      ),
      requestParameters: serializer.fromJson<String?>(
        json['requestParameters'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'apiEndpoint': serializer.toJson<String>(apiEndpoint),
      'statusCode': serializer.toJson<int?>(statusCode),
      'errorMessage': serializer.toJson<String>(errorMessage),
      'locationIdentifier': serializer.toJson<String?>(locationIdentifier),
      'requestParameters': serializer.toJson<String?>(requestParameters),
    };
  }

  AppErrorEntry copyWith({
    int? id,
    DateTime? timestamp,
    String? apiEndpoint,
    Value<int?> statusCode = const Value.absent(),
    String? errorMessage,
    Value<String?> locationIdentifier = const Value.absent(),
    Value<String?> requestParameters = const Value.absent(),
  }) => AppErrorEntry(
    id: id ?? this.id,
    timestamp: timestamp ?? this.timestamp,
    apiEndpoint: apiEndpoint ?? this.apiEndpoint,
    statusCode: statusCode.present ? statusCode.value : this.statusCode,
    errorMessage: errorMessage ?? this.errorMessage,
    locationIdentifier: locationIdentifier.present
        ? locationIdentifier.value
        : this.locationIdentifier,
    requestParameters: requestParameters.present
        ? requestParameters.value
        : this.requestParameters,
  );
  AppErrorEntry copyWithCompanion(AppErrorsCompanion data) {
    return AppErrorEntry(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      apiEndpoint: data.apiEndpoint.present
          ? data.apiEndpoint.value
          : this.apiEndpoint,
      statusCode: data.statusCode.present
          ? data.statusCode.value
          : this.statusCode,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      locationIdentifier: data.locationIdentifier.present
          ? data.locationIdentifier.value
          : this.locationIdentifier,
      requestParameters: data.requestParameters.present
          ? data.requestParameters.value
          : this.requestParameters,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppErrorEntry(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('apiEndpoint: $apiEndpoint, ')
          ..write('statusCode: $statusCode, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('locationIdentifier: $locationIdentifier, ')
          ..write('requestParameters: $requestParameters')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    timestamp,
    apiEndpoint,
    statusCode,
    errorMessage,
    locationIdentifier,
    requestParameters,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppErrorEntry &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.apiEndpoint == this.apiEndpoint &&
          other.statusCode == this.statusCode &&
          other.errorMessage == this.errorMessage &&
          other.locationIdentifier == this.locationIdentifier &&
          other.requestParameters == this.requestParameters);
}

class AppErrorsCompanion extends UpdateCompanion<AppErrorEntry> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<String> apiEndpoint;
  final Value<int?> statusCode;
  final Value<String> errorMessage;
  final Value<String?> locationIdentifier;
  final Value<String?> requestParameters;
  const AppErrorsCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.apiEndpoint = const Value.absent(),
    this.statusCode = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.locationIdentifier = const Value.absent(),
    this.requestParameters = const Value.absent(),
  });
  AppErrorsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime timestamp,
    required String apiEndpoint,
    this.statusCode = const Value.absent(),
    required String errorMessage,
    this.locationIdentifier = const Value.absent(),
    this.requestParameters = const Value.absent(),
  }) : timestamp = Value(timestamp),
       apiEndpoint = Value(apiEndpoint),
       errorMessage = Value(errorMessage);
  static Insertable<AppErrorEntry> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<String>? apiEndpoint,
    Expression<int>? statusCode,
    Expression<String>? errorMessage,
    Expression<String>? locationIdentifier,
    Expression<String>? requestParameters,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (apiEndpoint != null) 'api_endpoint': apiEndpoint,
      if (statusCode != null) 'status_code': statusCode,
      if (errorMessage != null) 'error_message': errorMessage,
      if (locationIdentifier != null) 'location_identifier': locationIdentifier,
      if (requestParameters != null) 'request_parameters': requestParameters,
    });
  }

  AppErrorsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? timestamp,
    Value<String>? apiEndpoint,
    Value<int?>? statusCode,
    Value<String>? errorMessage,
    Value<String?>? locationIdentifier,
    Value<String?>? requestParameters,
  }) {
    return AppErrorsCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      apiEndpoint: apiEndpoint ?? this.apiEndpoint,
      statusCode: statusCode ?? this.statusCode,
      errorMessage: errorMessage ?? this.errorMessage,
      locationIdentifier: locationIdentifier ?? this.locationIdentifier,
      requestParameters: requestParameters ?? this.requestParameters,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (apiEndpoint.present) {
      map['api_endpoint'] = Variable<String>(apiEndpoint.value);
    }
    if (statusCode.present) {
      map['status_code'] = Variable<int>(statusCode.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (locationIdentifier.present) {
      map['location_identifier'] = Variable<String>(locationIdentifier.value);
    }
    if (requestParameters.present) {
      map['request_parameters'] = Variable<String>(requestParameters.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppErrorsCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('apiEndpoint: $apiEndpoint, ')
          ..write('statusCode: $statusCode, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('locationIdentifier: $locationIdentifier, ')
          ..write('requestParameters: $requestParameters')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocationsTable locations = $LocationsTable(this);
  late final $CachedWeatherTable cachedWeather = $CachedWeatherTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $AppErrorsTable appErrors = $AppErrorsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    locations,
    cachedWeather,
    settings,
    appErrors,
  ];
}

typedef $$LocationsTableCreateCompanionBuilder =
    LocationsCompanion Function({
      Value<int> id,
      required String zipcode,
      required String cityName,
      required String stateName,
      required double latitude,
      required double longitude,
      Value<bool> isDefault,
    });
typedef $$LocationsTableUpdateCompanionBuilder =
    LocationsCompanion Function({
      Value<int> id,
      Value<String> zipcode,
      Value<String> cityName,
      Value<String> stateName,
      Value<double> latitude,
      Value<double> longitude,
      Value<bool> isDefault,
    });

final class $$LocationsTableReferences
    extends BaseReferences<_$AppDatabase, $LocationsTable, LocationEntry> {
  $$LocationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CachedWeatherTable, List<CachedWeatherEntry>>
  _cachedWeatherRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cachedWeather,
    aliasName: $_aliasNameGenerator(
      db.locations.id,
      db.cachedWeather.locationId,
    ),
  );

  $$CachedWeatherTableProcessedTableManager get cachedWeatherRefs {
    final manager = $$CachedWeatherTableTableManager(
      $_db,
      $_db.cachedWeather,
    ).filter((f) => f.locationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cachedWeatherRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocationsTableFilterComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zipcode => $composableBuilder(
    column: $table.zipcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityName => $composableBuilder(
    column: $table.cityName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateName => $composableBuilder(
    column: $table.stateName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cachedWeatherRefs(
    Expression<bool> Function($$CachedWeatherTableFilterComposer f) f,
  ) {
    final $$CachedWeatherTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedWeather,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedWeatherTableFilterComposer(
            $db: $db,
            $table: $db.cachedWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zipcode => $composableBuilder(
    column: $table.zipcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityName => $composableBuilder(
    column: $table.cityName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateName => $composableBuilder(
    column: $table.stateName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get zipcode =>
      $composableBuilder(column: $table.zipcode, builder: (column) => column);

  GeneratedColumn<String> get cityName =>
      $composableBuilder(column: $table.cityName, builder: (column) => column);

  GeneratedColumn<String> get stateName =>
      $composableBuilder(column: $table.stateName, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  Expression<T> cachedWeatherRefs<T extends Object>(
    Expression<T> Function($$CachedWeatherTableAnnotationComposer a) f,
  ) {
    final $$CachedWeatherTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedWeather,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedWeatherTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationsTable,
          LocationEntry,
          $$LocationsTableFilterComposer,
          $$LocationsTableOrderingComposer,
          $$LocationsTableAnnotationComposer,
          $$LocationsTableCreateCompanionBuilder,
          $$LocationsTableUpdateCompanionBuilder,
          (LocationEntry, $$LocationsTableReferences),
          LocationEntry,
          PrefetchHooks Function({bool cachedWeatherRefs})
        > {
  $$LocationsTableTableManager(_$AppDatabase db, $LocationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> zipcode = const Value.absent(),
                Value<String> cityName = const Value.absent(),
                Value<String> stateName = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
              }) => LocationsCompanion(
                id: id,
                zipcode: zipcode,
                cityName: cityName,
                stateName: stateName,
                latitude: latitude,
                longitude: longitude,
                isDefault: isDefault,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String zipcode,
                required String cityName,
                required String stateName,
                required double latitude,
                required double longitude,
                Value<bool> isDefault = const Value.absent(),
              }) => LocationsCompanion.insert(
                id: id,
                zipcode: zipcode,
                cityName: cityName,
                stateName: stateName,
                latitude: latitude,
                longitude: longitude,
                isDefault: isDefault,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cachedWeatherRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cachedWeatherRefs) db.cachedWeather,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cachedWeatherRefs)
                    await $_getPrefetchedData<
                      LocationEntry,
                      $LocationsTable,
                      CachedWeatherEntry
                    >(
                      currentTable: table,
                      referencedTable: $$LocationsTableReferences
                          ._cachedWeatherRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LocationsTableReferences(
                            db,
                            table,
                            p0,
                          ).cachedWeatherRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.locationId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationsTable,
      LocationEntry,
      $$LocationsTableFilterComposer,
      $$LocationsTableOrderingComposer,
      $$LocationsTableAnnotationComposer,
      $$LocationsTableCreateCompanionBuilder,
      $$LocationsTableUpdateCompanionBuilder,
      (LocationEntry, $$LocationsTableReferences),
      LocationEntry,
      PrefetchHooks Function({bool cachedWeatherRefs})
    >;
typedef $$CachedWeatherTableCreateCompanionBuilder =
    CachedWeatherCompanion Function({
      Value<int> id,
      required int locationId,
      required String description,
      required double temperature,
      required double windSpeed,
      required String weatherIconUrl,
      required DateTime timestamp,
    });
typedef $$CachedWeatherTableUpdateCompanionBuilder =
    CachedWeatherCompanion Function({
      Value<int> id,
      Value<int> locationId,
      Value<String> description,
      Value<double> temperature,
      Value<double> windSpeed,
      Value<String> weatherIconUrl,
      Value<DateTime> timestamp,
    });

final class $$CachedWeatherTableReferences
    extends
        BaseReferences<_$AppDatabase, $CachedWeatherTable, CachedWeatherEntry> {
  $$CachedWeatherTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LocationsTable _locationIdTable(_$AppDatabase db) =>
      db.locations.createAlias(
        $_aliasNameGenerator(db.cachedWeather.locationId, db.locations.id),
      );

  $$LocationsTableProcessedTableManager get locationId {
    final $_column = $_itemColumn<int>('location_id')!;

    final manager = $$LocationsTableTableManager(
      $_db,
      $_db.locations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CachedWeatherTableFilterComposer
    extends Composer<_$AppDatabase, $CachedWeatherTable> {
  $$CachedWeatherTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get windSpeed => $composableBuilder(
    column: $table.windSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weatherIconUrl => $composableBuilder(
    column: $table.weatherIconUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$LocationsTableFilterComposer get locationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableFilterComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedWeatherTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedWeatherTable> {
  $$CachedWeatherTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get windSpeed => $composableBuilder(
    column: $table.windSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weatherIconUrl => $composableBuilder(
    column: $table.weatherIconUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$LocationsTableOrderingComposer get locationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableOrderingComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedWeatherTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedWeatherTable> {
  $$CachedWeatherTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => column,
  );

  GeneratedColumn<double> get windSpeed =>
      $composableBuilder(column: $table.windSpeed, builder: (column) => column);

  GeneratedColumn<String> get weatherIconUrl => $composableBuilder(
    column: $table.weatherIconUrl,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$LocationsTableAnnotationComposer get locationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.locations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedWeatherTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedWeatherTable,
          CachedWeatherEntry,
          $$CachedWeatherTableFilterComposer,
          $$CachedWeatherTableOrderingComposer,
          $$CachedWeatherTableAnnotationComposer,
          $$CachedWeatherTableCreateCompanionBuilder,
          $$CachedWeatherTableUpdateCompanionBuilder,
          (CachedWeatherEntry, $$CachedWeatherTableReferences),
          CachedWeatherEntry,
          PrefetchHooks Function({bool locationId})
        > {
  $$CachedWeatherTableTableManager(_$AppDatabase db, $CachedWeatherTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedWeatherTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedWeatherTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedWeatherTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> locationId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> temperature = const Value.absent(),
                Value<double> windSpeed = const Value.absent(),
                Value<String> weatherIconUrl = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => CachedWeatherCompanion(
                id: id,
                locationId: locationId,
                description: description,
                temperature: temperature,
                windSpeed: windSpeed,
                weatherIconUrl: weatherIconUrl,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int locationId,
                required String description,
                required double temperature,
                required double windSpeed,
                required String weatherIconUrl,
                required DateTime timestamp,
              }) => CachedWeatherCompanion.insert(
                id: id,
                locationId: locationId,
                description: description,
                temperature: temperature,
                windSpeed: windSpeed,
                weatherIconUrl: weatherIconUrl,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedWeatherTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({locationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (locationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.locationId,
                                referencedTable: $$CachedWeatherTableReferences
                                    ._locationIdTable(db),
                                referencedColumn: $$CachedWeatherTableReferences
                                    ._locationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CachedWeatherTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedWeatherTable,
      CachedWeatherEntry,
      $$CachedWeatherTableFilterComposer,
      $$CachedWeatherTableOrderingComposer,
      $$CachedWeatherTableAnnotationComposer,
      $$CachedWeatherTableCreateCompanionBuilder,
      $$CachedWeatherTableUpdateCompanionBuilder,
      (CachedWeatherEntry, $$CachedWeatherTableReferences),
      CachedWeatherEntry,
      PrefetchHooks Function({bool locationId})
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          SettingEntry,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            SettingEntry,
            BaseReferences<_$AppDatabase, $SettingsTable, SettingEntry>,
          ),
          SettingEntry,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      SettingEntry,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (
        SettingEntry,
        BaseReferences<_$AppDatabase, $SettingsTable, SettingEntry>,
      ),
      SettingEntry,
      PrefetchHooks Function()
    >;
typedef $$AppErrorsTableCreateCompanionBuilder =
    AppErrorsCompanion Function({
      Value<int> id,
      required DateTime timestamp,
      required String apiEndpoint,
      Value<int?> statusCode,
      required String errorMessage,
      Value<String?> locationIdentifier,
      Value<String?> requestParameters,
    });
typedef $$AppErrorsTableUpdateCompanionBuilder =
    AppErrorsCompanion Function({
      Value<int> id,
      Value<DateTime> timestamp,
      Value<String> apiEndpoint,
      Value<int?> statusCode,
      Value<String> errorMessage,
      Value<String?> locationIdentifier,
      Value<String?> requestParameters,
    });

class $$AppErrorsTableFilterComposer
    extends Composer<_$AppDatabase, $AppErrorsTable> {
  $$AppErrorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiEndpoint => $composableBuilder(
    column: $table.apiEndpoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationIdentifier => $composableBuilder(
    column: $table.locationIdentifier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requestParameters => $composableBuilder(
    column: $table.requestParameters,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppErrorsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppErrorsTable> {
  $$AppErrorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiEndpoint => $composableBuilder(
    column: $table.apiEndpoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationIdentifier => $composableBuilder(
    column: $table.locationIdentifier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestParameters => $composableBuilder(
    column: $table.requestParameters,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppErrorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppErrorsTable> {
  $$AppErrorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get apiEndpoint => $composableBuilder(
    column: $table.apiEndpoint,
    builder: (column) => column,
  );

  GeneratedColumn<int> get statusCode => $composableBuilder(
    column: $table.statusCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationIdentifier => $composableBuilder(
    column: $table.locationIdentifier,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requestParameters => $composableBuilder(
    column: $table.requestParameters,
    builder: (column) => column,
  );
}

class $$AppErrorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppErrorsTable,
          AppErrorEntry,
          $$AppErrorsTableFilterComposer,
          $$AppErrorsTableOrderingComposer,
          $$AppErrorsTableAnnotationComposer,
          $$AppErrorsTableCreateCompanionBuilder,
          $$AppErrorsTableUpdateCompanionBuilder,
          (
            AppErrorEntry,
            BaseReferences<_$AppDatabase, $AppErrorsTable, AppErrorEntry>,
          ),
          AppErrorEntry,
          PrefetchHooks Function()
        > {
  $$AppErrorsTableTableManager(_$AppDatabase db, $AppErrorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppErrorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppErrorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppErrorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String> apiEndpoint = const Value.absent(),
                Value<int?> statusCode = const Value.absent(),
                Value<String> errorMessage = const Value.absent(),
                Value<String?> locationIdentifier = const Value.absent(),
                Value<String?> requestParameters = const Value.absent(),
              }) => AppErrorsCompanion(
                id: id,
                timestamp: timestamp,
                apiEndpoint: apiEndpoint,
                statusCode: statusCode,
                errorMessage: errorMessage,
                locationIdentifier: locationIdentifier,
                requestParameters: requestParameters,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime timestamp,
                required String apiEndpoint,
                Value<int?> statusCode = const Value.absent(),
                required String errorMessage,
                Value<String?> locationIdentifier = const Value.absent(),
                Value<String?> requestParameters = const Value.absent(),
              }) => AppErrorsCompanion.insert(
                id: id,
                timestamp: timestamp,
                apiEndpoint: apiEndpoint,
                statusCode: statusCode,
                errorMessage: errorMessage,
                locationIdentifier: locationIdentifier,
                requestParameters: requestParameters,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppErrorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppErrorsTable,
      AppErrorEntry,
      $$AppErrorsTableFilterComposer,
      $$AppErrorsTableOrderingComposer,
      $$AppErrorsTableAnnotationComposer,
      $$AppErrorsTableCreateCompanionBuilder,
      $$AppErrorsTableUpdateCompanionBuilder,
      (
        AppErrorEntry,
        BaseReferences<_$AppDatabase, $AppErrorsTable, AppErrorEntry>,
      ),
      AppErrorEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db, _db.locations);
  $$CachedWeatherTableTableManager get cachedWeather =>
      $$CachedWeatherTableTableManager(_db, _db.cachedWeather);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$AppErrorsTableTableManager get appErrors =>
      $$AppErrorsTableTableManager(_db, _db.appErrors);
}
