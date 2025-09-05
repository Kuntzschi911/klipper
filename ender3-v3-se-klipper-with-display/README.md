# Ender 3 V3 SE Klipper Konfiguration mit Display

## Übersicht
Diese Konfiguration ermöglicht es, den Creality Ender 3 V3 SE mit Klipper problemlos zu betreiben. Die Konfiguration umfasst alle notwendigen Einstellungen für optimale Druckergebnisse.

## Funktionen
- ✅ Vollständige Klipper-Konfiguration für Ender 3 V3 SE
- ✅ BLTouch Auto-Bed-Leveling Unterstützung
- ✅ TMC2209 Treiber-Konfiguration
- ✅ KAMP (Klipper Adaptive Meshing & Purging)
- ✅ Optimierte Druck-Makros
- ✅ Display-Integration
- ✅ Filament-Lade/Entlade-Funktionen

## Schnellstart

1. **Installation starten**: `./setup.sh`
2. **Konfiguration anpassen**: Serielle Verbindung in `printer.cfg` eintragen
3. **Firmware flashen**: `klipper.bin` auf SD-Karte kopieren und in Drucker einlegen
4. **Kalibrierung**: BLTouch und PID kalibrieren
5. **Testdruck**: Ersten Druck starten

## Dateien

- **README.md**: Diese Übersichtsdatei
- **INSTALLATION.md**: Detaillierte Installationsanleitung
- **TROUBLESHOOTING.md**: Problembehandlung und häufige Fehler
- **setup.sh**: Automatisches Setup-Script
- **printer-reference.cfg**: Vollständige Referenz-Konfiguration
- **display.cfg**: Display-Konfiguration für das Ender 3 V3 SE LCD

## Support

Bei Problemen:
1. **TROUBLESHOOTING.md** lesen
2. Log-Dateien prüfen: `tail -f ~/printer_data/logs/klippy.log`
3. Community um Hilfe fragen: [Klipper Discourse](https://klipper.discourse.group/)

**Viel Erfolg beim Drucken! 🎯**