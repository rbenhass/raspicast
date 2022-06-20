#ifndef CLIENT_H
#define CLIENT_H

#include <QtWidgets>
#include "QDialog"
#include <QDataStream>
#include <QDialog>
#include <QTcpSocket>
//OpenCv
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>

QT_BEGIN_NAMESPACE
class QComboBox;
class QLabel;
class QLineEdit;
class QPushButton;
class QTcpSocket;
class QNetworkSession;
QT_END_NAMESPACE

class Client: public QDialog
{
public:
    explicit Client(QWidget *parent = nullptr);
    bool openCam();

private:
    QComboBox *hostCombo = nullptr;
    QLineEdit *portLineEdit = nullptr;
    QLabel *statusLabel = nullptr;
    QPushButton *getFortuneButton = nullptr;

    QTcpSocket *tcpSocket = nullptr;
    QDataStream in;
    std::vector<uchar> currentBuf;
    QNetworkSession *networkSession = nullptr;
private slots:
    void requestNewFortune();
    void readFortune();
    void displayError(QAbstractSocket::SocketError socketError);
    void enableGetFortuneButton();
    void sessionOpened();
};

#endif // CLIENT_H
