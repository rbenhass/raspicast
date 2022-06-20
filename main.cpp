#include "raspicastgui.h"
#include "client.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    //RaspiCastGui w;
    //w.show();
    Client client;
    client.show();
    return a.exec();
}
