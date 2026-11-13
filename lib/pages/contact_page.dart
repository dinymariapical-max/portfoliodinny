// lib/pages/contact_page.dart
import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/stripe_background.dart';
import '../widgets/torn_paper_divider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  static const List<Map<String, dynamic>> _contacts = [
    {
      'label': 'Email',
      'value': 'dinymaria.pical@gmail.com',
      'copyText': 'dinymaria.pical@gmail.com',
      'url': 'mailto:dinymaria.pical@gmail.com',
      'actionLabel': 'Kirim Email',
      'hint': 'Klik untuk salin alamat email & detail kontak',
      'icon': Icons.email_rounded,
    },
    {
      'label': 'WhatsApp / Phone',
      'value': '+62 822-5765-1110',
      'copyText': '+62 822-5765-1110',
      'url': 'https://wa.me/6282257651110',
      'actionLabel': 'Chat WhatsApp',
      'hint': 'Klik untuk salin nomor & link WhatsApp',
      'icon': Icons.chat_rounded,
    },
    {
      'label': 'Location',
      'value': 'Sidoarjo, Jawa Timur, Indonesia',
      'copyText': 'Sidoarjo, Jawa Timur, Indonesia',
      'url':
          'https://www.google.com/maps/search/?api=1&query=Sidoarjo%2C+Jawa+Timur%2C+Indonesia',
      'actionLabel': 'Lihat Lokasi',
      'hint': 'Klik untuk salin lokasi & tautan peta',
      'icon': Icons.location_on_rounded,
    },
    {
      'label': 'Instagram',
      'value': '@dinnymp',
      'copyText': '@dinnymp',
      'url': 'https://instagram.com/dinnymp',
      'actionLabel': 'Buka Instagram',
      'hint': 'Klik untuk salin username & link Instagram',
      'icon': Icons.photo_camera_rounded,
    },
    {
      'label': 'LinkedIn',
      'value': 'Dinny Maria Pical',
      'copyText': 'https://www.linkedin.com/search/results/all/?keywords=Dinny%20Maria%20Pical',
      'url':
          'https://www.linkedin.com/search/results/all/?keywords=Dinny%20Maria%20Pical',
      'actionLabel': 'Buka LinkedIn',
      'hint': 'Klik untuk salin profil LinkedIn',
      'icon': Icons.work_rounded,
    },
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _showThemedSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.darkRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(color: AppColors.cream, width: 1.2),
          ),
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded,
                  color: AppColors.cream, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: GoogleFonts.nunito(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  Future<void> _openContactAction({
    required String label,
    required String value,
    required String copyText,
    required String url,
    required String actionLabel,
    required IconData icon,
    String? preparedMessage,
  }) async {
    HapticFeedback.lightImpact();
    await Clipboard.setData(ClipboardData(text: copyText));
    if (!mounted) return;
    _showThemedSnackBar('$label disalin: $copyText');

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetCtx) {
        return Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 14, 16),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.cream,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.darkRed, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: AppColors.darkRed,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(icon, color: AppColors.cream, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: GoogleFonts.nunito(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w800,
                            color: AppColors.darkRed,
                          ),
                        ),
                        Text(
                          value,
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(sheetCtx),
                    icon: const Icon(Icons.close_rounded,
                        color: AppColors.darkRed),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.lightBlue, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tautan $actionLabel:',
                      style: GoogleFonts.nunito(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkRed,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SelectableText(
                      url,
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    if (preparedMessage != null) ...[
                      const SizedBox(height: 10),
                      const Divider(color: AppColors.lightBlue, height: 1),
                      const SizedBox(height: 10),
                      Text(
                        'Pesan Siap Kirim:',
                        style: GoogleFonts.nunito(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkRed,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SelectableText(
                        preparedMessage,
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _SheetActionButton(
                      icon: Icons.copy_rounded,
                      label: 'Salin Link',
                      filled: false,
                      onTap: () async {
                        await Clipboard.setData(ClipboardData(text: url));
                        if (!mounted) return;
                        Navigator.pop(sheetCtx);
                        _showThemedSnackBar('Link $label berhasil disalin!');
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _SheetActionButton(
                      icon: Icons.check_rounded,
                      label: preparedMessage != null
                          ? 'Salin Pesan'
                          : 'Salin Kontak',
                      filled: true,
                      onTap: () async {
                        await Clipboard.setData(
                          ClipboardData(text: preparedMessage ?? copyText),
                        );
                        if (!mounted) return;
                        Navigator.pop(sheetCtx);
                        _showThemedSnackBar(
                          preparedMessage != null
                              ? 'Pesan siap kirim berhasil disalin!'
                              : '$label berhasil disalin!',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendQuickMessage({required bool toWhatsApp}) {
    final sender = _nameController.text.trim();
    final body = _messageController.text.trim();

    if (body.isEmpty) {
      _showThemedSnackBar('Tulis pesanmu dulu ya sebelum mengirim ✨');
      return;
    }

    final greeting = sender.isEmpty
        ? 'Halo Dinny!\n$body'
        : 'Halo Dinny, saya $sender!\n$body';

    if (toWhatsApp) {
      final encoded = Uri.encodeComponent(greeting);
      _openContactAction(
        label: 'WhatsApp Message',
        value: '+62 822-5765-1110',
        copyText: greeting,
        url: 'https://wa.me/6282257651110?text=$encoded',
        actionLabel: 'Chat WhatsApp',
        icon: Icons.chat_rounded,
        preparedMessage: greeting,
      );
    } else {
      final subject = Uri.encodeComponent(
        sender.isEmpty ? 'Hello from Portfolio!' : 'Message from $sender',
      );
      final encodedBody = Uri.encodeComponent(greeting);
      _openContactAction(
        label: 'Email Message',
        value: 'dinymaria.pical@gmail.com',
        copyText: greeting,
        url:
            'mailto:dinymaria.pical@gmail.com?subject=$subject&body=$encodedBody',
        actionLabel: 'Kirim Email',
        icon: Icons.email_rounded,
        preparedMessage: greeting,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final contentW = math.min(screenW, 660.0);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: const Text('Contact', style: AppTextStyles.appBarTitle),
        iconTheme: const IconThemeData(color: AppColors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Scrapbook header banner
            StripeBackground(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: contentW,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AppColors.darkRed,
                            borderRadius: BorderRadius.circular(24),
                            border:
                                Border.all(color: AppColors.cream, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppColors.darkRed.withValues(alpha: 0.35),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: AppColors.cream,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.16),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.mark_email_unread_rounded,
                                  color: AppColors.darkRed,
                                  size: 34,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                'Let\'s Connect & Collaborate!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 22,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Terbuka untuk kolaborasi kreatif, proyek desain, media sosial, atau diskusi seru!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cream.withValues(alpha: 0.92),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const TornPaperDivider(
                    bottomColor: AppColors.cream,
                    height: 50,
                  ),
                ],
              ),
            ),

            // Contact info & quick message card
            Center(
              child: SizedBox(
                width: contentW,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 8, 22, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionHeading('📬 Contact Info'),
                      const SizedBox(height: 6),
                      Text(
                        'Klik kartu di bawah untuk menyalin dan melihat tautan langsung',
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 14),
                      ..._contacts.map(
                        (c) => _ContactCard(
                          contact: c,
                          onTap: () => _openContactAction(
                            label: c['label'] as String,
                            value: c['value'] as String,
                            copyText: c['copyText'] as String,
                            url: c['url'] as String,
                            actionLabel: c['actionLabel'] as String,
                            icon: c['icon'] as IconData,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Quick Message Card
                      _sectionHeading('💌 Kirim Pesan Cepat'),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: AppColors.lightBlue,
                            width: 1.8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Kamu',
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkRed,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _nameController,
                              decoration: _inputDecoration(
                                hint: 'Misal: Budi dari ITS',
                                icon: Icons.person_outline_rounded,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'Pesan',
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkRed,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _messageController,
                              maxLines: 3,
                              decoration: _inputDecoration(
                                hint: 'Tulis pesan atau ajakan kolaborasi...',
                                icon: Icons.edit_note_rounded,
                              ),
                            ),
                            const SizedBox(height: 16),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final wide = constraints.maxWidth > 420;
                                final waBtn = _FancyActionButton(
                                  icon: Icons.chat_rounded,
                                  label: 'Kirim ke WhatsApp',
                                  filled: true,
                                  onTap: () =>
                                      _sendQuickMessage(toWhatsApp: true),
                                );
                                final emailBtn = _FancyActionButton(
                                  icon: Icons.email_rounded,
                                  label: 'Kirim ke Email',
                                  filled: false,
                                  onTap: () =>
                                      _sendQuickMessage(toWhatsApp: false),
                                );

                                if (wide) {
                                  return Row(
                                    children: [
                                      Expanded(child: waBtn),
                                      const SizedBox(width: 12),
                                      Expanded(child: emailBtn),
                                    ],
                                  );
                                }
                                return Column(
                                  children: [
                                    SizedBox(
                                        width: double.infinity, child: waBtn),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                        width: double.infinity,
                                        child: emailBtn),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.nunito(
        fontSize: 13.5,
        color: Colors.black38,
        fontWeight: FontWeight.w600,
      ),
      prefixIcon: Icon(icon, color: AppColors.darkRed, size: 20),
      filled: true,
      fillColor: AppColors.cream.withValues(alpha: 0.55),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.lightBlue, width: 1.4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.darkRed, width: 1.8),
      ),
    );
  }

  Widget _sectionHeading(String title) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.darkRed,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w800,
              fontSize: 19,
              color: AppColors.darkRed,
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactCard extends StatefulWidget {
  final Map<String, dynamic> contact;
  final VoidCallback onTap;

  const _ContactCard({required this.contact, required this.onTap});

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;
  bool _copied = false;

  Future<void> _handleTap() async {
    setState(() => _copied = true);
    widget.onTap();
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _handleTap,
          child: AnimatedScale(
            scale: _hovered ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutBack,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: _hovered
                  ? Matrix4.translationValues(4.0, -2.0, 0.0)
                  : Matrix4.identity(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: _hovered
                    ? AppColors.white
                    : AppColors.white.withValues(alpha: 0.96),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: _hovered ? AppColors.darkRed : AppColors.lightBlue,
                  width: 1.7,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withValues(alpha: _hovered ? 0.14 : 0.06),
                    blurRadius: _hovered ? 16 : 8,
                    offset: Offset(0, _hovered ? 6 : 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: _hovered
                          ? AppColors.darkRed
                          : AppColors.darkRed.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.contact['icon'] as IconData,
                      color: _hovered ? AppColors.white : AppColors.darkRed,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.contact['label'] as String,
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: AppColors.darkRed,
                          ),
                        ),
                        Text(
                          widget.contact['value'] as String,
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.contact['hint'] as String,
                          style: GoogleFonts.nunito(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _copied
                          ? Colors.green.withValues(alpha: 0.15)
                          : (_hovered ? AppColors.darkRed : AppColors.cream),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: _copied
                            ? Colors.green
                            : AppColors.darkRed.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _copied
                              ? Icons.check_circle_rounded
                              : Icons.arrow_outward_rounded,
                          size: 15,
                          color: _copied
                              ? Colors.green.shade700
                              : (_hovered
                                  ? AppColors.white
                                  : AppColors.darkRed),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _copied ? 'Copied' : 'Buka',
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: _copied
                                ? Colors.green.shade700
                                : (_hovered
                                    ? AppColors.white
                                    : AppColors.darkRed),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FancyActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _FancyActionButton({
    required this.icon,
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  State<_FancyActionButton> createState() => _FancyActionButtonState();
}

class _FancyActionButtonState extends State<_FancyActionButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              color: widget.filled
                  ? (_hovered
                      ? AppColors.darkRed.withValues(alpha: 0.90)
                      : AppColors.darkRed)
                  : (_hovered ? AppColors.darkRed : AppColors.cream),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: AppColors.darkRed, width: 1.8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkRed
                      .withValues(alpha: _hovered ? 0.30 : 0.14),
                  blurRadius: _hovered ? 12 : 6,
                  offset: Offset(0, _hovered ? 5 : 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 18,
                  color: widget.filled || _hovered
                      ? AppColors.white
                      : AppColors.darkRed,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    widget.label,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: widget.filled || _hovered
                          ? AppColors.white
                          : AppColors.darkRed,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SheetActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _SheetActionButton({
    required this.icon,
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: filled ? AppColors.darkRed : AppColors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.darkRed, width: 1.6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
              color: filled ? AppColors.white : AppColors.darkRed,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 13.5,
                fontWeight: FontWeight.w800,
                color: filled ? AppColors.white : AppColors.darkRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
