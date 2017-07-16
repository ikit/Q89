#ifndef TOOLS_H
#define TOOLS_H

#include <QObject>
#include <QFile>
#include <QFileInfo>
#include <QUrl>
#include <QJsonDocument>
#include <QAbstractListModel>
#include <QVariant>
class Tools : public QObject
{
    Q_OBJECT
public:
    explicit Tools(QObject *parent = 0);

    Q_INVOKABLE void saveJsonFile(const QString &data, const QUrl &url);

    Q_INVOKABLE QVariantMap loadJsonFile(const QUrl &url);

    Q_INVOKABLE QVariant test();

private:
    QFile mFile;
};

#endif // TOOLS_H
