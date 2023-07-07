// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataRecord> _$dataRecordSerializer = new _$DataRecordSerializer();

class _$DataRecordSerializer implements StructuredSerializer<DataRecord> {
  @override
  final Iterable<Type> types = const [DataRecord, _$DataRecord];
  @override
  final String wireName = 'DataRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.created;
    if (value != null) {
      result
        ..add('created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookcover;
    if (value != null) {
      result
        ..add('bookcover')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookstatus;
    if (value != null) {
      result
        ..add('bookstatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.booktitle;
    if (value != null) {
      result
        ..add('Booktitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.departmentfilter;
    if (value != null) {
      result
        ..add('departmentfilter')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.bookpath;
    if (value != null) {
      result
        ..add('bookpath')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.department;
    if (value != null) {
      result
        ..add('department')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.favorite;
    if (value != null) {
      result
        ..add('favorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.collage;
    if (value != null) {
      result
        ..add('collage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.publicationData;
    if (value != null) {
      result
        ..add('publicationData')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.journal;
    if (value != null) {
      result
        ..add('journal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.filetype;
    if (value != null) {
      result
        ..add('filetype')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thesisetype;
    if (value != null) {
      result
        ..add('thesisetype')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.volume;
    if (value != null) {
      result
        ..add('volume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.publisher;
    if (value != null) {
      result
        ..add('publisher')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DataRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bookcover':
          result.bookcover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bookstatus':
          result.bookstatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Booktitle':
          result.booktitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'departmentfilter':
          result.departmentfilter.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'journal':
          result.journal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;case 'publisher':
        result.publisher = serializers.deserialize(value,
            specifiedType: const FullType(String)) as String?;
        break;case 'thesisetype':
        result.thesisetype = serializers.deserialize(value,
            specifiedType: const FullType(String)) as String?;
        break;case 'filetype':
        result.filetype = serializers.deserialize(value,
            specifiedType: const FullType(String)) as String?;
        break;
        case 'publicationData':
          result.publicationData = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bookpath':
          result.bookpath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'department':
          result.department = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'favorite':
          result.favorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'collage':
          result.collage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$DataRecord extends DataRecord {
  @override
  final DateTime? created;
  @override
  final String? description;
  @override
  final String? bookcover;
  @override
  final bool? status;
  @override
  final String? author;
  @override
  final String? bookstatus;
  @override
  final String? booktitle;
  @override
  final BuiltList<String>? departmentfilter;
  @override
  final String? bookpath;
  @override
  final DocumentReference<Object?>? department;
  @override
  final bool? favorite;
  @override
  final String? collage;
  @override
  final DocumentReference<Object?>? ffRef;
  @override
  final DateTime? publicationData;
  @override
  final String? journal;
  @override
  final String? filetype;
  @override
  final String? thesisetype;
  @override
  final int? volume;
  @override
  final String? publisher;




  factory _$DataRecord([void Function(DataRecordBuilder)? updates]) =>
      (new DataRecordBuilder()..update(updates))._build();

  _$DataRecord._(
      {this.created,
      this.description,
      this.bookcover,
      this.status,
      this.author,
      this.bookstatus,
      this.booktitle,
      this.departmentfilter,
      this.bookpath,
      this.department,
      this.favorite,
      this.collage,
      this.ffRef,
      this.publicationData,
      this.journal,
      this.filetype,
      this.thesisetype, 
      this.volume,
      this.publisher,
      })
      : super._();


  @override
  DataRecord rebuild(void Function(DataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataRecordBuilder toBuilder() => new DataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataRecord &&
        created == other.created &&
        description == other.description &&
        bookcover == other.bookcover &&
        status == other.status &&
        author == other.author &&
        bookstatus == other.bookstatus &&
        booktitle == other.booktitle &&
        departmentfilter == other.departmentfilter &&
        bookpath == other.bookpath &&
        department == other.department &&
        favorite == other.favorite &&
        collage == other.collage &&
        ffRef == other.ffRef&&
        journal == other.journal&&
        filetype == other.filetype&&
        thesisetype == other.thesisetype&&
        publicationData == other.publicationData ;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, bookcover.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, bookstatus.hashCode);
    _$hash = $jc(_$hash, booktitle.hashCode);
    _$hash = $jc(_$hash, departmentfilter.hashCode);
    _$hash = $jc(_$hash, bookpath.hashCode);
    _$hash = $jc(_$hash, department.hashCode);
    _$hash = $jc(_$hash, favorite.hashCode);
    _$hash = $jc(_$hash, collage.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jc(_$hash, publicationData.hashCode);
    _$hash = $jc(_$hash, journal.hashCode);
    _$hash = $jc(_$hash, thesisetype.hashCode);
    _$hash = $jc(_$hash, filetype.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DataRecord')
          ..add('created', created)
          ..add('description', description)
          ..add('bookcover', bookcover)
          ..add('status', status)
          ..add('author', author)
          ..add('bookstatus', bookstatus)
          ..add('booktitle', booktitle)
          ..add('departmentfilter', departmentfilter)
          ..add('bookpath', bookpath)
          ..add('department', department)
          ..add('favorite', favorite)
          ..add('collage', collage)
          ..add('ffRef', ffRef)
          ..add('journal', journal)
          ..add('filetype', filetype)
          ..add('thesisetype', thesisetype)
          ..add('publicationData', publicationData))
        .toString();
  }
}

class DataRecordBuilder implements Builder<DataRecord, DataRecordBuilder> {
  _$DataRecord? _$v;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;


  DateTime? _publicationData;
  DateTime? get publicationData => _$this._publicationData;
  set publicationData(DateTime? publicationData) => _$this._publicationData = publicationData;

  String? _publisher;
  String? get publisher => _$this._publisher;
  set publisher(String? publisher) => _$this._publisher = publisher;
  
  String? _journal;
  String? get journal => _$this._journal;
  set journal(String? journal) => _$this._journal = journal;

  int? _volume;
  int? get volume => _$this._volume;
  set volume(int? volume) => _$this._volume = volume;

  String? _filetype;
  String? get filetype => _$this._filetype;
  set filetype(String? journal) => _$this._filetype = filetype;

  String? _thesisetype;
  String? get thesisetype => _$this._thesisetype;
  set thesisetype(String? journal) => _$this._thesisetype = thesisetype;
  
  
  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _bookcover;
  String? get bookcover => _$this._bookcover;
  set bookcover(String? bookcover) => _$this._bookcover = bookcover;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  String? _author;
  String? get author => _$this._author;
  set author(String? author) => _$this._author = author;

  String? _bookstatus;
  String? get bookstatus => _$this._bookstatus;
  set bookstatus(String? bookstatus) => _$this._bookstatus = bookstatus;

  String? _booktitle;
  String? get booktitle => _$this._booktitle;
  set booktitle(String? booktitle) => _$this._booktitle = booktitle;

  ListBuilder<String>? _departmentfilter;
  ListBuilder<String> get departmentfilter =>
      _$this._departmentfilter ??= new ListBuilder<String>();
  set departmentfilter(ListBuilder<String>? departmentfilter) =>
      _$this._departmentfilter = departmentfilter;

  String? _bookpath;
  String? get bookpath => _$this._bookpath;
  set bookpath(String? bookpath) => _$this._bookpath = bookpath;

  DocumentReference<Object?>? _department;
  DocumentReference<Object?>? get department => _$this._department;
  set department(DocumentReference<Object?>? department) =>
      _$this._department = department;

  bool? _favorite;
  bool? get favorite => _$this._favorite;
  set favorite(bool? favorite) => _$this._favorite = favorite;

  String? _collage;
  String? get collage => _$this._collage;
  set collage(String? collage) => _$this._collage = collage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DataRecordBuilder() {
    DataRecord._initializeBuilder(this);
  }

  DataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _created = $v.created;
      _description = $v.description;
      _bookcover = $v.bookcover;
      _status = $v.status;
      _author = $v.author;
      _bookstatus = $v.bookstatus;
      _booktitle = $v.booktitle;
      _departmentfilter = $v.departmentfilter?.toBuilder();
      _bookpath = $v.bookpath;
      _department = $v.department;
      _favorite = $v.favorite;
      _collage = $v.collage;
      _ffRef = $v.ffRef;
      _journal = $v.journal;
      _filetype = $v.filetype;
      _thesisetype = $v.thesisetype;
      _publicationData = $v.publicationData;
      _publisher = $v.publisher;
      _volume = $v.volume;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataRecord;
  }

  @override
  void update(void Function(DataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataRecord build() => _build();

  _$DataRecord _build() {
    _$DataRecord _$result;
    try {
      _$result = _$v ??
          new _$DataRecord._(
              created: created,
              description: description,
              bookcover: bookcover,
              status: status,
              author: author,
              bookstatus: bookstatus,
              booktitle: booktitle,
              departmentfilter: _departmentfilter?.build(),
              bookpath: bookpath,
              department: department,
              favorite: favorite,
              journal: journal,
              filetype: filetype,
              thesisetype: thesisetype,
              publicationData: publicationData,
              collage: collage,
              publisher: publisher,
              volume: volume,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'departmentfilter';
        _departmentfilter?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DataRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
