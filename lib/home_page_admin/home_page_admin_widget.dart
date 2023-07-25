/*
import '/backend/backend.dart';
import '/components/searchfilter_widget.dart';
import '/components/view_book_info_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

import 'home_page_admin_model.dart';
export 'home_page_admin_model.dart';

class HomePageAdminWidget extends StatefulWidget {
  const HomePageAdminWidget({
    Key? key,
    this.bookcover,
  }) : super(key: key);

  final String? bookcover;

  get bookinfo => null;

  @override
  _HomePageAdminWidgetState createState() => _HomePageAdminWidgetState();
}

class _HomePageAdminWidgetState extends State<HomePageAdminWidget> {
  late HomePageAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageAdminModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<DataRecord>>(
      stream: queryDataRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<DataRecord> homePageAdminDataRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.pushNamed('Upload');
              },
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              elevation: 8.0,
              child: Container(
                width: 60,
                height: 60,
                child: Icon(
                  Icons.add_circle_outline_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 35.0,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF00FE0D), Color(0xFF00D1FD)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: TextFormField(
                                controller: _model.textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                      () async {
                                    await queryDataRecordOnce()
                                        .then(
                                          (records) => _model
                                          .simpleSearchResults = TextSearch(
                                        records
                                            .map(
                                              (record) => TextSearchItem(
                                              record, [
                                            record.booktitle!,
                                            record.author!,
                                            record.journal!
                                          ]),
                                        )
                                            .toList(),
                                      )
                                          .search(
                                          _model.textController.text)
                                          .map((r) => r.object)
                                          .toList(),
                                    )
                                        .onError((_, __) =>
                                    _model.simpleSearchResults = [])
                                        .whenComplete(() => setState(() {}));

                                    setState(() {
                                      FFAppState().searchActive = true;
                                    });
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'xb8jwmma' /* Search... */,
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.clear_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30,
                            ),
                            onPressed: () async {
                              setState(() {
                                _model.textController?.clear();
                              });
                              setState(() {
                                FFAppState().searchActive = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Color(0xFF343439),
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.45,
                                        child: SearchfilterWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Icon(
                              FFIcons.kslidersfill,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: SelectionArea(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'kwtzw5aj' /* Upload Request */,
                              ),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context).displaySmall,
                            )),
                      ),
                    ),
                    if (!FFAppState().searchActive)
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Generated code for this ListView Widget...
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: StreamBuilder<List<DataRecord>>(
                                  stream: queryDataRecord(
                                    queryBuilder: (dataRecord) =>
                                        dataRecord.where('bookstatus', isEqualTo: 'pending'),
                                    limit: 7,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context).primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<DataRecord> listViewDataRecordList = snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listViewDataRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewDataRecord = listViewDataRecordList[listViewIndex];
                                        return Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (listViewDataRecord.filetype == 'Book') {
                                                debugPrint('it works');
                                                context.pushNamed(
                                                  'file_check_admin_book',
                                                  queryParams: {
                                                    'bookcheck': serializeParam(
                                                      listViewDataRecord.reference,
                                                      ParamType.DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                if (listViewDataRecord.filetype == 'Paper') {
                                                  context.pushNamed(
                                                    'file_check_admin_paper',
                                                    queryParams: {
                                                      'bookcheck': serializeParam(
                                                        listViewDataRecord.reference,
                                                        ParamType.DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (listViewDataRecord.filetype == 'Project') {
                                                    context.pushNamed(
                                                      'file_check_admin_project',
                                                      queryParams: {
                                                        'bookcheck': serializeParam(
                                                          listViewDataRecord.reference,
                                                          ParamType.DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  }
                                                }
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  splashColor: Colors.transparent,
                                                  focusColor: Colors.transparent,
                                                  hoverColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  onTap: () async {
                                                    if (listViewDataRecord.filetype == 'Book') {
                                                      context.pushNamed(
                                                        'file_check_admin_book',
                                                        queryParams: {
                                                          'bookcheck': serializeParam(
                                                            listViewDataRecord.reference,
                                                            ParamType.DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      if (listViewDataRecord.filetype == 'Paper') {
                                                        context.pushNamed(
                                                          'file_check_admin_paper',
                                                          queryParams: {
                                                            'bookcheck': serializeParam(
                                                              listViewDataRecord.reference,
                                                              ParamType.DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        if (listViewDataRecord.filetype == 'Project') {
                                                          context.pushNamed(
                                                            'file_check_admin_project',
                                                            queryParams: {
                                                              'bookcheck': serializeParam(
                                                                listViewDataRecord.reference,
                                                                ParamType.DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      }
                                                    }
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(15),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        listViewDataRecord.bookcover,
                                                        'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                      ),
                                                      width: 170,
                                                      height: 230,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                  child: Text(
                                                    listViewDataRecord.booktitle!,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      fontFamily:
                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                      color: Colors.black,
                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                          FlutterFlowTheme.of(context)
                                                              .bodyMediumFamily),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: AlignmentDirectional(0, 0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                    child: Text(
                                                      listViewDataRecord.author!,
                                                      style: FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(context)
                                                            .bodyMediumFamily,
                                                        color: Colors.black,
                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    if (!FFAppState().searchActive)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.95, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: SelectionArea(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ei0d8h9h' /* New Arraive */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Cairo',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily),
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: StreamBuilder<List<DataRecord>>(
                                      stream: queryDataRecord(
                                        queryBuilder: (dataRecord) =>
                                            dataRecord.where('bookstatus',
                                                isEqualTo: 'approved'),
                                        limit: 7,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<
                                                    Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<DataRecord>
                                        listViewDataRecordList =
                                        snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                          listViewDataRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewDataRecord =
                                            listViewDataRecordList[
                                            listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    barrierColor:
                                                    Color(0x00000000),
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => FocusScope
                                                            .of(context)
                                                            .requestFocus(_model
                                                            .unfocusNode),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .of(
                                                              context).viewInsets,
                                                          child: Container(
                                                            height: MediaQuery
                                                                .of(
                                                                context)
                                                                .size.height *
                                                                0.5,
                                                            child:
                                                            ViewBookInfoWidget(
                                                              bookinfo:
                                                              listViewDataRecord
                                                                  .reference,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          listViewDataRecord
                                                              .bookcover,
                                                          'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                        ),
                                                        width: 170,
                                                        height: 230,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8, 0, 0, 0),
                                                      child: Text(
                                                        listViewDataRecord
                                                            .booktitle!,
                                                        textAlign:
                                                        TextAlign.start,
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily,
                                                          color: Colors
                                                              .black,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            8, 0, 0, 0),
                                                        child: Text(
                                                          listViewDataRecord
                                                              .author!,
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            color: Colors
                                                                .black,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('department_choose');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 16),
                                                child: Icon(
                                                  Icons
                                                      .add_circle_outline_rounded,
                                                  color: Colors.black,
                                                  size: 50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 40, 8, 8),
                              child: SelectionArea(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'qbuo57ev' /* Catogery */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Cairo',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily),
                                    ),
                                  )),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 16),
                                    child: StreamBuilder<List<DepramentRecord>>(
                                      stream: queryDepramentRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<
                                                    Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<DepramentRecord>
                                        choiceChipsDepramentRecordList =
                                        snapshot.data!;
                                        return FlutterFlowChoiceChips(
                                          options:
                                          choiceChipsDepramentRecordList
                                              .map((e) => e.departmentName)
                                              .toList()
                                              .map((label) =>
                                              ChipData(label!))
                                              .toList(),
                                          onChanged: (val) async {
                                            setState(() => _model
                                                .choiceChipsValue = val?.first);
                                            context.pushNamed(
                                              'department',
                                              queryParams: {
                                                'departmentname':
                                                serializeParam(
                                                  choiceChipsDepramentRecordList
                                                      .first.departmentName,
                                                  ParamType.String,
                                                ),
                                                'filetype': serializeParam(
                                                  _model.choiceChipsValue,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMediumFamily,
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMediumFamily),
                                            ),
                                            iconColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                            iconSize: 18,
                                            elevation: 4,
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: Colors.transparent,
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodySmallFamily,
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodySmallFamily),
                                            ),
                                            iconColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                            iconSize: 18,
                                            elevation: 4,
                                          ),
                                          chipSpacing: 20,
                                          rowSpacing: 12,
                                          multiselect: false,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                              .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                                [],
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 40, 8, 8),
                                    child: SelectionArea(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'kmtmz81x' /* Department */,
                                          ),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Cairo',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                          ),
                                        )),
                                  ),
                                ),
                                StreamBuilder<List<DepramentRecord>>(
                                  stream: queryDepramentRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<DepramentRecord>
                                    listViewDepramentRecordList =
                                    snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount:
                                      listViewDepramentRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewDepramentRecord =
                                        listViewDepramentRecordList[
                                        listViewIndex];
                                        return Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 8, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 340,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Text(
                                                    listViewDepramentRecord
                                                        .departmentName!,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 300,
                                                  decoration: BoxDecoration(),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                    Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(8,
                                                              0, 8, 0),
                                                          child: StreamBuilder<
                                                              List<DataRecord>>(
                                                            stream:
                                                            queryDataRecord(
                                                              queryBuilder: (dataRecord) => dataRecord
                                                                  .where(
                                                                  'bookstatus',
                                                                  isEqualTo:
                                                                  'approved')
                                                                  .where(
                                                                  'departmentfilter',
                                                                  arrayContains:
                                                                  listViewDepramentRecord
                                                                      .departmentName)
                                                                  .orderBy(
                                                                  'department'),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                  SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                    CircularProgressIndicator(
                                                                      valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<DataRecord>
                                                              listViewDataRecordList =
                                                              snapshot
                                                                  .data!;
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                EdgeInsets
                                                                    .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                true,
                                                                scrollDirection:
                                                                Axis.horizontal,
                                                                itemCount:
                                                                listViewDataRecordList
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                    listViewIndex) {
                                                                  final listViewDataRecord =
                                                                  listViewDataRecordList[
                                                                  listViewIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                                    child:
                                                                    InkWell(
                                                                      splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                      focusColor:
                                                                      Colors
                                                                          .transparent,
                                                                      hoverColor:
                                                                      Colors
                                                                          .transparent,
                                                                      highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                          true,
                                                                          backgroundColor:
                                                                          Color(0x00000000),
                                                                          barrierColor:
                                                                          Color(0x00000000),
                                                                          enableDrag:
                                                                          false,
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                              child: Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: Container(
                                                                                  height: MediaQuery.of(context).size.height * 0.4,
                                                                                  child: ViewBookInfoWidget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                      Column(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                            BorderRadius.circular(15),
                                                                            child:
                                                                            Image.network(
                                                                              valueOrDefault<String>(
                                                                                listViewDataRecord.bookcover,
                                                                                'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                                              ),
                                                                              width: 170,
                                                                              height: 230,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                            Text(
                                                                              listViewDataRecord.booktitle!,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: Colors.black,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                            AlignmentDirectional(0, 0),
                                                                            child:
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                              child: Text(
                                                                                listViewDataRecord.author!,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'department_path',
                                                                queryParams:
                                                                {
                                                                  'departmentname':
                                                                  serializeParam(
                                                                    listViewDepramentRecord
                                                                        .departmentName,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Container(
                                                                  width: 170,
                                                                  height: 100,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                    AlignmentDirectional(
                                                                        0,
                                                                        0),
                                                                    child:
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16,
                                                                          16,
                                                                          16,
                                                                          16),
                                                                      child:
                                                                      Icon(
                                                                        Icons
                                                                            .add_circle_outline_rounded,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                        50,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (FFAppState().searchActive)
                      Builder(
                        builder: (context) {
                          final books = _model.simpleSearchResults.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: books.length,
                            itemBuilder: (context, booksIndex) {
                              final booksItem = books[booksIndex];
                              return Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('review_book');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x32000000),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    booksItem.bookcover,
                                                    'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                  ),
                                                  width: 150,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      booksItem.booktitle!,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .displaySmall,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0,
                                                              4, 0, 0),
                                                          child: Text(
                                                            booksItem.author!,
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodySmall
                                                                .override(
                                                              fontFamily:
                                                              'Outfit',
                                                              color: Color(
                                                                  0xFF7C8791),
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal,
                                                              useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                                  .containsKey(
                                                                  FlutterFlowTheme.of(context)
                                                                      .bodySmallFamily),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
*/
import '/backend/backend.dart';
import '/components/searchfilter_widget.dart';
import '/components/view_book_info_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

import 'home_page_admin_model.dart';
export 'home_page_admin_model.dart';

class HomePageAdminWidget extends StatefulWidget {
  const HomePageAdminWidget({
    Key? key,
    this.bookcover,
  }) : super(key: key);

  final String? bookcover;

  @override
  _HomePageAdminWidgetState createState() => _HomePageAdminWidgetState();
}

class _HomePageAdminWidgetState extends State<HomePageAdminWidget> {
  late HomePageAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageAdminModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<DataRecord>>(
      stream: queryDataRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<DataRecord> homePageAdminDataRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.pushNamed('Upload');
              },
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              elevation: 8,
              child: Icon(
                Icons.add_circle_outline,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 30,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: TextFormField(
                                controller: _model.textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                      () async {
                                    await queryDataRecordOnce()
                                        .then(
                                          (records) => _model
                                          .simpleSearchResults = TextSearch(
                                        records
                                            .map(
                                              (record) => TextSearchItem(
                                              record, [
                                            record.booktitle!,
                                            record.author!,
                                            record.journal!
                                          ]),
                                        )
                                            .toList(),
                                      )
                                          .search(
                                          _model.textController.text)
                                          .map((r) => r.object)
                                          .toList(),
                                    )
                                        .onError((_, __) =>
                                    _model.simpleSearchResults = [])
                                        .whenComplete(() => setState(() {}));

                                    setState(() {
                                      FFAppState().searchActive = true;
                                    });
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'xb8jwmma' /* Search... */,
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.clear_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30,
                            ),
                            onPressed: () async {
                              setState(() {
                                _model.textController?.clear();
                              });
                              setState(() {
                                FFAppState().searchActive = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Color(0xFF343439),
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.45,
                                        child: SearchfilterWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Icon(
                              FFIcons.kslidersfill,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: SelectionArea(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'kwtzw5aj' /* Upload Request */,
                              ),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.of(context).displaySmall,
                            )),
                      ),
                    ),
                    if (!FFAppState().searchActive)
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: StreamBuilder<List<DataRecord>>(
                                  stream: queryDataRecord(
                                    queryBuilder: (dataRecord) =>
                                        dataRecord.where('bookstatus',
                                            isEqualTo: 'pending'),
                                    limit: 7,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<DataRecord> listViewDataRecordList =
                                    snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listViewDataRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewDataRecord =
                                        listViewDataRecordList[
                                        listViewIndex];
                                        return Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8, 0, 8, 0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (listViewDataRecord.filetype ==
                                                  'Book') {
                                                context.pushNamed(
                                                  'file_check_admin_book',
                                                  queryParams: {
                                                    'bookcheck': serializeParam(
                                                      listViewDataRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                if (listViewDataRecord
                                                    .filetype ==
                                                    'Paper') {
                                                  context.pushNamed(
                                                    'file_check_admin_paper',
                                                    queryParams: {
                                                      'bookcheck':
                                                      serializeParam(
                                                        listViewDataRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (listViewDataRecord
                                                      .filetype ==
                                                      'Project') {
                                                    context.pushNamed(
                                                      'file_check_admin_project',
                                                      queryParams: {
                                                        'bookcheck':
                                                        serializeParam(
                                                          listViewDataRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  }
                                                }
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      listViewDataRecord
                                                          .bookcover,
                                                      'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                    ),
                                                    width: 170,
                                                    height: 230,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Text(
                                                    listViewDataRecord
                                                        .booktitle!,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMediumFamily,
                                                      color: Colors.black,
                                                      useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                          .containsKey(
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0, 0),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 0, 0),
                                                    child: Text(
                                                      listViewDataRecord.author!,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        color: Colors
                                                            .black,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (!FFAppState().searchActive)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.95, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: SelectionArea(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ei0d8h9h' /* New Arraive */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Cairo',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily),
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: StreamBuilder<List<DataRecord>>(
                                      stream: queryDataRecord(
                                        queryBuilder: (dataRecord) =>
                                            dataRecord.where('bookstatus',
                                                isEqualTo: 'approved'),
                                        limit: 7,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<
                                                    Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<DataRecord>
                                        listViewDataRecordList =
                                        snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                          listViewDataRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewDataRecord =
                                            listViewDataRecordList[
                                            listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryText,
                                                    barrierColor:
                                                    Color(0x00000000),
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => FocusScope
                                                            .of(context)
                                                            .requestFocus(_model
                                                            .unfocusNode),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .of(
                                                              context).viewInsets,
                                                          child: Container(
                                                            height: MediaQuery
                                                                .of(
                                                                context).size
                                                                .height *
                                                                0.5,
                                                            child:
                                                            ViewBookInfoWidget(
                                                              bookinfo:
                                                              listViewDataRecord
                                                                  .reference,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          listViewDataRecord
                                                              .bookcover,
                                                          'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                        ),
                                                        width: 170,
                                                        height: 230,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8, 0, 0, 0),
                                                      child: Text(
                                                        listViewDataRecord
                                                            .booktitle!,
                                                        textAlign:
                                                        TextAlign.start,
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMediumFamily,
                                                          color: Colors
                                                              .black,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodyMediumFamily),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            8, 0, 0, 0),
                                                        child: Text(
                                                          listViewDataRecord
                                                              .author!,
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            color: Colors
                                                                .black,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('department_choose');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 170,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 16),
                                                child: Icon(
                                                  Icons
                                                      .add_circle_outline_rounded,
                                                  color: Colors.black,
                                                  size: 50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 40, 8, 8),
                              child: SelectionArea(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'qbuo57ev' /* Catogery */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Cairo',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily),
                                    ),
                                  )),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 16),
                                    child: StreamBuilder<List<DepramentRecord>>(
                                      stream: queryDepramentRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<
                                                    Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<DepramentRecord>
                                        choiceChipsDepramentRecordList =
                                        snapshot.data!;
                                        return FlutterFlowChoiceChips(
                                          options:
                                          choiceChipsDepramentRecordList
                                              .map((e) => e.departmentName)
                                              .toList()
                                              .map((label) =>
                                              ChipData(label!))
                                              .toList(),
                                          onChanged: (val) async {
                                            setState(() => _model
                                                .choiceChipsValue = val?.first);
                                            context.pushNamed(
                                              'department',
                                              queryParams: {
                                                'departmentname':
                                                serializeParam(
                                                  choiceChipsDepramentRecordList
                                                      .first.departmentName,
                                                  ParamType.String,
                                                ),
                                                'filetype': serializeParam(
                                                  _model.choiceChipsValue,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMediumFamily,
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMediumFamily),
                                            ),
                                            iconColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                            iconSize: 18,
                                            elevation: 4,
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: Colors.transparent,
                                            textStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                              fontFamily:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodySmallFamily,
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodySmallFamily),
                                            ),
                                            iconColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                            iconSize: 18,
                                            elevation: 4,
                                          ),
                                          chipSpacing: 20,
                                          rowSpacing: 12,
                                          multiselect: false,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                              .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                                [],
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 40, 8, 8),
                                    child: SelectionArea(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'kmtmz81x' /* Department */,
                                          ),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Cairo',
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                          ),
                                        )),
                                  ),
                                ),
                                StreamBuilder<List<DepramentRecord>>(
                                  stream: queryDepramentRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<DepramentRecord>
                                    listViewDepramentRecordList =
                                    snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: const NeverScrollableScrollPhysics(),

                                      itemCount:
                                      listViewDepramentRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewDepramentRecord =
                                        listViewDepramentRecordList[
                                        listViewIndex];
                                        return Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 8, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 340,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  child: Text(
                                                    listViewDepramentRecord
                                                        .departmentName!,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 300,
                                                  decoration: BoxDecoration(),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                    Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(8,
                                                              0, 8, 0),
                                                          child: StreamBuilder<
                                                              List<DataRecord>>(
                                                            stream:
                                                            queryDataRecord(
                                                              queryBuilder: (dataRecord) => dataRecord
                                                                  .where('bookstatus', isEqualTo: 'approved')
                                                                  .where('department', isEqualTo: listViewDepramentRecord.departmentName)
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                  SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                    CircularProgressIndicator(
                                                                      valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<DataRecord>
                                                              listViewDataRecordList =
                                                              snapshot
                                                                  .data!;
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                EdgeInsets
                                                                    .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                true,
                                                                scrollDirection:
                                                                Axis.horizontal,
                                                                itemCount:
                                                                listViewDataRecordList
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                    listViewIndex) {
                                                                  final listViewDataRecord =
                                                                  listViewDataRecordList[
                                                                  listViewIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                                    child:
                                                                    InkWell(
                                                                      splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                      focusColor:
                                                                      Colors
                                                                          .transparent,
                                                                      hoverColor:
                                                                      Colors
                                                                          .transparent,
                                                                      highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                          true,
                                                                          backgroundColor:
                                                                          Color(0x00000000),
                                                                          barrierColor:
                                                                          Color(0x00000000),
                                                                          enableDrag:
                                                                          false,
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                              child: Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: Container(
                                                                                  height: MediaQuery.of(context).size.height * 0.4,
                                                                                  child: ViewBookInfoWidget(bookinfo: listViewDataRecord.reference,),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                      Column(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                            BorderRadius.circular(15),
                                                                            child:
                                                                            Image.network(
                                                                              valueOrDefault<String>(
                                                                                listViewDataRecord.bookcover,
                                                                                'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                                              ),
                                                                              width: 170,
                                                                              height: 230,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                            Text(
                                                                              listViewDataRecord.booktitle!,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: Colors.black,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                            AlignmentDirectional(0, 0),
                                                                            child:
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                              child: Text(
                                                                                listViewDataRecord.author!,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: Colors.black,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                            Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'department_path',
                                                                queryParams:
                                                                {
                                                                  'departmentname':
                                                                  serializeParam(
                                                                    listViewDepramentRecord
                                                                        .departmentName,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Container(
                                                                  width: 170,
                                                                  height: 100,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                    AlignmentDirectional(
                                                                        0,
                                                                        0),
                                                                    child:
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          16,
                                                                          16,
                                                                          16,
                                                                          16),
                                                                      child:
                                                                      Icon(
                                                                        Icons
                                                                            .add_circle_outline_rounded,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                        50,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (FFAppState().searchActive)
                      Builder(
                        builder: (context) {
                          final books = _model.simpleSearchResults.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: books.length,
                            itemBuilder: (context, booksIndex) {
                              final booksItem = books[booksIndex];
                              return Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('review_book');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x32000000),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    booksItem.bookcover,
                                                    'https://img.freepik.com/free-photo/book-library-with-old-open-textbook-stack-piles-literature-text-archive-reading-desk_1150-9086.jpg?w=1380&t=st=1679071713~exp=1679072313~hmac=bcb06bf370ee2d1aa5fe8e631608af645f5442b918422c23fbf401a82e4e8502',
                                                  ),
                                                  width: 150,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      booksItem.booktitle!,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .displaySmall,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0,
                                                              4, 0, 0),
                                                          child: Text(
                                                            booksItem.author!,
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodySmall
                                                                .override(
                                                              fontFamily:
                                                              'Outfit',
                                                              color: Color(
                                                                  0xFF7C8791),
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal,
                                                              useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                                  .containsKey(
                                                                  FlutterFlowTheme.of(context)
                                                                      .bodySmallFamily),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
