part of '../home_view.dart';

class _ActiveChip extends StatelessWidget {
  const _ActiveChip();

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: context.paddingLow,
      label: Text(
        'label active',
        style:
            context.textTheme.bodySmall?.copyWith(color: ColorConstants.white),
      ),
      backgroundColor: ColorConstants.primaryColor,
    );
  }
}

class _PassiveChip extends StatelessWidget {
  const _PassiveChip();

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        'label passive',
        style:
            context.textTheme.bodySmall?.copyWith(color: ColorConstants.gray),
      ),
      backgroundColor: ColorConstants.grayLighter,
      padding: context.paddingLow,
    );
  }
}
