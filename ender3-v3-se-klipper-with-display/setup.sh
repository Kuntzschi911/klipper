#!/bin/bash

# Ender 3 V3 SE Klipper Setup Script
# Dieses Script hilft bei der Konfiguration des Ender 3 V3 SE mit Klipper

echo "========================================"
echo "Ender 3 V3 SE Klipper Setup"
echo "========================================"
echo ""

# Farben für Output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funktionen
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Serielle Verbindung finden
find_serial() {
    log_info "Suche nach serieller Verbindung..."
    
    SERIAL_DEVICES=$(ls /dev/serial/by-id/ 2>/dev/null)
    
    if [ -z "$SERIAL_DEVICES" ]; then
        log_error "Keine seriellen Geräte gefunden. Prüfe USB-Verbindung zum Drucker."
        return 1
    fi
    
    echo "Gefundene serielle Geräte:"
    for device in $SERIAL_DEVICES; do
        echo "  /dev/serial/by-id/$device"
    done
    
    return 0
}

# MCU Firmware kompilieren
compile_firmware() {
    log_info "Kompiliere Klipper Firmware für STM32F103..."
    
    cd ~/klipper
    make clean
    make menuconfig
    make -j$(nproc)
    
    if [ $? -eq 0 ]; then
        log_success "Firmware erfolgreich kompiliert."
        log_info "Firmware befindet sich in: ~/klipper/out/klipper.bin"
        log_warning "Kopiere klipper.bin auf SD-Karte und stecke sie in den Drucker ein."
    else
        log_error "Firmware-Kompilierung fehlgeschlagen."
        return 1
    fi
}

# Hauptmenü
show_menu() {
    echo ""
    echo "Was möchtest du tun?"
    echo "1) Firmware kompilieren"
    echo "2) Serielle Verbindungen anzeigen"
    echo "3) Hilfe anzeigen"
    echo "4) Beenden"
    echo ""
    read -p "Wähle eine Option (1-4): " choice
    
    case $choice in
        1)
            compile_firmware
            ;;
        2)
            find_serial
            ;;
        3)
            show_help
            ;;
        4)
            log_info "Beende Setup..."
            exit 0
            ;;
        *)
            log_error "Ungültige Auswahl."
            show_menu
            ;;
    esac
}

# Hilfe anzeigen
show_help() {
    echo ""
    echo "========================================"
    echo "Ender 3 V3 SE Klipper Setup Hilfe"
    echo "========================================"
    echo ""
    echo "Dieses Script hilft bei der Einrichtung von Klipper für den Ender 3 V3 SE."
    echo ""
    echo "Wichtige Schritte:"
    echo "1. Firmware kompilieren"
    echo "2. klipper.bin auf SD-Karte kopieren"
    echo "3. SD-Karte in Drucker einlegen und einschalten"
    echo "4. Konfiguration anpassen"
    echo ""
}

# Script starten
main() {
    show_menu
}

# Script ausführen
main