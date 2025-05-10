import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellvia/app/core/constants/colors.dart';

class UniversalSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onSearch;
  final List<String>? suggestions;

  const UniversalSearchBar({
    Key? key,
    required this.hintText,
    required this.onSearch,
    this.suggestions,
  }) : super(key: key);

  @override
  State<UniversalSearchBar> createState() => _UniversalSearchBarState();
}

class _UniversalSearchBarState extends State<UniversalSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredSuggestions = [];
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final query = _controller.text;
    if (widget.suggestions != null && query.isNotEmpty) {
      setState(() {
        _filteredSuggestions = widget.suggestions!
            .where((s) => s.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _showSuggestions = _filteredSuggestions.isNotEmpty;
      });
    } else {
      setState(() {
        _showSuggestions = false;
      });
    }
  }

  void _onSuggestionTap(String suggestion) {
    _controller.text = suggestion;
    widget.onSearch(suggestion);
    setState(() {
      _showSuggestions = false;
    });
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          onSubmitted: widget.onSearch,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(Icons.search, color: AppColors.primaryBlue),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _controller.clear();
                      setState(() => _showSuggestions = false);
                    },
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.primaryBlue,
                width: 2,
              ),
            ),
          ),
        ),
        if (_showSuggestions)
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              children: _filteredSuggestions
                  .map((s) => ListTile(
                        title: Text(s),
                        onTap: () => _onSuggestionTap(s),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
} 