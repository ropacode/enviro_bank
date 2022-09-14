import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:enviro_bank/ui/home/bank_account_number_widget.dart';
import 'package:enviro_bank/ui/home/bank_selection_widget.dart';
import 'package:enviro_bank/ui/home/collection_date_widget.dart';
import 'package:enviro_bank/ui/home/compliance_widget.dart';
import 'package:enviro_bank/ui/home/first_name_widget.dart';
import 'package:enviro_bank/ui/home/id_number_widget.dart';
import 'package:enviro_bank/ui/home/last_name_widget.dart';
import 'package:enviro_bank/ui/home/loan_amount_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationFormWidget extends StatefulWidget {
  const ApplicationFormWidget({Key? key}) : super(key: key);

  @override
  State<ApplicationFormWidget> createState() => _ApplicationFormWidgetState();
}

class _ApplicationFormWidgetState extends State<ApplicationFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _bankAccountNumberController =
      TextEditingController();
  final TextEditingController _loanAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Text(
                  S.of(context).loanApplication,
                ),
              ),
              const SizedBox(height: 16),
              FirstNameWidget(controller: _firstNameController),
              const SizedBox(height: 16),
              LastNameWidget(controller: _lastNameController),
              const SizedBox(height: 16),
              IdNumberWidget(controller: _idNumberController),
              const SizedBox(height: 16),
              BankSelectionWidget(bloc: bloc),
              const ComplianceWidget(),
              const SizedBox(height: 16),
              BankAccountNumberWidget(controller: _bankAccountNumberController),
              const SizedBox(height: 16),
              CollectionDateWidget(bloc: bloc),
              const SizedBox(height: 16),
              LoanAmountWidget(controller: _loanAmountController),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    _submit(bloc);
                  }
                },
                child: Text(S.of(context).apply),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(HomeBloc bloc) {
    bloc.add(
      SubmitApplicationEvent(
        application: LoanApplication(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          idNumber: _idNumberController.text.trim(),
          bankAccountNumber: _bankAccountNumberController.text.trim(),
          loanAmount: double.tryParse(_loanAmountController.text.trim()),
        ),
      ),
    );
  }
}
