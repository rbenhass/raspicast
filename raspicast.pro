QT       += core gui
QT       += network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    client.cpp \
    main.cpp \
    raspicastgui.cpp

HEADERS += \
    client.h \
    raspicastgui.h
INCLUDEPATH += $$PWD/include/opencv
CONFIG(release, debug|release) {
    # use release lib
    LIBS +=-L$$PWD/lib/Release/ \
                    -lopencv_core348        \
                    -lopencv_highgui348     \
                    -lopencv_imgcodecs348   \
                    -lopencv_imgproc348     \
                    -lopencv_video348       \
                    -lopencv_videoio348     \
                    -lopencv_imgproc348

#... Copy dependency dll
    THIRDPARTY_PATH=$$PWD/bin
    EXTRA_BINFILES += $${THIRDPARTY_PATH}/release/*.dll
    EXTRA_BINFILES_WIN = $${EXTRA_BINFILES}
    EXTRA_BINFILES_WIN ~= s,/,\\,g
    QT_BINFILES ~= s,/,\\,g
    DESTDIR_WIN = $${DESTDIR}
    DESTDIR_WIN ~= s,/,\\,g
    for(FILE,EXTRA_BINFILES_WIN){
                QMAKE_POST_LINK +=$$quote(cmd /c copy /y $${FILE} $${DESTDIR_WIN}$$escape_expand(\n\t))
    }
    QMAKE_POST_LINK += $$quote(cmd /c xcopy /S /Y $${QT_BINFILES} $${DESTDIR_WIN})
}
CONFIG(debug, debug|release) {
    # use debug lib
    LIBS +=-L$$PWD/lib/Debug/ \
                    -lopencv_core348d        \
                    -lopencv_highgui348d     \
                    -lopencv_imgcodecs348d   \
                    -lopencv_imgproc348d     \
                    -lopencv_video348d       \
                    -lopencv_videoio348d     \
                    -lopencv_imgproc348d

THIRDPARTY_PATH=$$PWD/bin
    EXTRA_BINFILES += $${THIRDPARTY_PATH}/debug/*.dll \
    EXTRA_BINFILES_WIN = $${EXTRA_BINFILES}
    EXTRA_BINFILES_WIN ~= s,/,\\,g
    QT_BINFILES ~= s,/,\\,g
    DESTDIR_WIN = $${DESTDIR}
    DESTDIR_WIN ~= s,/,\\,g
    for(FILE,EXTRA_BINFILES_WIN){
                QMAKE_POST_LINK +=$$quote(cmd /c copy /y $${FILE} $${DESTDIR_WIN}$$escape_expand(\n\t))

    }
    QMAKE_POST_LINK += $$quote(cmd /c xcopy /S /Y $${QT_BINFILES} $${DESTDIR_WIN})
}
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
