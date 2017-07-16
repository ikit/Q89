#include "tools.h"
#include <QDebug>
#include <QJsonObject>
#include <QJsonArray>

Tools::Tools(QObject *parent) :
    QObject(parent)
{

}



void Tools::saveJsonFile(const QString &data, const QUrl &url)
{
    mFile.setFileName(url.toLocalFile());
    mFile.open(QIODevice::WriteOnly|QIODevice::Text);
    QTextStream out(&mFile);
    out<<data;
    mFile.close();
}

QVariantMap Tools::loadJsonFile(const QUrl &url)
{

    qDebug()<<url;

    mFile.setFileName(":" + url.path());
    mFile.open(QIODevice::ReadOnly|QIODevice::Text);
    QString text = mFile.readAll();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(text.toUtf8());
    QVariantMap var = jsonDoc.toVariant().toMap();
    mFile.close();



    return var;
}



//int Tools::loadJsonFile(const QUrl &url)
//{

//}

QVariant Tools::test()
{


    QVariantList list;
    list << 10 << 43 << "bottles";

    qDebug()<<"C++"<<list.length();
    return QVariant::fromValue(list);
}

