#include "CommonListModel.h"

CommonListModel::CommonListModel(QObject *parent) : QAbstractListModel(parent)
{
    setTitleStr("crisitino");
    m_data.append(DataItem{"我的测试1","我的测试2"});
    m_data.append(DataItem{"我的测试3","我的测试4"});
}

CommonListModel::~CommonListModel()
{

}

QString CommonListModel::titleStr() const
{
    return m_titleStr;
}

void CommonListModel::setTitleStr(const QString& title)
{
    m_titleStr = title;
    emit titleStrChanged();
}

int CommonListModel::rowCount(const QModelIndex&) const
{
    return m_data.size();
}

QVariant CommonListModel::data(const QModelIndex &index, int role) const
{
    auto row = index.row();
    if(row > m_data.size())
        return QVariant();

    switch (role)
    {
    case nickname1:
        return m_data[row].nickname1;
    case nickname2:
        return m_data[row].nickname2;
    }
    return QVariant();
}

QHash<int, QByteArray> CommonListModel::roleNames() const
{
    return {
        {nickname1,"nickname1"},
        {nickname2,"nickname2"},
    };
}

