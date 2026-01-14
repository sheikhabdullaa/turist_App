import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import 'package:turist_app/utils/app_colors.dart';

class DatePickerField extends StatefulWidget {
  final String label;
  final String hint;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateChanged;

  const DatePickerField({
    super.key,
    required this.label,
    this.hint = 'dd/mm/yyyy',
    this.selectedDate,
    required this.onDateChanged,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  late TextEditingController _controller;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.selectedDate != null
          ? _dateFormat.format(widget.selectedDate!)
          : '',
    );
  }

  @override
  void didUpdateWidget(covariant DatePickerField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _controller.text = widget.selectedDate != null
          ? _dateFormat.format(widget.selectedDate!)
          : '';
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(data: Theme.of(context).copyWith(), child: child!);
      },
    );

    if (picked != null) {
      widget.onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: true,
      onTap: _selectDate,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.calendar_month_outlined,
          color: AppColors.grey,
        ),

        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(67, 158, 158, 158),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(67, 158, 158, 158),
          ),
        ),
      ),
    );
  }
}
