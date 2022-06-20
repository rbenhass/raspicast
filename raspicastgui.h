#ifndef RASPICASTGUI_H
#define RASPICASTGUI_H

#include <QMainWindow>
#include <QDataStream>
#include <QDialog>
#include <QTcpSocket>
QT_BEGIN_NAMESPACE
class QComboBox;
class QLabel;
class QLineEdit;
class QPushButton;
class QTcpSocket;
class QNetworkSession;
QT_END_NAMESPACE

class RaspiCastGui : public QDialog
{
    Q_OBJECT

public:
    RaspiCastGui();
    ~RaspiCastGui();
private:
    QComboBox *hostCombo = nullptr;
    QLineEdit *portLineEdit = nullptr;
    QLabel *statusLabel = nullptr;
    QPushButton *getFortuneButton = nullptr;
};
#endif // RASPICASTGUI_H
