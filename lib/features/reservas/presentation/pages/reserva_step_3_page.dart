import 'package:backend_tp_p2/features/reservas/data/models/reserva_model.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/bloc/reserva_bloc.dart';
import 'package:backend_tp_p2/features/reservas/presentation/widgets/reserva_step_3_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../injection_container.dart';

class ReservaStep3Page extends StatefulWidget {
  final ReservaModel reservaModel;
  ReservaStep3Page(
      {Key key,
      @required this.reservaModel})
      : super(key: key);

  @override
  _ReservaStep3PageState createState() => _ReservaStep3PageState();
}

class _ReservaStep3PageState extends State<ReservaStep3Page> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservaBloc>.value(
      value: sl<ReservaBloc>()
        ..add(ReservaRequested(reservaModel: widget.reservaModel)),
      child: ReservaStep3Content(
        reservaModel: widget.reservaModel,
      ),
    );
  }
}
