import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';
import 'package:viajes/presentation/widgets/client/appBar/appbar.dart';
import 'package:viajes/presentation/widgets/client/containers/primary_header_container.dart';
import 'package:viajes/presentation/widgets/shared/t_settings_menu_tile.dart';
import 'package:viajes/presentation/widgets/shared/t_user_profile_title.dart';
import 'package:viajes/presentation/widgets/texts/section_heading.dart';

class SettingsViewClient extends StatelessWidget {
  const SettingsViewClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  showBackArrow: false,
                  title: Text('Configuraciones',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white)),
                ),
                const TUserProfileTitle(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            )),
            //* body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeadings(title: 'Configuraciones de perfil'),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.people,
                    title: 'Editar perfil',
                    subtitle: 'Cambiar nombre, correo, contraseña',
                    ontap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.calendar_tick,
                    title: 'My Reservaciones',
                    subtitle: 'Ver todas tus reservaciones',
                    ontap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.wallet_money4,
                    title: 'Metodos de pago',
                    subtitle: 'Agrega o elimina metodos de pago',
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TSectionHeadings(title: 'Configuraciones de cuenta'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Icons.verified_user,
                    title: 'Datos de usuarios',
                    subtitle: 'Cambiar nombre de usuario, correo, contraseña',
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  //* Logout
                  TSettingsMenuTile(
                    icon: Icons.logout,
                    title: 'Cerrar sesion',
                    subtitle: 'Cerrar sesion de la cuenta',
                    ontap: () async {
                      final SecureStorage secureStorage = SecureStorage();
                      await secureStorage.deleteToken();
                      // ignore: use_build_context_synchronously
                      context.go('/login');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
