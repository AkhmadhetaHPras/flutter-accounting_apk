import 'package:accounting_apk/constants.dart';
import 'package:accounting_apk/size_config.dart';
import 'package:flutter/material.dart';
import 'package:accounting_apk/components/default_button.dart';
import 'package:accounting_apk/components/form_error.dart';
import 'package:intl/intl.dart';

class CashInForm extends StatefulWidget {
  const CashInForm({super.key});

  @override
  State<CashInForm> createState() => _CashInFormState();
}

class _CashInFormState extends State<CashInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountInput = TextEditingController();
  TextEditingController labelInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildAmountFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLabelFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDateFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTimeFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Save",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildTimeFormField() {
    return TextFormField(
      controller: timeInput,
      decoration: const InputDecoration(
        labelText: "Time",
        hintText: "Enter the time",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.access_time),
      ),
      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            );
          },
        );

        if (pickedTime != null) {
          removeError(error: kTimeNullError);

          setState(() {
            final hour = pickedTime.hour.toString();
            final minute = pickedTime.minute.toString();
            final time = '$hour : $minute';
            timeInput.text = time; //set output date to TextField value.
          });
        } else {
          addError(error: kTimeNullError);
        }
      },
    );
  }

  TextFormField buildDateFormField() {
    return TextFormField(
      controller: dateInput,
      //editing controller of this TextField
      decoration: const InputDecoration(
        labelText: "Date",
        hintText: "Enter the date",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_month_rounded),
      ),
      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          removeError(error: kDateNullError);
          //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            dateInput.text = formattedDate;
          });
        } else {
          addError(error: kDateNullError);
        }
      },
    );
  }

  TextFormField buildLabelFormField() {
    return TextFormField(
      onSaved: (newValue) {
        if (newValue != null) {
          labelInput.text = newValue;
        } else {
          labelInput.text = "";
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLabelNullError);
        } else if (value.length >= 3) {
          removeError(error: kShortLabelError);
        }
        labelInput.text = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLabelNullError);
          return "";
        } else if (value.length < 3) {
          addError(error: kShortLabelError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Label",
        hintText: "Enter label for this cash in",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.label_important_outline_rounded),
      ),
    );
  }

  TextFormField buildAmountFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) {
        if (newValue != null) {
          amountInput.text = newValue;
        } else {
          amountInput.text = "";
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAmountNullError);
        } else if (amountValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidAmountError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAmountNullError);
          return "";
        } else if (!amountValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidAmountError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Cash In",
        hintText: "Enter cash in amount",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.currency_exchange_rounded),
      ),
    );
  }
}
