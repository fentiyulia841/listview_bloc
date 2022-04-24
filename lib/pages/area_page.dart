import 'package:area_api/blocs/wilayah_blocs/wilayah_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:area_api/blocs/wilayah_blocs/wilayah_bloc.dart';
import 'package:area_api/models/wilayah_model.dart';

class AreaPage extends StatefulWidget {
  const AreaPage({Key? key}) : super(key: key);

  @override
  State<AreaPage> createState() => _WilayahPageState();
}

class _WilayahPageState extends State<AreaPage> {
  final WilayahBloc _areaBloc = WilayahBloc();
  // final WilayahModel _wilayahModel = WilayahModel();

  @override
  void initState() {
    _areaBloc.add(GetWilayahList());
    super.initState();
  }

  List<String> listDropdown = WilayahModel();

  String nCity = "";
  int? valueCity;

  void chooseCity(String value){
    setState(() {
      nCity = value;
    });
  }

  Widget dropdown (BuildContext context) {
    return Container(
      child: DropdownButton<WilayahModel>(
                    value: selectedItem,
                    isExpanded: true,
                    // icon: SvgPicture.asset(
                    //   "assets/icons/svgs/dropdown.svg",
                    //   color: dark,
                    // ),
                    onChanged: (WilayahModel? newValue) {
                      setState(() {
                        selectedItem = newValue;
                      });
                      BlocProvider.of<CreateOrderBloc>(context).add(
                        OrderFieldsChangeEvent(
                          itemId: selectedItem!.itemId,
                          itemName: selectedItem!.itemName,
                          ),
                      );
                    },
                    items: state.itemList.map((WilayahModel item) {
                      return DropdownMenuItem<WilayahModel>(
                        value: item,
                      enabled: !state.listOfItemsForOrder.value.any((element)=>element.id==item.itemId),
                        child: Text(
                          item.itemName,
                          style: of(context).textTheme.bodyText1?.copyWith(
                                color: !state.listOfItemsForOrder.value.any(
                                  (element) => element.id == item.itemId,
                                )
                                    ? dark
                                    : grey,
                                fontWeight:
                                    !state.listOfItemsForOrder.value.any(
                                  (element) => element.id == item.itemId,
                                )
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                        ),
                      );
                    }).toList(),
                  ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wilayah Indonesia'),
      ),
      body: dropdown(),
    );
  }

}
