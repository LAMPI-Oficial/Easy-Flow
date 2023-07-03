import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final bool searchFieldEnabled;
  final InputDecoration? inputDecoration;
  final TextEditingController? searchTextController;
  final TextInputAction keyboardAction;
  final TextInputType textInputType;
  final bool obscureText;
  final SearchMode searchMode;
  final Function(String) filterList;
  final Function(String)? onSubmitSearch;
  final bool displayClearIcon;
  final Color? defaultSuffixIconColor;
  final TextStyle? textStyle;
  final Color? cursorColor;
  final int? maxLines;
  final int? maxLength;
  final TextAlign textAlign;
  final List<String> autoCompleteHints;
  final bool autoFocus;

  const SearchTextField({
    Key? key,
    required this.filterList,
    required this.focusNode,
    required this.inputDecoration,
    required this.keyboardAction,
    required this.obscureText,
    required this.onSubmitSearch,
    required this.searchFieldEnabled,
    required this.searchMode,
    required this.searchTextController,
    required this.textInputType,
    required this.displayClearIcon,
    this.defaultSuffixIconColor,
    required this.textStyle,
    required this.cursorColor,
    required this.maxLines,
    required this.maxLength,
    required this.textAlign,
    required this.autoCompleteHints,
    required this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: autoCompleteHints.isNotEmpty
          ? Autocomplete(
              optionsBuilder: (textEditingValue) {
                return autoCompleteHints;
              },
              onSelected: (option) {
                filterList(option.toString());
                FocusScope.of(context).requestFocus(FocusNode());
              },
              fieldViewBuilder: (
                context,
                textEditingController,
                focusNode,
                onFieldSubmitted,
              ) {
                return TextField(
                  cursorColor: cursorColor,
                  maxLength: maxLength,
                  maxLines: maxLines,
                  textAlign: textAlign,
                  focusNode: focusNode,
                  enabled: searchFieldEnabled,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: inputDecoration?.copyWith(
                    prefixIcon: inputDecoration?.prefixIcon ??
                        const SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.search),
                        ),
                    suffixIcon: inputDecoration?.suffixIcon ??
                        _renderSuffixIcon(context),
                    border: inputDecoration?.border ?? InputBorder.none,
                  ),
                  style: textStyle,
                  controller: textEditingController,
                  onChanged: (value) {
                    filterList(value);
                  },
                );
              },
            )
          : TextField(
              cursorColor: cursorColor,
              maxLength: maxLength,
              maxLines: maxLines,
              textAlign: textAlign,
              focusNode: focusNode,
              enabled: searchFieldEnabled,
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.search),
                ),
                suffixIcon: _renderSuffixIcon(context),
                border: InputBorder.none,
              ),
              textAlignVertical: TextAlignVertical.center,
              autofocus: autoFocus,
              style: textStyle,
              controller: searchTextController,
              textInputAction: keyboardAction,
              keyboardType: textInputType,
              obscureText: obscureText,
              onSubmitted: (value) {
                onSubmitSearch?.call(value);
                if (searchMode == SearchMode.onSubmit) {
                  filterList(value);
                }
              },
              onChanged: (value) {
                if (searchMode == SearchMode.onEdit) {
                  filterList(value);
                }
              },
            ),
    );
  }

  Widget? _renderSuffixIcon(context) {
    return !displayClearIcon
        ? null
        : searchTextController!.text.isNotEmpty
            ? SizedBox(
                height: 50,
                width: 50,
                child: IconButton(
                  onPressed: () {
                    searchTextController!.clear();
                    filterList(searchTextController?.text ?? '');
                  },
                  icon: Icon(
                    Icons.clear,
                    color: defaultSuffixIconColor ??
                        Theme.of(context).colorScheme.primary,
                  ),
                ))
            : Container();
  }
}

enum SearchMode {
  onEdit,
  onSubmit,
}

enum SearchTextPosition {
  top,
  bottom,
}
