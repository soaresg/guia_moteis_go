import 'package:flutter/material.dart';
import 'package:guia_moteis/src/shared/screen_utils.dart';

class VerTodosButton extends StatelessWidget {
  const VerTodosButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => debugPrint('Usuário pressionou em ver todos'),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil.blockSizeHorizontal),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(ScreenUtil.getRadiusBotoes(1)),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: ScreenUtil.blockSizeHorizontal * 6,
                child: Text(
                  'ver todos',
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward_ios, size: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
