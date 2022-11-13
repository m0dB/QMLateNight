#pragma once

#include <QSqlQueryModel>

class LibraryTableModel: public QSqlQueryModel
{
    Q_OBJECT
public:
    LibraryTableModel(QObject *parent = nullptr, const QSqlDatabase &db = QSqlDatabase());
};
