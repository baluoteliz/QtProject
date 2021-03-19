#ifndef COMMONLISTMODEL_H
#define COMMONLISTMODEL_H

#include <QAbstractListModel>
#include <QList>
#include <QVariant>

class CommonListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QString titleStr READ titleStr NOTIFY titleStrChanged)

    enum RoleNames {
        nickname1 = Qt::UserRole,
        nickname2,
    };
    struct DataItem {
        QString nickname1;
        QString nickname2;
    };

public:
    explicit CommonListModel(QObject *parent = nullptr);
    ~CommonListModel();

    QString titleStr() const;
    void setTitleStr(const QString& title);

protected:
    int rowCount(const QModelIndex&) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;

signals:
    void titleStrChanged();

protected:
    QList<DataItem> m_data;
    QString m_titleStr;
};

#endif // COMMONLISTMODEL_H
