import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionDateWidget extends StatelessWidget {
  final HomeBloc bloc;

  const CollectionDateWidget({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).collectionDate),
        ElevatedButton(
          onPressed: () async {
            var selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now().add(
                const Duration(
                  days: 10,
                ),
              ),
              firstDate: DateTime.now().add(
                const Duration(
                  days: 1,
                ),
              ),
              lastDate: DateTime.now().add(
                const Duration(
                  days: 400,
                ),
              ),
            );
            if (selectedDate != null) {
              bloc.add(ChangedCollectionDateEvent(date: selectedDate));
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (prev, next) => next is BankOrDateChangedState,
            builder: (context, state) {
              var text = S.of(context).pickCollectionDate;
              if (state.collectionDate != null) {
                text = LoanApplication(collectionDate: state.collectionDate)
                    .collectionDateFormatted!;
              }
              return Text(text);
            },
          ),
        ),
      ],
    );
  }
}
