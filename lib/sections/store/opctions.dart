import 'package:flutter/material.dart';
import '../../widgets/single_option.dart';

class Options extends StatefulWidget {
  final List<String> options;
  const Options({required this.options, Key? key}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(widget.options.length, false);
    isSelected[0] = true; 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 38,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          return SingleOption(
            text: widget.options[index],
            selected: isSelected[index],
            onPressed: (bool selected) {
              setState(() {
                isSelected = List<bool>.filled(widget.options.length, false);
                isSelected[index] = selected;
              });
            },
          );
        },
      ),
    );
  }
}
