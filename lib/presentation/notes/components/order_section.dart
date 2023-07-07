import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';
import 'package:flutter_note_app/domain/util/order_type.dart';

class OrderSection extends StatelessWidget {
  final NoteOrder noteOrder;
  final Function(NoteOrder noteOrder) onOrderChanged;

  const OrderSection({
    super.key,
    required this.noteOrder,
    required this.onOrderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              value: NoteOrder.title(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(
                  NoteOrder.title(noteOrder.orderType),
                );
              },
              activeColor: Colors.white,
            ),
            Text("제목"),
            Radio<NoteOrder>(
              value: NoteOrder.date(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(
                  NoteOrder.date(noteOrder.orderType),
                );
              },
              activeColor: Colors.white,
            ),
            Text("날짜"),
            Radio<NoteOrder>(
              value: NoteOrder.color(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(
                  NoteOrder.color(noteOrder.orderType),
                );
              },
              activeColor: Colors.white,
            ),
            Text("색상"),
          ],
        ),
        Row(
          children: [
            Radio<OrderType>(
              value: OrderType.ascending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(
                  noteOrder.copyWith(
                    orderType: const OrderType.ascending(),
                  ),
                );
              },
              activeColor: Colors.white,
            ),
            Text("오름차순"),
            Radio<OrderType>(
              value: OrderType.descending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(
                  noteOrder.copyWith(
                    orderType: const OrderType.descending(),
                  ),
                );
              },
              activeColor: Colors.white,
            ),
            Text("내림차순"),
          ],
        ),
      ],
    );
  }
}
