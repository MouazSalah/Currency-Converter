import 'dart:ui';
import 'package:contactcars_app_retail/component/base_app_bar.dart';
import 'package:contactcars_app_retail/component/price_text_field.dart';
import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:contactcars_app_retail/core/assets/app_fonts.dart';
import 'package:contactcars_app_retail/core/extensions/extensions.dart';
import 'package:contactcars_app_retail/modules/convertion/advanced_filter/screen/currency_converter_bloc.dart';
import 'package:contactcars_app_retail/modules/convertion/advanced_filter/screen/currency_converter_bloc_state.dart';
import 'package:contactcars_app_retail/modules/lookups/widgets/currency/select_body_shape_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyConverterBloc(),
      child: BlocConsumer<CurrencyConverterBloc, CurrencyConverterBlocState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: BaseAppBar(title: "currency_converter".tr()),
              ),
              body: CurrencyConverterContent(context),
            );
          }),
    );
  }

  Widget CurrencyConverterContent(BuildContext mainContext) {
    var currencyConverterBloc =
        BlocProvider.of<CurrencyConverterBloc>(mainContext);
    return Container(
      color: AppColors.colorDarkBlue100,
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                _yearWidget(mainContext, currencyConverterBloc),
                const SizedBox(
                  height: 1,
                ),
                _kiloMetersWidget(mainContext, currencyConverterBloc),
                const SizedBox(
                  height: 1,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  _yearWidget(
      BuildContext context, CurrencyConverterBloc currencyConverterBloc) {
    return Container(
      color: AppColors.colorWhite900,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "filter_year".tr(),
            style: const TextStyle(
                fontFamily: AppFonts.ibmRegular,
                fontSize: 14,
                color: AppColors.colorBlue800),
          ),
          verticalSpace(6),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showCurrenciesBottomSheet(
                        context: context,
                        onSelected: (selectedItem) {
                          currencyConverterBloc.currencyFrom = selectedItem;
                        });
                    setState(() {});
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      border: Border.all(
                        color: AppColors.colorDarkBlue100,
                        width: 1.0,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          currencyConverterBloc.currencyFrom?.id != null
                              ? '${currencyConverterBloc.currencyFrom?.id ?? 0}'
                              : "from".tr(),
                          style: TextStyle(
                              color:
                                  currencyConverterBloc.currencyFrom?.id == null
                                      ? AppColors.colorDarkBlue400
                                      : AppColors.colorBlue700,
                              fontSize: 13,
                              fontFamily:
                                  currencyConverterBloc.currencyFrom?.id == null
                                      ? AppFonts.ibmRegular
                                      : AppFonts.ibmSemiBold),
                        ),
                        const Spacer(),
                        if (currencyConverterBloc.currencyFrom?.id == null)
                          SizedBox(
                            width: 11,
                            height: 11,
                            child: Image.asset("assets/images/downArrow.png"),
                          )
                        else
                          InkWell(
                            onTap: () {
                              currencyConverterBloc.currencyFrom?.id = null;
                              // currencyConverterBloc.add(ReloadFilterMotorcyclesUIEvent());
                            },
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: AppColors.colorDarkBlue600,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showCurrenciesBottomSheet(
                        context: context,
                        onSelected: (selectedItem) {
                          currencyConverterBloc.currencyTo = selectedItem;
                        });
                    setState(() {});
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      border: Border.all(
                        color: AppColors.colorDarkBlue100,
                        width: 1.0,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          currencyConverterBloc.currencyTo?.id != null
                              ? '${currencyConverterBloc.currencyTo} ${currencyConverterBloc.currencyTo?.currencySymbol}'
                              : "to".tr(),
                          style: TextStyle(
                              color:
                                  currencyConverterBloc.currencyTo?.id == null
                                      ? AppColors.colorDarkBlue400
                                      : AppColors.colorBlue700,
                              fontSize: 13,
                              fontFamily:
                                  currencyConverterBloc.currencyTo?.id == null
                                      ? AppFonts.ibmRegular
                                      : AppFonts.ibmSemiBold),
                        ),
                        const Spacer(),
                        if (currencyConverterBloc.currencyTo?.id == null)
                          SizedBox(
                            width: 11,
                            height: 11,
                            child: Image.asset("assets/images/downArrow.png"),
                          )
                        else
                          InkWell(
                            onTap: () {
                              currencyConverterBloc.currencyTo?.id = null;
                              // currencyConverterBloc.add(ReloadFilterMotorcyclesUIEvent());
                            },
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: AppColors.colorDarkBlue600,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _kiloMetersWidget(
      BuildContext context, CurrencyConverterBloc currencyConverterBloc) {
    return Container(
      color: AppColors.colorWhite900,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "amout".tr(),
            style: const TextStyle(
                fontFamily: AppFonts.ibmRegular,
                fontSize: 14,
                color: AppColors.colorBlue800),
          ),
          const SizedBox(
            height: 10,
          ),
          PriceAmountTextField(
            controller: currencyConverterBloc.priceAmountController,
            onPriceValueChanged: (int value) {
              /// currencyConverterBloc.currencyFrom = value;
            },
            hint: 'from'.tr(),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
