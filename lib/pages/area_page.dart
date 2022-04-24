import 'package:area_api/blocs/wilayah_blocs/wilayah_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:area_api/blocs/wilayah_blocs/wilayah_bloc.dart';
import 'package:area_api/models/wilayah_model.dart';

class AreaPage extends StatefulWidget {
  const AreaPage({Key? key}) : super(key: key);

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final WilayahBloc _areaBloc = WilayahBloc();
  final WilayahModel model = WilayahModel();
  String? selectedValue = "ACEH";

  @override
  void initState() {
    _areaBloc.add(GetWilayahList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wilayah Indonesia'),
      ),
      body: _buildListWilayah(),
    );
  }

  Widget _buildListWilayah() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _areaBloc,
        child: BlocListener<WilayahBloc, WilayahState>(
          listener: (context, state) {
            if (state is WilayahError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<WilayahBloc, WilayahState>(
            builder: (context, state) {
              if (state is WilayahInitial) {
                return _buildLoading();
              } else if (state is WilayahLoading) {
                return _buildLoading();
              } else if (state is WilayahLoaded) {
                print(state.wilayahModel);
                return _buildCard(context, state.wilayahModel);
              } else if (state is WilayahError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, WilayahModel model) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var i = 0; i < model.values!.length; i++) {
      menuItems.add(
        DropdownMenuItem(
          child: Text("${model.values![i].name}"),
          value: "${model.values![i].name}",
        ),
      );
    }
    

    return DropdownButton(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          print(selectedValue);
          selectedValue = newValue!;
        });
      },
      items: menuItems,
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}