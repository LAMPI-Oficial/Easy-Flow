// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

import 'default_empty_widget.dart';
import 'default_error_widget.dart';
import 'default_loading_widget.dart';
import 'list_item.dart';
import 'search_text_field.dart';

class ListViewWidget<T> extends StatefulWidget {
  ///indicates whether the ssliver scroll effect will be applied
  ///on the listview and search field or not
  ///by default sliverScrollEffect == [false]
  bool sliverScrollEffect = false;

  ///indicate if the divider will be displayed or not
  ///if true the listview will be rendered with [ListView.separated] constructor
  bool displayDividder = false;

  ListViewWidget({
    Key? key,
    this.initialList,
    this.asyncListCallback,
    this.filter,
    this.asyncListFilter,
    this.loadingWidget,
    this.errorWidget,
    required this.builder,
    this.searchTextController,
    this.keyboardAction = TextInputAction.done,
    this.inputDecoration,
    this.style,
    this.onSubmitSearch,
    this.searchMode = SearchMode.onEdit,
    this.emptyWidget,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.focusNode,
    this.searchFieldEnabled = false,
    this.onItemSelected,
    this.displayClearIcon = true,
    this.defaultSuffixIconColor,
    this.onRefresh,
    this.scrollDirection = Axis.vertical,
    this.searchTextPosition = SearchTextPosition.top,
    this.onPaginate,
    this.cursorColor,
    this.maxLines,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.autoCompleteHints = const [],
    this.autoFocusOnSearch = true,
    this.secondaryWidget,
    this.padding,
    required this.separatorBuilder,
  }) : super(key: key) {
    if (asyncListCallback == null) {
      throw ('asyncListCallback must be provided');
    }
    assert((asyncListCallback != null));
    searchTextController ??= TextEditingController();
  }

  /// Initial list of all elements that will be displayed.
  ///
  ///when [initialList] is null you need to provide [asyncListCallback]
  ///to filter the [initialList] you need provide [filter] callback
  List<T>? initialList;

  /// Callback to filter the list based on the given search value.
  ///
  /// Invoked on changing the text field search if ```searchType == SEARCH_TYPE.onEdit```
  /// or invoked when submiting the text field if ```searchType == SEARCH_TYPE.onSubmit```.
  ///
  /// You should return a list of filtered elements.
  late List<T> Function(String)? filter;

  ///Async callback that return list to be displayed with future builder
  ///
  ///when [asyncListCallback] is null you need to provide [initialList]
  ///to filter the [asyncListCallback] result you need provide [asyncListFilter]
  Future<List<T>?> Function()? asyncListCallback;

  ///Callback invoked when filtring the searchable list
  ///used when providing [asyncListCallback]
  ///
  ///can't be null when [asyncListCallback] isn't null
  late List<T> Function(String, List<T>)? asyncListFilter;

  ///Loading widget displayed when [asyncListCallback] is loading
  ///
  ///if nothing is provided in [loadingWidget] searchable list will display a [CircularProgressIndicator]
  Widget? loadingWidget;

  ///error widget displayed when [asyncListCallback] result is null
  ///
  ///if nothing is provided in [errorWidget] searchable list will display a [Icon]
  Widget? errorWidget;

  /// Builder function that generates the ListView items
  /// based on the given element.
  final Widget Function(T) builder;

  /// The widget to be displayed when the filter returns an empty list.
  ///
  /// Defaults to `const SizedBox.shrink()`.
  Widget? emptyWidget;

  /// Text editing controller applied on the search field.
  ///
  /// Defaults to null.
  late TextEditingController? searchTextController;

  /// The keyboard action key
  ///
  /// Defaults to [TextInputAction.done].
  final TextInputAction keyboardAction;

  /// The text field input decoration
  ///
  /// Defaults to null.
  final InputDecoration? inputDecoration;

  /// The style for the input text field
  ///
  /// Defaults to null.
  final TextStyle? style;

  /// The keyboard text input type
  ///
  /// Defaults to [TextInputType.text]
  final TextInputType textInputType;

  /// Callback function invoked when submiting the search text field
  final Function(String?)? onSubmitSearch;

  /// The search type on submiting text field or when changing the text field value
  ///```dart
  ///SEARCH_TYPE.onEdit,
  ///SEARCH_TYPE.onSubmit
  ///```
  ///
  /// Defaults to [SearchMode.onEdit].
  final SearchMode searchMode;

  /// Indicate whether the text field input should be obscured or not.
  /// Defaults to `false`.
  final bool obscureText;

  /// Indicate if the search text field is enabled or not.
  /// Defaults to `true`.
  final bool searchFieldEnabled;

  /// The focus node applied on the search text field
  final FocusNode? focusNode;

  /// Function invoked when pressing on item
  /// Defaults to null
  final void Function(T)? onItemSelected;

  /// Indicate whether the clear icon will be displayed or not
  /// by default it's true, to display the clear icon the inputDecoration should not contains suffix icon
  /// otherwise the initial suffix icon will be displayed
  final bool displayClearIcon;

  /// The color applied on the suffix icon (if `displayClearIcon = true`).
  /// Defaults to [Colors.grey].
  final Color? defaultSuffixIconColor;

  ///An async callback invoked when dragging down the list
  ///if onRefresh is nullable the drag to refresh is not applied
  late Future<void> Function()? onRefresh;

  ///Builder callback required  when using [seperated] constructor
  ///return the Widget that will seperate all the elements inside the list
  final Widget Function(BuildContext, int)? separatorBuilder;

  ///The scroll direction of the list
  ///by default [Axis.vertical]
  Axis scrollDirection = Axis.vertical;

  ///The position of the text field (bottom or top)
  ///by default the textfield is displayed on top
  SearchTextPosition searchTextPosition = SearchTextPosition.top;

  ///Callback function invoked each time the listview
  ///reached the bottom
  ///used to create pagination in listview
  Future<dynamic> Function()? onPaginate;

  ///space between the search textfield and the list
  ///by default the padding is set to 20

  ///cusor color used in the search textfield
  final Color? cursorColor;

  ///max lines attribute used in the search textfield
  final int? maxLines;

  ///max length attribute used in the search field
  final int? maxLength;

  ///the text alignement of the search field
  ///by default the alignement is start
  final TextAlign textAlign;

  ///List of strings  to display in an auto complete field
  ///by default list is empty so a simple text field is displayed
  final List<String> autoCompleteHints;

  ///indicate whether the search textfield have it's focus on by default or not
  ///by default [autoFocusOnSearch = true]
  final bool autoFocusOnSearch;

  ///secondary widget will be displayed alongside the search field
  ///by default it's null
  final Widget? secondaryWidget;

  final EdgeInsetsGeometry? padding;

  ///Map of data used to build  searchable expansion list
  ///required when using [expansion] constructor
  late Map<dynamic, List<T>> expansionListData;

  ///callback used when filtering the expansion list
  ///required when using [expansion] constructor
  late Map<dynamic, List<T>> Function(String)? filterExpansionData;

  ///the expansion list title widget builder
  ///required when using [expansion] constructor
  late Widget Function(dynamic) expansionTitleBuilder;

  bool isExpansionList = false;

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState<T>();
}

class _ListViewWidgetState<T> extends State<ListViewWidget<T>> {
  ///create scroll controller instance
  ///attached to the listview widget
  ScrollController scrollController = ScrollController();

  List<T> asyncListResult = [];
  List<T> filtredAsyncListResult = [];

  bool dataDownloaded = false;

  @override
  void initState() {
    super.initState();
    if (widget.onPaginate != null) {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          widget.onPaginate?.call();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.asyncListCallback != null
        ? _renderAsyncListView()
        : _renderListViewWidgetView(
            list: widget.initialList!,
          );
  }

  Widget _renderAsyncListView() {
    return dataDownloaded
        ? _renderListViewWidgetView(list: filtredAsyncListResult)
        : FutureBuilder(
            future: widget.asyncListCallback!.call(),
            builder: (context, snapshot) {
              dataDownloaded =
                  snapshot.connectionState != ConnectionState.waiting;
              if (!dataDownloaded) {
                return Center(
                    child:
                        widget.loadingWidget ?? const DefaultLoadingWidget());
              }
              if (snapshot.data == null) {
                return Center(
                    child: widget.errorWidget ?? const DefaultErrorWidget());
              }
              asyncListResult = snapshot.data as List<T>;
              filtredAsyncListResult = asyncListResult;
              return _renderListViewWidgetView(list: filtredAsyncListResult);
            },
          );
  }

  Widget _renderListViewWidgetView({
    required List<T> list,
  }) {
    return Column(
      children: widget.searchTextPosition == SearchTextPosition.top
          ? [
              if (widget.searchFieldEnabled)
                SearchTextField(
                  filterList: _filterList,
                  focusNode: widget.focusNode,
                  inputDecoration: widget.inputDecoration,
                  keyboardAction: widget.keyboardAction,
                  obscureText: widget.obscureText,
                  onSubmitSearch: widget.onSubmitSearch,
                  searchFieldEnabled: widget.searchFieldEnabled,
                  searchMode: widget.searchMode,
                  searchTextController: widget.searchTextController,
                  textInputType: widget.textInputType,
                  displayClearIcon: widget.displayClearIcon,
                  defaultSuffixIconColor: widget.defaultSuffixIconColor,
                  textStyle: widget.style,
                  cursorColor: widget.cursorColor,
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines,
                  textAlign: widget.textAlign,
                  autoCompleteHints: widget.autoCompleteHints,
                  autoFocus: widget.autoFocusOnSearch,
                ),
              _renderListView(
                list: list,
              ),
            ]
          : [
              _renderListView(
                list: list,
              ),
              if (widget.searchFieldEnabled)
                SearchTextField(
                  filterList: _filterList,
                  focusNode: widget.focusNode,
                  inputDecoration: widget.inputDecoration,
                  keyboardAction: widget.keyboardAction,
                  obscureText: widget.obscureText,
                  onSubmitSearch: widget.onSubmitSearch,
                  searchFieldEnabled: widget.searchFieldEnabled,
                  searchMode: widget.searchMode,
                  searchTextController: widget.searchTextController,
                  textInputType: widget.textInputType,
                  displayClearIcon: widget.displayClearIcon,
                  defaultSuffixIconColor: widget.defaultSuffixIconColor,
                  textStyle: widget.style,
                  cursorColor: widget.cursorColor,
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines,
                  textAlign: widget.textAlign,
                  autoCompleteHints: widget.autoCompleteHints,
                  autoFocus: widget.autoFocusOnSearch,
                ),
            ],
    );
  }

  ///creates listview based on the items passed to the widget
  ///check whether the [widget.onRefresh] parameter is nullable or not
  ///if [widget.displayDividder] is true
  /// function will runder [ListView.separated]
  ///else the function will render a normal listview [ListView.builder]
  Widget _renderListView({
    required List<T> list,
  }) {
    if (list.isEmpty) {
      return widget.emptyWidget ??
          const Expanded(child: Center(child: DefaultEmptyWidget()));
    } else {
      return Expanded(
        child: widget.onRefresh != null
            ? RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: widget.onRefresh!,
                child: ListView.separated(
                  padding: widget.padding,
                  controller: scrollController,
                  scrollDirection: widget.scrollDirection,
                  itemCount: list.length,
                  separatorBuilder: widget.separatorBuilder!,
                  itemBuilder: (context, index) => ListItem<T>(
                    builder: widget.builder,
                    item: list[index],
                    onItemSelected: widget.onItemSelected,
                  ),
                ),
              )
            : ListView.separated(
                padding: widget.padding,
                controller: scrollController,
                scrollDirection: widget.scrollDirection,
                itemCount: list.length,
                separatorBuilder: widget.separatorBuilder!,
                itemBuilder: (context, index) => ListItem<T>(
                  builder: widget.builder,
                  item: list[index],
                  onItemSelected: widget.onItemSelected,
                ),
              ),
      );
    }
  }

  void _filterList(String value) {
    if (widget.isExpansionList) {
      setState(() {
        widget.expansionListData =
            widget.filterExpansionData?.call(value) ?? {};
      });
    } else if (widget.asyncListCallback != null) {
      setState(() {
        filtredAsyncListResult = widget.asyncListFilter!(
          value,
          asyncListResult,
        );
      });
    } else {
      setState(() {
        widget.initialList = widget.filter!(value);
      });
    }
  }
}
