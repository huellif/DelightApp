symbian:{
LIBS += \
    -lavkon \
    -lapgrfx \
    -lapmime \
    -lcone \
    -lefsrv \
    -lbafl \
    -laknicon \
    -laknnotify \
    -lCommonDialogs \
    -lcentralrepository \
    -ldscstore \
    -lhal

TARGET.EPOCHEAPSIZE = 0x40000 0x4000000

DEPLOYMENT += my_deployment
my_deployment.pkg_prerules += vendorinfo
vendorinfo += "%{\"Max Bondarchenko\"}" ":\"Max << Crazy | Doctor\""
VERSION = 1.5.2

TARGET.CAPABILITY += All -TCB

ICON += DelightApp.svg

#Delight App 1
TARGET.UID3 = 0xE11274FF
DEPLOYMENT.display_name += Delight App

#TARGET.UID3 = 0xE11274EE
#DEPLOYMENT.display_name += Delight App2
}

SOURCES += \
    src/main.cpp \
    src/Delight.cpp \
    src/QCenRep.cpp \
    src/MyFileWatcher.cpp

HEADERS += \
    inc/Delight.h \
    inc/QCenRep.h \
    inc/MyFileWatcher.h

RESOURCES += \
    qml.qrc \
    graphics.qrc \
    other.qrc \
    cmd.qrc

QT += declarative

{SOURCES += qml/*.qml}

DEFINES += QT_USE_FAST_CONCATENATION QT_USE_FAST_OPERATOR_PLUS QT_NO_CAST_TO_ASCII
DEFINES *= QT_USE_QSTRINGBUILDER

TRANSLATIONS += i18n/DelightApp_en.ts i18n/DelightApp_ru.ts

lupdate_only {
    SOURCES = qml/*.*
}

OTHER_FILES += qml/*.* \
                html/*.* \
                cmd/*.*

QMAKE_CXXFLAGS += -std=c++0x
CONFIG += c++11

MMP_RULES += "OPTION gcce -O3"
MMP_RULES += "OPTION gcce -march=armv6"
MMP_RULES += "OPTION gcce -mfpu=vfp"
MMP_RULES += "OPTION gcce -mfloat-abi=softfp"
MMP_RULES += "OPTION gcce -marm"
MMP_RULES += "OPTION gcce -fpermissive"
#MMP_RULES += "OPTION gcce -w"
MMP_RULES += "OPTION gcce -ffast-math"
MMP_RULES += "OPTION gcce -Wno-unused-parameter"
MMP_RULES += "OPTION gcce -std=gnu++0x"


