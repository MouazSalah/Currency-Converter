import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/modules/lookups/domain/entities/currency.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/bloc/currency_bloc.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/bloc/currency_bloc_event.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/bloc/currency_bloc_state.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/widgets/bottom_sheet_header.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/widgets/currency_listview_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrenciesBottomSheet extends StatefulWidget {
  final Function(Currency) selectedCurrency;
  CurrenciesBottomSheet(
      {super.key, required this.selectedCurrency});

  @override
  State<CurrenciesBottomSheet> createState() => _CurrenciesBottomSheetState();
}

class _CurrenciesBottomSheetState extends State<CurrenciesBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyBloc(),
      child: BlocConsumer<CurrencyBloc, CurrencyBlocState>(
        listener: _blocListener,
        builder: _blocBuilder,
      ),
    );
  }

  void _blocListener(BuildContext context, CurrencyBlocState state) {}

  Widget _blocBuilder(BuildContext context, CurrencyBlocState state) {
    var currenciesBloc = BlocProvider.of<CurrencyBloc>(context);
    return BlocBuilder<CurrencyBloc, CurrencyBlocState>(
        builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.colorWhite900, // Set background BodyShape to white
          borderRadius: BorderRadius.circular(8.0), // Set corner radius to 8
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            BottomSheetHeader(title: 'currencies'.tr()),
            Expanded(
              child: ListView.builder(
                itemCount: currenciesBloc.bodyShapes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      CurrencyListviewItem(
                        currency: currenciesBloc.bodyShapes[index],
                        onPressed: (bodyShape) {
                          widget.selectedCurrency.call(bodyShape);
                        },
                      ),
                      if (index < currenciesBloc.bodyShapes.length - 1)
                        const Divider(
                          height: 1,
                          color: AppColors.colorNeutral100,
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}




void showCurrenciesBottomSheet(
    {required BuildContext context,
    required Function(Currency) onSelected}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return CurrenciesBottomSheet(
        selectedCurrency: (p0) {
          onSelected.call(p0);
          Navigator.of(context).pop();
        },
      );
    },
  );
}
